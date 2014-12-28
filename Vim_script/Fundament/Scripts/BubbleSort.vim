
let list = [5,3,1,7,4,2,6]

for i in range(1, len(list)-1) | for j in range(len(list)-1, i, -1)
	if list[j-1] > list[j]
		let tmp = list[j]
		let list[j] = list[j-1]
		let list[j-1] = tmp
	endif
endfor | endfor

echo list
