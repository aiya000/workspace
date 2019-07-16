import { Primitive } from 'utility-types'

type DeepOmit<Base, Keys extends string> = {
  [Key in keyof Omit<Base, Keys>]: Base[Key] extends Primitive
  ? Base[Key]
  : DeepOmit<Base[Key], Keys>
}

interface X {
  x: {
    y: number
    z: number
    w: string
  }
  y: number
  z: number
}
const x: DeepOmit<X, 'y' | 'z'> = { x: { w: 'w' } }

// .y is already removed
// const y: DeepOmit<X, 'y' | 'z'> = { x: { w: 'w' }, y: 10 }
