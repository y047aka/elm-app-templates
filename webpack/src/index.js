"use strict";

import "./index.html";
import "./style.css";
import { Elm } from "./Main.elm";
import "../static/logo.svg"

Elm.Main.init({
  node: document.getElementById("root")
});
