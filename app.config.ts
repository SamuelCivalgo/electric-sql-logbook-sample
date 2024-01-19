import 'dotenv/config'

export default {
  expo: {
    name: 'logbook-sample-electric',
    version: process.env.VERSION,
    slug: 'civalgo-mobile',
    scheme: 'civalgo-mobile',
    owner: 'civalgo',
    platforms: ['ios', 'android'],
    orientation: 'portrait',
    icon: './assets/icon.png',
    notification: {
      icon: './assets/icon.png',
    },
    runtimeVersion: {
      policy: 'sdkVersion',
    },
    updates: {
      url: `https://u.expo.dev/4f1651bb-0ae8-4f35-b9cf-0aec90281c2a`,
    },
    jsEngine: 'hermes',
    android: {
      package: 'com.civalgo.logbook_sample_electric',
      adaptiveIcon: {
        foregroundImage: './assets/adaptive-icon.png',
        backgroundColor: '#000000',
      },
    },
    locales: {
      fr: './i18n/fr/fr.json',
      en: './i18n/en/en.json',
    },
    ios: {
      bundleIdentifier: 'com.civalgo.logbook_sample_electric',
      supportsTablet: false,
      usesAppleSignIn: true,
      infoPlist: {
        CFBundleAllowMixedLocalizations: true,
      },
    },
    plugins: [
      [
        'expo-media-library',
        {
          photosPermission: 'Allow $(PRODUCT_NAME) to access your photos.',
          savePhotosPermission: 'Allow $(PRODUCT_NAME) to save photos.',
          isAccessMediaLocationEnabled: true,
        },
      ],
      [
        'expo-image-picker',
        {
          photosPermission:
            'The app accesses your photos to let you share them with your friends.',
        },
      ],
      [
        'expo-location',
        {
          locationAlwaysAndWhenInUsePermission:
            'Allow $(Civalgo) to use your location.',
        },
      ],
      [
        'expo-camera',
        {
          cameraPermission: 'Allow $(Civalgo) to access your camera.',
        },
      ],
      '@morrowdigital/watermelondb-expo-plugin',
      [
        'expo-build-properties',
        {
          android: {
            kotlinVersion: '1.8.10',
            enableProguardInReleaseBuilds: true,
            extraProguardRules: '-keep public class com.horcrux.svg.** {*;}',
            gradleProperties: {
              'org.gradle.jvmargs': '-Xmx4608m',
            },
            extraMavenRepos: [
              '../../node_modules/@notifee/react-native/android/libs', // notifee tmp fix found here https://github.com/invertase/notifee/issues/808
            ],
          },
        },
      ],
      'sentry-expo',
      'react-native-email-link',
      'expo-localization',
      'expo-apple-authentication',
      'expo-router',
    ],
  },
}
