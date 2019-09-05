// TODO: Generalize without Kind

export interface Question {
  id: number
  kind: Kind
}

export enum Kind {
  LifeHabit,
  Attachment,
  SelfEsteem,
  Curiosity,
  Executive,
  SelfConfidence,
  Emotive,
  Narrative,
  Restrictive,
  Morality,
  Relations,
}

/**
 * 全ての問と問題文の対応
 */
export const all: readonly Question[] = [  // tslint:disable-line:array-type
  { id: 1, kind: Kind.Attachment },
  { id: 2, kind: Kind.SelfConfidence },
  { id: 3, kind: Kind.Curiosity },
  { id: 4, kind: Kind.Executive },
  { id: 5, kind: Kind.SelfConfidence },
  { id: 6, kind: Kind.Emotive },
  { id: 7, kind: Kind.Narrative },
  { id: 8, kind: Kind.Restrictive },
  { id: 9, kind: Kind.Relations },
  { id: 10, kind: Kind.Relations },
  { id: 11, kind: Kind.Relations },
  { id: 12, kind: Kind.Relations },
  { id: 13, kind: Kind.Attachment },
  { id: 14, kind: Kind.Restrictive },
  { id: 15, kind: Kind.LifeHabit },
  { id: 16, kind: Kind.LifeHabit },
  { id: 17, kind: Kind.LifeHabit },
  { id: 18, kind: Kind.LifeHabit },
  { id: 19, kind: Kind.Morality },
  { id: 20, kind: Kind.Restrictive },
  { id: 21, kind: Kind.Attachment },
]

export function isNegative(x: Question): boolean {
  switch (x.id) {
    case 19:
    case 20:
    case 21:
      return true
    default:
      return false
  }
}

/**
 * @param xs 非空
 */
export function groupByKind(xs: Array<Question>): Array<Array<Question>> {
  const groups = [[xs[0]]]
  xs.slice(1).map(x => addByKind(groups, x))
  return groups;

  function addByKind(xss: Array<Array<Question>>, x: Question): void {
    const xs = xss.find(xs => xs[0].kind === x.kind)
    if (xs === undefined) {
      xss.push([x])
      return
    }
    xs.push(x)
  }
}

const groups = groupByKind(all as Array<Question>)
const p = groups.every(group =>
  group.every((x, _, xs) => x.kind === xs[0].kind)
)
console.log(p)
console.log(groups)

// true
// [ [ { id: 1, kind: 1 }, { id: 13, kind: 1 }, { id: 21, kind: 1 } ],
//   [ { id: 2, kind: 5 }, { id: 5, kind: 5 } ],
//   [ { id: 3, kind: 3 } ],
//   [ { id: 4, kind: 4 } ],
//   [ { id: 6, kind: 6 } ],
//   [ { id: 7, kind: 7 } ],
//   [ { id: 8, kind: 8 }, { id: 14, kind: 8 }, { id: 20, kind: 8 } ],
//   [ { id: 9, kind: 10 },
//     { id: 10, kind: 10 },
//     { id: 11, kind: 10 },
//     { id: 12, kind: 10 } ],
//   [ { id: 15, kind: 0 },
//     { id: 16, kind: 0 },
//     { id: 17, kind: 0 },
//     { id: 18, kind: 0 } ],
//   [ { id: 19, kind: 9 } ] ]
