var express = require("express");
var router = express.Router();

router.get("/:router/detail", (req, res) => {
  var router = req.params.router;

  con.query(
    "SELECT user.picture,form.title,form.description,message.userid,message.message FROM user,form,message WHERE form.router=message.router AND form.router=? AND user.id=message.userid",
    router,
    (err, row, filed) => {
      if (err) throw err;
      if (!row[0]) {
        con.query(
          "SELECT title,description FROM form WHERE router=?",
          router,
          (err, rows, filed) => {
            if (err) throw err;
            var form = {
              title: rows[0].title,
              description: rows[0].description,
              router: router
            };
            res.render("details", { router: router, form: form });
          }
        );
      } else {
        var form = {
          title: row[0].title,
          description: row[0].description,
          router: router,
          message: []
        };
        for (i = 0; i < row.length; i++) {
          var message = {
            picture: row[i].picture,
            meg: row[i].message
          };
          form.message.push(message);
        }
        res.render("details", { router: router, form: form });
      }
    }
  );
});

router.post("/:router/add", (req, res) => {
  var message = req.body;
  con.query("INSERT INTO message set ?", message, (err, row, filed) => {
    res.send("ok");
  });
});

module.exports = router;
