const esbuild = require("esbuild");
const ElmPlugin = require("esbuild-plugin-elm");

esbuild.build({
  logLevel: "info",
  entryPoints: ["src/index.js"],
  bundle: true,
  outdir: "dist",
  watch: process.argv.includes("--watch"),
  plugins: [
    ElmPlugin({
      debug: true,
      clearOnWatch: true,
    }),
  ],
}).catch(() => process.exit(1));
