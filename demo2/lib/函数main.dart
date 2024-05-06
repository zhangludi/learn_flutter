//  函数
// 创建函数
greet () {
  print('hello');
}

// 函数参数
log (String message) {
  print('$message');
}
// 多个参数
mulLog(String message, String prefix) {
  print('$message , $prefix');
}
// 有名字的参数 具名参数
nameLog ({String? message, String? prefix}) {
   print('$prefix: $message');
}
// 必填参数
mustLog ({required String message, String? prefix}) {
  print('$prefix: $message');
}

// 参数默认
defaultLog (String message,[String prefix = 'Log']) {
  print('$prefix: $message');
}

defaultLog1 ({required String message,String prefix = 'Log1'}) {
  print('$prefix: $message');
}

// 函数返回值
returnLog(String message) {
  return 'message：' + message;
}
main() {
  // greet();
  // log('this is a test');
  // mulLog('this is mul', 'aaa');
  // nameLog(prefix: 'rizhi', message: 'wwww');
  // mustLog( prefix: 'wwww'); // Required named parameter 'message' must be provided.
  // defaultLog('this is a test', 'mmm');
  // defaultLog1(message: 'this is a test', prefix: "日志");
  String msg = returnLog('this is a message');
  print(msg);
}