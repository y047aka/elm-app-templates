module.exports = {
  output: {
    assetModuleFilename: "static/[name][ext]",
  },
  module: {
    rules: [
      {
        test: /\.html$/,
        exclude: /node_modules/,
        loader: 'file-loader'
      },
      {
        test: /\.css$/i,
        use: [
          // Creates `style` nodes from JS strings
          "style-loader",
          // Translates CSS into CommonJS
          "css-loader",
        ],
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: "elm-webpack-loader",
      },
      {
        test: /\.(jpe?g|png|svg)$/,
        type: 'asset/resource'
      },
    ]
  },
  devServer: {
    static: "src",
    open: true
  },
};
