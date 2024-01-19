declare const process: {
  env: {
    [key: string]: string | undefined
  }
}

declare module '*.svg' {
  import React from 'react'
  import { SvgProps } from 'react-native-svg'

  const content: React.FC<SvgProps>
  export default content
}
