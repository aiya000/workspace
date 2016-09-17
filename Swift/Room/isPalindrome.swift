func isPalindrome(str: String) -> Bool {
	let chars = Array(str.characters)
	let a     = chars.count / 2
	let xs    = chars[0...a]
	return Array(xs.reverse()) == Array(chars[a...chars.count - 1])
}
print(isPalindrome("abcdcba"))
print(isPalindrome("abcdefg"))
