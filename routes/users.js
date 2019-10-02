var express = require("express");
var router = express.Router();
const crypto = require("crypto");
var cookieParser = require("cookie-parser");
var request = require("request");
var multer = require("multer");
var path = require("path");
//multer
const storage = multer.diskStorage({
  destination: "./public/user/",
  filename: (req, file, cb) => {
    cb(
      null,
      file.originalname + "-" + Date.now() + path.extname(file.originalname)
    );
  }
});
const upload = multer({
  storage: storage
}).single("picture");

/* GET users listing. */
router.get("/", (req, res) => {
  res.render("member");
});

router.post("/signup", (req, res) => {
  var email;
  var name;
  var url;
  if (req.body.provider == "facebook") {
    var token = req.body.access_token;
    request(
      "https://graph.facebook.com/v4.0/me?&fields=picture.type(large){url},name,email&access_token=" +
        token,
      (error, response, body) => {
        var data = JSON.parse(body);
        email = data.email;
        name = data.name;
        url = data.picture.data.url;
        user();
      }
    );
  } else {
    email = req.body.email;
    user();
  }
  function user() {
    con.query(
      "SELECT * FROM user WHERE user.email = '" + email + "'",
      (err, rows) => {
        if (err) throw err;
        if (rows.length == 0) {
          var data = JSON.stringify(req.body);
          var timenow = new Date().getTime();
          var time = String(timenow);
          //encrypt
          var cipher = crypto.createCipher("aes256", data);
          var crypted = cipher.update(time, "utf8", "hex");
          crypted += cipher.final("hex");

          if (req.body.provider == "facebook") {
            var user = {
              provider: "facebook",
              name: name,
              email: email,
              access_token: req.body.access_token,
              access_expired: req.body.access_expired,
              picture: url
            };
            console.log("user:" + JSON.stringify(user));
          } else {
            var user = {
              provider: "native",
              name: req.body.name,
              email: req.body.email,
              password: req.body.password,
              access_token: crypted,
              access_expired: timenow + 600000
            };
          }

          con.query("INSERT INTO user SET ?", user, (err, rows) => {
            con.query(
              "SELECT * FROM user WHERE  user.id = '" + rows.insertId + "'",
              (err, rows) => {
                if (err) throw err;
                var user = {
                  access_token: rows[0].access_token,
                  access_expired: rows[0].access_expired,
                  user: {
                    id: rows.insertId,
                    provider: rows[0].provider,
                    name: rows[0].name,
                    email: rows[0].email,
                    picture: rows[0].picture
                  }
                };

                var obj = {
                  data: user,
                  msg: "註冊成功"
                };

                if (req.body.provider == "facebook") {
                  res.cookie("provider", "facebook");
                  res.cookie("access_token", token);
                  res.cookie("userId", rows[0].id);
                  res.cookie("userPhoto", rows[0].picture);
                } else {
                  res.cookie("provider", "native");
                  res.cookie("access_token", crypted);
                  res.cookie("access_expired", timenow + 600000);
                }
                res.json(obj);
              }
            );
          });
        } else {
          if (req.body.provider == "facebook") {
            var token = rows[0].access_token;
            res.cookie("provider", "facebook");
            res.cookie("access_token", token);
            res.cookie("userId", rows[0].id);
            res.cookie("userPhoto", rows[0].picture);
            res.json(token);
          } else {
            res.json({ title: "此信箱已被註冊，請使用會員登入" });
          }
        }
      }
    );
  }
});

