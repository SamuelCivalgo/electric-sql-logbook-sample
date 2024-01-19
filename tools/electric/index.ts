import {
  makeElectricContext,
  useConnectivityState as useConnectivityStateImport,
  useLiveQuery as useLiveQueryImport,
} from 'electric-sql/react'
import { useEffect, useState } from 'react'

import { Electric } from '../../src/generated/client'
import { useElectricProviderDb as useElectricProviderDbImport } from './useElectricProviderDb'

const { ElectricProvider: ElectricProviderImport, useElectric } =
  makeElectricContext<Electric>()

export const useElectricClient = () => {
  // eslint-disable-next-line @typescript-eslint/no-non-null-assertion
  const { db } = useElectric()!

  return { db }
}

export const ElectricProvider = ElectricProviderImport

export const useLiveQuery = useLiveQueryImport
export const useConnectivityState = useConnectivityStateImport
export const useElectricProviderDb = useElectricProviderDbImport

export const useElectricSyncShape = () => {
  const [synced, setSynced] = useState(false)
  const [mounted, setMounted] = useState(false)

  const { db } = useElectricClient()

  // Load data from the cloud DB to the offline Local DB on the mobile device
  useEffect(() => {
    if (mounted) return

    const startSync = async () => {
      setMounted(true)
      try {
        const shape = await db.User.sync({
          include: {
            ApiKey: true,
            DailyLog: true,
            DailyLogItem: true,
            Equipment_Equipment_createdByToUser: true,
            Equipment_Equipment_userIdToUser: true,
            EquipmentProperty: true,
            EquipmentPropertyValue: true,
            Feedback: true,
            File: true,
            FileProperty: true,
            FilePropertyValue: true,
            Image_Image_createdByToUser: true,
            LocationEntry: true,
            Project: true,
            ProjectProperty: true,
            ProjectPropertyValue: true,
            Task: true,
            TaskProperty: true,
            TaskPropertyValue: true,
            TaskStatus: true,
            Tenant_Tenant_createdByToUser: true,
            TenantUser_TenantUser_createdByToUser: true,
            TenantUser_TenantUser_userIdToUser: true,
            TimeBlock: true,
            UserTask_UserTask_createdByToUser: true,
            UserTask_UserTask_userIdToUser: true, },
        })
        console.log('Shape created:', shape)
        await shape.synced
        console.log('Shape synced')
      } catch (error) {
        console.error('useElectricSyncShape error:', error)
      }
      setSynced(true)
    }

    startSync()
  }, [db.Image, db.Tenant, db.User, mounted])

  return synced
}
