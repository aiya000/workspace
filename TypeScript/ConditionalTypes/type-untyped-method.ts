import deprecated from 'deprecated-decorator'

/**
 * [Let's do dirty the static types.](https://docs.nativescript.org/ns-framework-modules/observable)
 */
class UntypedPlaceholder {
  private core: any = {}
  /**
   * This allows to
   *
   * ```typescript
   * const x: UntypedPlaceholder = new UntypedPlaceholder()
   * x.set('num', 10)
   * ```
   *
   * But this is very type unsafe because below is allowed too.
   *
   * ```typescript
   * x.set('num', 'I am 10')
   * ```
   *
   * I want to allow 'num' only with number type.
   */
  public set(key: string, value: any): void {
    this.core[key] = value
  }

  public get(key: string): any {
    return this.core[key]
  }
}

/**
 * ValueTypes<{foo: number, bar: string}> = number | string
 */
type ValueTypes<T> = T extends { [k: string]: infer I }
  ? I
  : never

/**
 * Field<'foo', {foo: number, bar: string}> = 'foo'
 */
type Field<X, K extends string, T> = K extends keyof X
  ? X[K] extends T ? K : never
  : never

/**
 * Recovers the [[UntypedPlaceholder]] type safety.
 */
class Placeholder<X extends object> extends UntypedPlaceholder {
  /**
   * A type safe `set()`.
   */
  public assign<K extends string, T>(key: Field<X, K, T>, value: T) {
    super.set(key, value)
  }

  @deprecated('assign')
  public set(key: string, value: any): void {
    super.set(key, value)
  }

  public take<K extends string, T>(key: Field<X, K, T>): T {
    return super.get(key)
  }

  @deprecated('take')
  public get(key: string): any {
    return super.get(key)
  }
}

const p = new Placeholder<{ x: number, y: string }>()
p.assign('x', 10)
p.assign('y', 'poi')
// 2345: Argument of type '"y"' is not assignable to parameter of type 'never'.
// p.assign('y', 10)

const x: number = p.take('x')
const y: string = p.take('y')

// 2345: Argument of type '"y"' is not assignable to parameter of type 'never'.
// const e: number = p.take('y')

console.log(p)
console.log(x)
console.log(y)

// -- output --
// Placeholder { core: { x: 10, y: 'poi' } }
// 10
// poi
