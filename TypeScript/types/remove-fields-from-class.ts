class Foo {
    constructor(
        public id: number,
        public name: string,
    ) { }

    public show(): void {
        console.log('hi')
    }
}

type NeverRegisteredFoo = {
    [K in keyof Foo]: Foo[K] extends ((...args: any[]) => infer _)
    ? undefined
    : K extends 'id' ? null : Foo[K]
}

const x: NeverRegisteredFoo = { id: null, name: 'me', show: undefined }
console.log(x)
