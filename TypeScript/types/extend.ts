const a: { x: number } & { y: string } = {
  x: 10,
  y: 'hi',
}

// 2322: Type 'string' is not assignable to type 'string & number'.  Type 'string' is not assignable to type 'number'.
// const b: { x: string } & { x: number } = { x: 'hi' }

// 2322: Type 'number' is not assignable to type 'string'.
// const c: Extend<{x: string}, {x: number}> = { x: 10 }
