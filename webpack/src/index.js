"use strict";

import "./index.html";
import "./style.css";
import { Elm } from "./Main.elm";

Elm.Main.init({
  node: document.getElementById("root")
});
