using System;
using System.Collections.Generic;

class Program {
	public static IEnumerable<int> FromTo(int from, int to){
		while(from <= to)
			yield return from++;
	}

	public static void Main(string[] args){
		foreach(int i in FromTo(0, 10))
			Console.Write(i + " ");
		Console.WriteLine();

		Stack<int> stack = new Stack<int>(10);
		for(int i=0; i<5; i++)
			stack.Push(i);
		foreach(var i in stack)
			Console.Write(i + " ");
		Console.WriteLine();
	}
}

class Stack<T> {
	T[] stack;
	int pointer = 0, size;
	public Stack(int maxSize){
		stack = new T[maxSize];
		this.size = maxSize;
	}
	public void Push(T element){
		stack[pointer++] = element;
	}
	public T Pop(){
		return stack[--pointer];
	}

	public IEnumerator<T> GetEnumerator(){
		for(int i=0; i<this.size; i++)
			yield return stack[i];
	}
}
