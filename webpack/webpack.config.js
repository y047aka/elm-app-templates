var path = require('path');

module.exports = {
  module: {
    rules: [{
        test: /\.html$/,
        exclude: /node_modules/,
        loader: 'file-loader'
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: "elm-webpack-loader",
      }
    ]
  },

  devServer: {
    contentBase: path.join(__dirname, "src"),
    stats: 'errors-only'
  },

};
