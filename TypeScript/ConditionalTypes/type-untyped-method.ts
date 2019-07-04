import deprecated from 'deprecated-decorator'

/**
 * [Let's dirty the static types.](https://docs.nativescript.org/ns-framework-modules/observable)
 */
class UntypedPlaceholder {
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
   * x.set('num', 'string')
   * ```
   *
   * I want to allow 'num' only with number type.
   */
  public set(_: string, __: any): void { }
}

/**
 * ValueTypes<{foo: number, bar: string}> = number | string
 */
type ValueTypes<T> = T extends { [k: string]: infer I } ? I : never

/**
 * Field<'foo', {foo: number, bar: string}> = 'foo'
 */
type Field<K extends string, T> = K extends keyof T
  ? K
  : never

/**
 * Recovers the [[UntypedPlaceholder]] type safety.
 */
class Placeholder<T extends object> extends UntypedPlaceholder {
  // TODO: Don't allow the below bad pattern.
  /**
   * A type safe `set()`.
   *
   * Unfortunately, this allows
   * ```
   * const p: Placeholder<{x: number, y: string}> = new Placeholder()
   * p.assign('x', 'I am a number')
   * ```
   *
   * Be careful.
   */
  public assign<K extends string>(key: Field<K, T>, value: ValueTypes<T>) {
    super.set(key, value)
  }

  // Type level contracts?
  // public assign<K extends string>(key: Field<K, T>, value: T[K]) {

  @deprecated('assign')
  public set(key: string, value: any): void {
    super.set(key, value)
  }
}

const x = new Placeholder<{ x: number }>()
x.assign('x', 10)
x.set('x', 20)  // this shows a deprecated mesesage
console.log(x)
