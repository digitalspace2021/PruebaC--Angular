import { Payments } from "./Payments.dto"

export interface Client {
  identification_card: string
  full_name: string
  pin: number
  payments: Payments[]
}