router.post("/signin", (req, res) => {
  var email = req.body.email;
  var pass = req.body.password;

  con.query(
    "SELECT * FROM user WHERE email = '" +
      email +
      "' AND password = '" +
      pass +
      "'",
    (err, rows) => {
      if (err) throw err;
      if (!rows[0]) {
        res.json({ error: "Incorrect account password!" });
      } else {
        var obj = {
          email: rows[0].email,
          password: rows[0].password,
          name: rows[0].name
        };

        var token = {
          access_token: rows[0].access_token,
          access_expired: rows[0].access_expired,
          user: obj
        };
        if (Number(rows.access_expired) > new Date().getTime()) {
          res.cookie("provider", "native");
          res.cookie("access_token", rows[0].access_token);
          res.cookie("access_expired", rows[0].access_expired);
          res.json({ title: "歡迎進入", data: token });
        } else {
          var data = JSON.stringify(obj);
          var timenow = new Date().getTime();
          var time = String(timenow);
          var cipher = crypto.createCipher("aes256", data);
          var crypted = cipher.update(time, "utf8", "hex");
          crypted += cipher.final("hex");
          var token1 = {
            access_token: crypted,
            access_expired: timenow + 600000
          };
          con.query(
            "UPDATE user SET ? WHERE user.id = '" + rows[0].id + "'",
            token1,
            (err, rows) => {
              res.cookie("provider", "native");
              res.cookie("access_token", crypted);
              res.cookie("access_expired", timenow + 600000);

              var out = {
                access_token: crypted,
                access_expired: timenow + 600000,
                user: obj
              };
              res.json({ title: "歡迎進入", data: out });
            }
          );
        }
      }
    }
  );
});

router.get("/profile", (req, res) => {
  if (!req.query.token) {
    var data = req.headers.authorization.substr(7);
  } else {
    var data = req.query.token;
  }
  con.query(
    "SELECT * FROM user WHERE user.access_token = '" + data + "'",
    (err, rows) => {
      if (err) throw err;
      if (rows.length == 0) {
        res.json({ data: "請先登入" });
      } else {
        var data = {
          userid: rows[0].id,
          name: rows[0].name,
          email: rows[0].email,
          password: rows[0].password,
          photo: rows[0].picture,
          access_token: rows[0].access_token
        };
        res.cookie("userId", rows[0].id);
        res.cookie("userPhoto", rows[0].picture);
        res.json({ data });
      }
    }
  );
});
router.post("/picture", (req, res) => {
  upload(req, res, err => {
    if (err) throw err;
    var userid = req.body.userid;
    if (!req.file) {
      var user = {
        name: req.body.inname,
        password: req.body.inpassword
      };
    } else {
      var user = {
        provider: "native",
        name: req.body.inname,
        password: req.body.inpassword,
        picture: req.file.filename
      };
    }

    con.query(
      "UPDATE user SET ?  WHERE user.id =?",
      [user, userid],
      (err, rows, fields) => {
        if (err) throw err;
        res.render("member");
      }
    );
  });
});
router.post("/form", (req, res, next) => {
  var id = req.body.id.toString();
  var time = new Date().getTime().toString();
  var form = {
    userid: id,
    router: id + time
  };
  con.query("INSERT INTO form SET ?", form, (err, rows) => {
    if (err) throw err;
    con.query(
      "SELECT * FROM form WHERE form.id = '" + rows.insertId + "'",
      (err, row, fields) => {
        var router = row[0].router;
        res.send(router);
      }
    );
  });
});

router.get("/form/:router", (req, res) => {
  var router = req.params.router;
  con.query(
    "SELECT * FROM form WHERE router =?",
    router,
    (err, row, fields) => {
      if (err) throw err;
      if (!row[0].info) {
        res.render("form", { form: [] });
      } else {
        var json = JSON.parse(row[0].info);
        var form = {
          router: router,
          title: json.title,
          description: json.description,
          topic: json.topic
        };
        res.render("form", { form: form });
      }
    }
  );
});

router.post("/save", (req, res) => {
  var router = req.body.router;
  var form = {
    title: req.body.title,
    description: req.body.description,
    info: JSON.stringify(req.body)
  };
  con.query(
    "UPDATE form SET ?  WHERE form.router =?",
    [form, router],
    (err, rows, fields) => {
      if (err) throw err;
      res.send(router);
    }
  );
});

router.get("/uploadform/:router", (req, res) => {
  var router = req.params.router;
  con.query(
    "SELECT * FROM form WHERE router =?",
    router,
    (err, row, fields) => {
      var json = JSON.parse(row[0].info);
      var form;
      if (json == null) {
        form = {
          number: router.substr(0, 1),
          router: router,
          title: "",
          description: "",
          topic: ""
        };
      } else {
        form = {
          number: router.substr(0, 1),
          router: router,
          title: json.title,
          description: json.description,
          topic: json.topic
        };
      }
      res.render("userform", { form: form });
    }
  );
});

module.exports = router;
