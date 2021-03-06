var express = require("express");
var router = express.Router();

/* GET home page. */
router.post("/store", (req, res, next) => {
  var result = {
    router: req.body.router,
    result: JSON.stringify(req.body.ans),
    time: req.body.time
  };
  con.query("INSERT INTO result SET ?", result, (err, rows) => {
    if (err) throw err;
    res.send("ok");
  });
});
router.get("/show/:router", (req, res) => {
  var router = req.params.router;
  con.query(
    "SELECT * FROM result WHERE router =?",
    router,
    (err, row, fields) => {
      var dict = {};
      for (i = 0; i < row.length; i++) {
        var result = JSON.parse(row[i].result);
        for (r = 0; r < result.length; r++) {
          if (!(result[r].q in dict)) {
            dict[result[r].q] = [];
          }
          dict[result[r].q].push(result[r]);
        }
      }
      res.render("table", { dict: dict });
    }
  );
});
router.get("/show/:router/individual/:number", (req, res) => {
  var router = req.params.router;
  var number = parseInt(req.params.number) - 1;
  con.query(
    "SELECT * FROM result WHERE router =?",
    router,
    (err, row, fields) => {
      var dict = [];
      for (i = 0; i < row.length; i++) {
        var result = JSON.parse(row[i].result);
        dict.push(result);
      }
      console.log("dddd:" + JSON.stringify(dict));
      console.log("length:" + dict.length);
      res.render("individual", {
        dict: dict[number],
        total: dict.length,
        now: number + 1
      });
    }
  );
});
router.post("/showform", (req, res) => {
  var userid = req.body.id;
  con.query("SELECT title,router FROM form WHERE userid = ?", userid, function(
    err,
    rows,
    fields
  ) {
    if (err) throw err;
    res.send({ data: rows });
  });
});
router.post("/deleteform", (req, res) => {
  var router = req.body.router;
  con.query("DELETE FROM form WHERE router = ?", router, function(
    err,
    rows,
    fields
  ) {
    if (err) throw err;
    res.send({ data: rows });
  });
});
module.exports = router;
