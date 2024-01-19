import { useScrollToTop } from '@react-navigation/native'
import React from 'react'
import { ScrollView, View, Text, Button } from 'react-native'

import ScreenLayout from '../../../components/ScreenLayout/ScreenLayout'
import ScreenContent from '../../../components/ScreenContent/ScreenContent'
import { useFetchUsers } from '../../../services/useFetchUsers'
import { useConnectivityState } from '../../../tools/electric'
import { useCreateRandomUser } from '../../../services/useCreateRandomUser'

const ProfileScreen = () => {
  const { connectivityState } = useConnectivityState()

  const allUsers = useFetchUsers()
  console.log("🚀 ~ allUsers:", allUsers)
  const createRandomUser = useCreateRandomUser()

  const ref = React.useRef(null)
  useScrollToTop(ref)

  return (
    <ScreenLayout>
      <ScreenContent>
        <ScrollView ref={ref} showsVerticalScrollIndicator={false}>
        <Text className='mt-4'>{"connectivityState: " + connectivityState }</Text>
        {!allUsers && <Text>Loading...</Text>}
        {allUsers &&
          <View className='mt-4'>
            <Text>{allUsers.length} Users:</Text>
            {allUsers.map((user) => (
              <Text className='text-xs' key={user.id}>{user.email}</Text>
            ))}
          </View>
        }
        <View className='mt-4'>
        <Button title="Create Random User" onPress={createRandomUser} />
        </View>
        </ScrollView>
      </ScreenContent>
    </ScreenLayout>
  )
}

export default ProfileScreen
