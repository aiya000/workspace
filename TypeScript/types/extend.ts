type Extend<Super extends object, Child extends object> = {
  [Key in (keyof Super | keyof Child)]
  : Key extends keyof Super
  ? Super[Key]
  : Key extends keyof Child
  ? Child[Key]
  : never  // ここは通らんぜよ
}

const x: Extend<{ x: number }, { y: string }> = {
  x: 10,
  y: 'hi',
}

const y: Extend<{ x: string }, { x: number }> = {
  x: 'hi',
}

// 2322: Type 'number' is not assignable to type 'string'.
// const z: Extend<{x: string}, {x: number}> = { x: 10 }
