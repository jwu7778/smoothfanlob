var express = require("express");
var router = express.Router();

router.get("/:router/detail", (req, res) => {
  var router = req.params.router;
  con.query(
    "SELECT FROM form,message WHERE form.router=message.router AND form.router=?",
    router,
    (err, row, filed) => {
      if (err) throw err;
      console.log("here:" + row);
    }
  );
  var form = {
    title: "你今天好嗎？",
    description: "調查心情",
    router: router
  };
  res.render("details", { router: router, form: form });
});

router.post("/:router/add", (req, res) => {
  var message = req.body;

  con.query("INSERT INTO message set ?", message, (err, row, filed) => {});
});

module.exports = router;
