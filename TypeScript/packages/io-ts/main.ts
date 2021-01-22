import * as T from 'io-ts'

// interface
const objectX = T.type({
  x: T.number,
  y: T.string,
})

type ObjectX = T.TypeOf<typeof objectX>

/* Same as

interface ObjectX {
  x: number
  y: string
}

*/

const a: unknown = {
  x: 42,
  y: 'inu',
}

// ---------------------------------
// User-Defined Type Guardは自動的に導出される
// ---------------------------------
const isObjectX: (w: unknown) => w is ObjectX = objectX.is

if (isObjectX(a)) {
  console.log('a is an ObjectX.')
  console.log(a.x)
  console.log()
}

// a is an ObjectX.
// 42
//

// union
const unionX = T.union([T.number, T.string])

type UnionX = T.TypeOf<typeof unionX>

const b: unknown = 'neko'

if (unionX.is(b)) {
  console.log('b is a UnionX.')
  console.log()
}

// b is a UnionX.
//

// partialを持つinterface
const objectY = T.intersection([T.type({ x: T.number }), T.partial({ y: T.string })])

type ObjectY = T.TypeOf<typeof objectY>

const c: unknown = { x: 42 }

if (objectY.is(c)) {
  console.log('c is an ObjectY.')
  console.log(c.x)
  console.log()
}

// c is an ObjectY.
// 42

// We should not use below.
const objectYNotBetter = T.type({
  x: T.number,
  y: T.union([T.string, T.undefined]),
})

type ObjectYNotBetter = T.TypeOf<typeof objectYNotBetter>

if (!objectYNotBetter.is(c)) {
  console.log('c is not an ObjectYNotBetter, because c.y is omitted.')
}

const d: unknown = {
  x: 42,
  y: undefined,
}

if (objectYNotBetter.is(d)) {
  console.log('d is an ObjectYNotBetter.')
  console.log('We must define .y with undefined for kinds of objectYNotBetter.')
  console.log(d.y)
  console.log()
}

// c is not an ObjectYNotBetter, because c.y is omitted.
// d is an ObjectYNotBetter.
// We must define .y with undefined for kinds of objectYNotBetter.
// undefined
//

if (objectY.is(d)) {
  console.log('But, no way, d is an ObjectY.')
  console.log(d.y)
  console.log()
}

// But, no way, d is an ObjectY.
// undefined
//
