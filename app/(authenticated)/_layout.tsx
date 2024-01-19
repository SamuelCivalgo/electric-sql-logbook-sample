import {  Stack } from 'expo-router'
import React from 'react'

import { useElectricSyncShape } from '../../tools/electric'

export default function Layout() {
  useElectricSyncShape()

  return (
    <>
      <Stack screenOptions={{ headerShown: false }}>
        <Stack.Screen name="index" />
        <Stack.Screen name="home" />
      </Stack>
    </>
  )
}
