// 类
class Car {
  // 属性
  String? engine;
}

// 构造方法：实例化类（即基于类去创建对象）时会自动执行该方法
// 构造方法的名字一般就是类的名字
class CarClass {
  String? engine;
  CarClass(String? engine){
    this.engine  = engine; // this
    print(this.engine);
  }
}

// 带名字的构造方法
class Car1 {
  String? engine;
  Car1(String? engine) {
    this.engine = engine;
  }
  Car1.make(String newEngine) {
    print(newEngine);
  }
  drive() {
    print('I drive a car');
  }
}

// 继承
// 类属性
// 泛型
class TCar<T> {
  T engine;
  TCar(this.engine);
}

class V8 {
  int horsePower;
  V8(this.horsePower);
}

void main () {
  // Car c1 = Car();
  // c1.engine = 'v8';
  // print(c1);
  // print(c1.engine); // v8
  // CarClass c1 = CarClass('v1');
  // CarClass c2 = CarClass('v8');
  // print(c1);
  // print(c2);
 // Car1 c1 = Car1.make('newEngin2');
  // Car1 c1 = Car1('v8');
  // print(c1.drive());
  var v8 = V8(521);
  var c1 = TCar(v8);
  print(c1.engine.horsePower);

}