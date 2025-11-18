void main() {
  Box<int> intBox = Box<int>(10);
  print(intBox);print(intBox.runtimeType);
  print(intBox.value); print(intBox.value.runtimeType);

  Box<String> strBox = Box("hello");
  Box<List<int>> intListBox = Box([1,2,3,4,5]);
  intBox.show();
  strBox.show();
  intListBox.show();
  print(getFirst<int>(intListBox.value));
  print(getLast<int>(intListBox.value));
  final boxBasic = Box([1,2,3]);
  final boxRequire = Box.requiredGeneric(value: [1,2,3]);
}

class Box<T> {
  T value;
  Box(this.value);
  // Box(T value):this.value = value;
  Box.requiredGeneric({required this.value});
  T get() {return value;}
  void show() {print(value);}
}

T getFirst<T>(List<T> items) {return items[0];}
T getLast<T>(List<T> items) {return items[items.length-1];}
void printFirst<T>(List<T> items) {print(items[0]);}
void printLast<T>(List<T> items) {print(items[items.length-1]);}


