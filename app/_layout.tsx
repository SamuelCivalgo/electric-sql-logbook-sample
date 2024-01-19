import '../polyfill/Intl'
import 'dayjs/locale/en'
import 'dayjs/locale/fr'

import dayjs from 'dayjs'
import advancedFormat from 'dayjs/plugin/advancedFormat'
import duration from 'dayjs/plugin/duration'
import localizedFormat from 'dayjs/plugin/localizedFormat'
import relativeTime from 'dayjs/plugin/relativeTime'
import { useFonts } from 'expo-font'
import * as NavigationBar from 'expo-navigation-bar'
import { Slot } from 'expo-router'
import ExpoStatusBar from 'expo-status-bar/build/ExpoStatusBar'
import React, { useEffect } from 'react'
import { Platform, View, Text } from 'react-native'
import { Provider as PaperProvider } from 'react-native-paper'
import { SafeAreaProvider } from 'react-native-safe-area-context'


import { colors } from '../themes/colors'
import { ElectricProvider, useElectricProviderDb } from '../tools/electric'

dayjs.extend(duration)
dayjs.extend(advancedFormat)
dayjs.extend(localizedFormat)
dayjs.extend(relativeTime)

const Layout = (): JSX.Element => {
  const electricProviderDb = useElectricProviderDb()

  const [fontsLoaded] = useFonts({
    OpenSans: require('../assets/fonts/OpenSans-Regular.ttf'),
    OpenSansSemiBold: require('../assets/fonts/OpenSans-SemiBold.ttf'),
    OpenSansBold: require('../assets/fonts/OpenSans-Bold.ttf'),
    OpenSansMedium: require('../assets/fonts/OpenSans-Medium.ttf'),
    OpenSansSemiBoldItalic: require('../assets/fonts/OpenSans-SemiBoldItalic.ttf'),
  })

  useEffect(() => {
    if (Platform.OS === 'android') {
      // Works only on Android
      NavigationBar.setBackgroundColorAsync(colors.navBarBackground)
    }
  }, [])


  const loaded = fontsLoaded

  console.log("🚀 ~ electricProviderDb:", electricProviderDb)
  const ready = loaded && electricProviderDb
  console.log("🚀 ~ ready:", ready)

  if(!ready) {
    return <View>
      <Text>Loading</Text>
    </View>
  }

  return (
    <>
      <ElectricProvider db={electricProviderDb}>
            <PaperProvider>
              {ready && (
                <>
                  <ExpoStatusBar style="dark" />
                  <SafeAreaProvider>
                    <Slot />
                  </SafeAreaProvider>
                </>
              )}
            </PaperProvider>
      </ElectricProvider>
    </>
  )
}

export default Layout
