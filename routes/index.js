var express = require("express");
var router = express.Router();

/* GET home page. */
router.get("/", function(req, res, next) {
  con.query("SELECT router,title,description FROM form", (err, row, fields) => {
    res.render("index", { form: row });
  });
});

module.exports = router;
