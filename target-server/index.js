const express = require("express");
const app = express();

app.listen(4000, function () {
 console.log("App listening on port 4000!");
});

app.get("/", function (req, res) {
 setTimeout(function(){
    res.sendStatus(200);
 }, 500);
});
