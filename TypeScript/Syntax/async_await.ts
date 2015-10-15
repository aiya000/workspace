const FIRST:  number = 50;
const SECOND: number = 100;

let wait: Function = (n: number) => {
	return new Promise(done => setTimeout(() => done(n), n));
};

wait(SECOND).then(() => console.log("2"));
let main: Function = async () => {
	await wait(FIRST);
	console.log("1");
};

main();
