// void greet (){
//   print('nihao');
// }
// var 变量
// void main (){
//   var title = "this is a test";
//   print(title);
// }

// void main (){
//   var title = "this is a test";
//   title = "change this title ";
//   print(title);
// }


// final 给他分配值值之后不能在分配新的值
// void main () {
//   final title = "this is final";
//   // title = "change  final"; // Error: Can't assign to the final variable 'title'.
//   print(title);
// }

// const 通常是常量或者恒量
// void main () {
//   const title = "this is const";
//   // title = "change  const"; // Error: Can't assign to the const variable 'title'.
//   print(title);
// }

//final const 区别： final 变量本身 const 变量的值  
// const > final > var

// var 
// void main () {
//   var obj = {
//     'title': 'this is a var'
//   };
//   obj = {
//     'title': "var change"
//   };
//   print(obj);
// }

// final
// void main () {
//   final obj = {
//     'title': 'this is a final'
//   };
//   // obj = {
//   //   'title': "var change"
//   // }; // Error: Can't assign to the final variable 'obj'.
//   obj['title'] = 'final change';
//   print(obj);
// }
// const
void main () {
  const obj = {
    'title': 'this is a const'
  };
  // obj = {
  //   'title': "var change"
  // }; // Error: Can't assign to the final variable 'obj'.
  // obj['title'] = 'const change'; // Cannot modify unmodifiable map
  print(obj);
}