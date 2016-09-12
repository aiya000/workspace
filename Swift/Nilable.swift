let x: Int? = nil
let y: Int? = Int("20")
print(x, y)
print(y!)

let year: Int? = Int("2020")
let remain: Int = year! - 2016
print(remain)

let year2: Int? = nil
let remain2: Int = year! - 2016
print(remain2)

let year3: Int? = nil
if let remain3 = year3 {
	print(remain3)
    print("remain \(remain3-2016)years")
}
