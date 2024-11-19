
const path = require('path');
const { ProvidePlugin } = require('webpack');

/** @type {import('webpack').Configuration} */
const extensionConfig = {
  context: path.join(__dirname, 'src'),
  mode: 'none',
  target: "webworker",
  entry: {
    extension: './extension.ts',
  },
  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, 'dist'),
    libraryTarget: 'commonjs',
  },
  resolve: {
    mainFields: ['module', 'main'],
		extensions: ['.ts', '.js'], // support ts-files and js-files
		alias: {},
    fallback: {
			path: require.resolve('path-browserify'),
		},
  },
  module: {
		rules: [
			{
				test: /\.ts$/,
				exclude: /node_modules/,
				use: [
					{
						loader: 'ts-loader',
					},
				],
			},
		],
	},
  externals: {
    vscode: 'commonjs vscode', // ignored because it doesn't exist
  },
  performance: {
    hints: false,

  },
	devtool: 'nosources-source-map',
}

/** @type {import('webpack').Configuration} */

const languageServerConfig = {
  context: path.join(__dirname,'src/language-server'),
  mode: 'none',
  target: "webworker",
  entry: {
    server: './index.ts',
  },
  output: {
    filename: 'thrift-language-server.js',
    path: path.resolve(__dirname, 'dist'),
		libraryTarget: 'var',
		library: 'LanguageServer',
  },
  externals: {
    vscode: 'commonjs vscode', // ignored because it doesn't exist
  },
  resolve: {
    // support reading TypeScript and JavaScript files, 📖 -> https://github.com/TypeStrong/ts-loader
    extensions: ['.ts', '.js'],
    fallback: {
      util: require.resolve('util/'),
      assert: require.resolve('assert/'),
    },
  },
  module: {
    rules: [
      {
        test: /\.ts$/,
        exclude: /node_modules/,
        use: [
          {
            loader: 'ts-loader',
          },
        ],
      },
    ],
  },
  plugins: [
    new ProvidePlugin({
      process: 'process/browser',
    }),
  ],
}

module.exports = [ extensionConfig, languageServerConfig ];