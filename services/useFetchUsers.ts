import {
  useElectricClient,
  useLiveQuery,
} from '../tools/electric'

export const useFetchUsers = () => {
  const { db } = useElectricClient()

  const { results } = useLiveQuery(db.User.liveMany())

  return results
}
