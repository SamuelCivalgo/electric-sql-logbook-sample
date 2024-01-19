import { electrify } from 'electric-sql/expo'
import * as SQLite from 'expo-sqlite'
import { useEffect, useState } from 'react'

import { Electric, schema } from '../../src/generated/client'
import { authToken } from './electric-auth'

export const useElectricProviderDb = () => {
  const [electricProviderDb, setElectricProviderDb] = useState<Electric>()

  useEffect(() => {
    let isMounted = true

    const init = async () => {
      const config = {
        auth: {
          token: authToken(),
        },
        debug: true,
        url: 'wss://logbook-sample-electric.fly.dev/ws',
      }

      // Create the expo-sqlite database connection. The first argument
      // is your database name. Changing this will create/use a new
      // local database file.
      const conn = SQLite.openDatabase('electric.db')
      try {
        const electric = await electrify(conn, schema, config)
        setElectricProviderDb(electric)
      } catch (error) {
        console.error('useElectricProviderDb error:', error)
      }

      if (!isMounted) {
        return
      }
    }

    init()

    return () => {
      isMounted = false
    }
  }, [])

  return electricProviderDb
}
