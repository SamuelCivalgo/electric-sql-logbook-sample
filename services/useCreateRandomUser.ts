import { v4 as uuidv4 } from 'uuid';
import {
  useElectricClient,
} from '../tools/electric'

export const useCreateRandomUser = () => {
  const { db } = useElectricClient()

  return async () => {
    const newTenant = await db.Tenant.create({
      data: {
        id: uuidv4(),
        name: 'tenant:' + uuidv4(),
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        settings: {}
      }
    })

    const newUser = await db.User.create({
      data: {
        id: uuidv4(),
        email: `${uuidv4()}@example.com`,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        currentTenantId: newTenant.id,
        settings: {}
      }
    })

    return newUser;
  }
}
