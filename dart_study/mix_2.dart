void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  numbers.forEach((number) => print(number)) ;
  List<int> numbers_2 = [1,2,3,4,5,6,7];
  List<int> doubledNumbers = numbers_2.map((number) => number * 2).toList();

  print("map: $doubledNumbers");

  int sumWithReduce = numbers.reduce((acc, current) => acc + current);

  print("sum with reduce: $sumWithReduce");

  int sum = numbers.fold(0, (prev, current) => prev + current);
  print("sum with fold(like reduce):  $sum");

  List<List<int>> nestedList = [[1,2,3], [4,5],[6],[7,8,9]];
  List<int> flattened = nestedList.expand((list) => list).toList();
  print("flattened List: $flattened");

 List<int> evens = numbers.where((number) => number % 2 == 0).toList();
 print("even numbers with where(like filter) function: $evens");
}