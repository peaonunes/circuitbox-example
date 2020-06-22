const express = require("express");
const app = express();

app.listen(4000, function () {
  console.log("App listening on port 4000!");
});

app.get("/", function (req, res) {
  const success = new Boolean(req.query.success);
  setTimeout(() => {
    let status = success == true ? 200 : 500;
    res.sendStatus(status);
  }, 250);
});
