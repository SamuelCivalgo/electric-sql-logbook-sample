import React from 'react'
import { Redirect } from 'expo-router';



const Index = () => {
  return (
    <Redirect href="/(authenticated)/home" />
  )
}

export default Index
