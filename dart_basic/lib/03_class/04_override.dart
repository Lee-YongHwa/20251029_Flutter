void main() {

  Car c = Car();
  // print(c);
  c._model = "Bus";
  print(c);
}

class Car {
  var _model;

  @override
  String toString() {
    return _model;
  }

  @override
  int get hashCode {
    return 123;
  }
}