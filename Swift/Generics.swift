func uniqCount<T: Hashable>(xs: [T]) -> Int {
	return Set<T>(xs).count
}
print(uniqCount([1,2,3,4,4]))
