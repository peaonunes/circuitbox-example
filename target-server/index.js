const express = require("express");
const app = express();

app.listen(4000, function () {
  console.log("App listening on port 4000!");
});

app.get("/", function (req, res) {
  const success = Boolean(req.query && req.query.success);
  setTimeout(() => {
    let status = success === true ? 200 : 400;
    res.sendStatus(status);
  }, 250);
});
