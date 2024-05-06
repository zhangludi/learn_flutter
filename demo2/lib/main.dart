// 库
// import 'dart:math';
// 制定前缀
// import 'dart:math' as math;

// 导入部分库 show hide
import 'dart:math' show Point;

void main () {
  // var point = math.Point(10, 30); // 前缀
  var point = Point(10, 30);
  print('${point.x}, ${point.y}');
}