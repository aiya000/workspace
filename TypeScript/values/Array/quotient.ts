function quotient<T>(xs: Array<T>, maximumPerOne: number): Array<Array<T>> {
  const xsMaxIndex = xs.length - 1
  const xss: Array<Array<T>> = range(0, div(xsMaxIndex, maximumPerOne)).map(_ => [])

  range(0, xsMaxIndex).map(i => {
    xss[div(i, maximumPerOne)][i % maximumPerOne] = xs[i]
  })

  return xss
}

export function range(begin: number, end: number): Array<number> {
  const xs = []
  for (let x = begin; x <= end; ++x) {
    xs.push(x)
  }
  return xs
}

function div(x: number, y: number): number {
  return Math.floor(x / y)
}

// output
// [ [ 0, 1, 2, 3, 4, 5, 6 ],
//   [ 7, 8, 9, 10, 11, 12, 13 ],
//   [ 14, 15, 16, 17, 18, 19, 20 ],
//   [ 21, 22, 23 ] ] [ [ 0, 1, 2, 3, 4, 5, 6 ], [ 7, 8, 9, 10, 11, 12, 13 ] ] [ [ 0, 1, 2, 3, 4, 5, 6 ], [
// 7, 8, 9, 10, 11, 12, 13 ], [ 14 ] ]
console.log(
  quotient(range(0, 23), 7),
  quotient(range(0, 13), 7),
  quotient(range(0, 14), 7),
)
