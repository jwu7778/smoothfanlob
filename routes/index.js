var express = require("express");
var router = express.Router();

/* GET home page. */
router.get("/", (req, res) => {
  con.query("SELECT router,title,description FROM form", (err, row) => {
    res.render("page", { form: row });
  });
});

module.exports = router;
