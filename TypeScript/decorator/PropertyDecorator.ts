// A 'decorator factory'
function runtimeType(class_: any, typeName: string): PropertyDecorator {
  // A 'decorator'
  return (target: Object, propertyKey: string | symbol) => {
    console.log(target)
    console.log(propertyKey)

    const prototype = class_.prototype
    if (prototype === undefined) {
      throw new Error(`This is not a class: ${class_}`)
    }

    if (typeName === 'number') {
      // const base: any = target
      const prop = String(propertyKey) // This is needed because propertyKey is possible to be symbol.

      // base.prototype[`${prop}Type`] = 'number'
      class_.prototype[`${prop}Type`] = 'number'
      return
    }

    throw new Error('error')
  }
}

class Foo {
  @runtimeType(Foo, 'number')
  public x: number = 10
}

const x = new Foo()
console.log((x as any).xType)

// Foo {}
// x
// number
