"use strict";

require("./index.html");
import "./style.scss";
var Elm = require('./Main.elm').Elm;

Elm.Main.init({
  node: document.getElementById("root")
});
