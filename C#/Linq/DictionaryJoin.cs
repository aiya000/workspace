using System;
using System.Collections.Generic;
using System.Linq;

public class DictionaryJoin {
	public struct Foo {
		public int    Id    { get; set; }
		public string Value { get; set; }
	}

	public static void Main(string[] args){
		var list = new List<Foo>() {
			  new Foo { Id = 1, Value = "fooA" }
			, new Foo { Id = 2, Value = "barA" }
			, new Foo { Id = 3, Value = "bazA" }
		};
		var dict = new Dictionary<int,string>() {
			  {1, "foo"}
			, {2, "bar"}
			, {3, "baz"}
		};

		list.Join(dict, f => f.Id, i => i.Key, (f,i) => new {
			  Id = f.Id
			, Value1 = f.Value
			, Value2 = i.Value
		}).ToList().ForEach(Console.WriteLine);
	}
}
