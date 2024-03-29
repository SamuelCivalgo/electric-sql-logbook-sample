const { getDefaultConfig } = require('expo/metro-config');

module.exports = (() => {
  const config = getDefaultConfig(__dirname);

  // Transformer configuration from the first config
  const { transformer, resolver } = config;
  config.transformer = {
    ...transformer,
    babelTransformerPath: require.resolve('react-native-svg-transformer'),
    minifierPath: 'metro-minify-terser',
  };

  // Resolver asset and source extensions from the first config
  config.resolver.assetExts = resolver.assetExts.filter(ext => ext !== 'svg');
  config.resolver.sourceExts = [...resolver.sourceExts, 'svg', 'cjs'];

  // Custom resolveRequest function from the second config
  config.resolver.resolveRequest = (context, moduleName, platform) => {
    if (moduleName.startsWith("electric-sql/expo")) {
      return {
        filePath: `${__dirname}/node_modules/electric-sql/dist/drivers/expo-sqlite/index.js`,
        type: "sourceFile",
      }
    }

    if (moduleName.startsWith("electric-sql/react")) {
      return {
        filePath: `${__dirname}/node_modules/electric-sql/dist/frameworks/react/index.js`,
        type: "sourceFile",
      }
    }

    const pattern1 = /^electric-sql\/(?<package1>[-a-zA-Z0-9]+)\/(?<package2>[-a-zA-Z0-9]+)$/
    if (moduleName.match(pattern1)) {
      const { package1, package2 } = pattern1.exec(moduleName).groups;
      return {
        filePath: `${__dirname}/node_modules/electric-sql/dist/${package1}/${package2}/index.js`,
        type: "sourceFile",
      }
    }

    const pattern2 = /^electric-sql\/(?<package>[-a-zA-Z0-9]+)$/
    if (moduleName.match(pattern2)) {
      const { package } = pattern2.exec(moduleName).groups;
      return {
        filePath: `${__dirname}/node_modules/electric-sql/dist/${package}/index.js`,
        type: "sourceFile",
      }
    }

    // Optionally, chain to the standard Metro resolver
    return context.resolveRequest(context, moduleName, platform);
  };

  return config;
})();
