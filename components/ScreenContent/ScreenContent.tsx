import React from 'react'
import { View } from 'react-native'

interface Props {
  children: React.ReactNode
  disableScreenContentPadding?: boolean
}

const ScreenContent = ({ children, disableScreenContentPadding }: Props) => {
  const padding = disableScreenContentPadding ? '' : 'px-4'
  return (
    <View
      className={`flex flex-1 flex-col ${padding}`}
    >
      {children}
    </View>
  )
}

export default ScreenContent
