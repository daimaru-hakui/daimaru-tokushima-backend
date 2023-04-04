export interface Repaire {
  factory: string
  deleveryPlace: string
  deadline: Date
  client: string
  price: number
  orderType: string
  category: string
  products: {
    productNumber: string
    size: string
    quantity: number
    comment: string
  }[]
  user_id: string
}
