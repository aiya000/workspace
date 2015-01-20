<?php

class Hoge {
	public function foo($ahoge){
		print($ahoge);
	}
}

class Test {
	public static function main(){
		$hoge = new Hoge();

		call_user_func(array($hoge, 'foo'), 'argument');
	}
}

Test::main();
