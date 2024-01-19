import React from 'react'
import { SafeAreaView, StatusBar } from 'react-native'

interface Props {
  children: React.ReactNode
  hasVerticalDrawerBottomPadding?: boolean
  hasStatusBarTopPadding?: boolean
}

const ScreenLayout = (props: Props) => {
  const {
    children,
    hasVerticalDrawerBottomPadding = true,
    hasStatusBarTopPadding = true,
  } = props


  let paddingBottomValue = 0

  if (!hasVerticalDrawerBottomPadding) {
    paddingBottomValue = 0
  }

  return (
    <SafeAreaView
      className="flex h-full w-full flex-col bg-white"
      style={{
        paddingBottom: paddingBottomValue,
        paddingTop: hasStatusBarTopPadding ? StatusBar.currentHeight : 0,
      }}
    >
      {children}
    </SafeAreaView>
  )
}

export default ScreenLayout
