var tuple: [number, string] = [10, "20"];

// Type Safe
console.log(tuple[0].toFixed());
console.log(tuple[1].trim());
//tuple[0].trim();

// baka baka baka- !!
tuple[2] = 30;
console.log(tuple[2]);
