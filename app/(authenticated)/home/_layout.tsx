import {
  FontAwesome,
} from '@expo/vector-icons'
import { Tabs } from 'expo-router'
import React from 'react'

import { colors } from '../../../themes/colors'

const ICON_SIZE = 20

const Layout = () => {
  return (
    <Tabs
      screenOptions={{
        headerShown: false,
        tabBarActiveBackgroundColor: colors.navBarBackground,
        tabBarInactiveBackgroundColor: colors.navBarBackground,
        tabBarActiveTintColor: colors.lightGray,
      }}
    >
      <Tabs.Screen
        name="index"
        options={{
          title: "Profile",
          tabBarIcon: ({ color }) => (
            <FontAwesome name="user" size={ICON_SIZE} color={color} />
          ),
        }}
      />
    </Tabs>
  )
}

export default Layout
