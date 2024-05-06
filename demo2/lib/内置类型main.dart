// 类型
// 内置类型 字符串 数字 布尔值 列表 集合 映射
// 字符串
// void main () {
//   const title = "this is String";
//   print(title);
// }

// 数字
// int
// void main() {
//   int num= 3000
//   int num = 3000.00;
//   print(num); // A value of type 'double' can't be assigned to a variable of type 'int'.
// }
// double
// void main() {
//   double num = 3000.00;
//   print(num); // A value of type 'double' can't be assigned to a variable of type 'int'.
// }

// 布尔值
// bool IsTrue


// 列表
void list () {
  // List<String> arr 
  final  arr = ['one', 'two', 'three'];
  print(arr); // [one, two, three]
  // arr.add(3); //  Error: The argument type 'int' can't be assigned to the parameter type 'String'.
  arr.add('four');
  print(arr); // [one, two, three, four]
  print(arr[1]); // two
}

// 集合
void setList () {
  // Set<String> setArr
  final setArr = {
    'one',
    'two',
    'three'
  };
  print(setArr);
  // setArr.add(10); //  The argument type 'int' can't be assigned to the parameter type 'String'.
  setArr.add('10');
  print(setArr);

}

// 映射Map
void objSet () {
  // Map<Int, String> objSet
  final objSet = {
    '1': 'one',
    '2': 'two'
  };
  print(objSet);

}

void main() {
  objSet();
}
