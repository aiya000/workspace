/**
 * https://github.com/Microsoft/TypeScript/issues/26019
 */

function foo(_: number, __: string): void { }
const _: Parameters<typeof foo> = [10, 'poi'] as [number, string]

// This passes the compilation.
