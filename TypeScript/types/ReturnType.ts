/**
 * https://github.com/Microsoft/TypeScript/issues/26019
 */

function foo(): number {
  return 10
}

const _: ReturnType<typeof foo> = 10 as number
