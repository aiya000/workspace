// 'typealias Void = ()' was defined by swift
typealias IntFunc = (Int, Int) -> Int
let f: IntFunc = { $0 + $1 }
print(f(10, 20))
