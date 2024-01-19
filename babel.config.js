module.exports = function (api) {
  api.cache(true)
  return {
    presets: ['babel-preset-expo'],
    env: {
      production: {
        plugins: ['react-native-paper/babel'],
      },
    },
    plugins: [
      [
        'transform-inline-environment-variables',
        {
          exclude: [
            'EXPO_ROUTER_APP_ROOT',
            'EXPO_ROUTER_PROJECT_ROOT',
            'EXPO_ROUTER_IMPORT_MODE',
            'EXPO_ROUTER_IMPORT_MODE_ANDROID',
            'EXPO_ROUTER_IMPORT_MODE_IOS',
            'EXPO_ROUTER_IMPORT_MODE_WEB',
          ],
        },
      ],
      ['@babel/plugin-proposal-decorators', { legacy: true }],
      '@babel/plugin-proposal-export-namespace-from',
      'nativewind/babel',
      [
        'module-resolver',
        {
          root: ['.'],
          alias: {
            '@assets': './assets',
            '@fonts': './assets/fonts',
            '@images': './assets/images',
            '@icons': './assets/icons',
            '@components': './components',
            '@contexts': './contexts',
            '@themes': './themes',
            '@typings': './typings',
          },
        },
      ],
      'react-native-reanimated/plugin',
    ],
  }
}
