class TodoData {
  static final TodoData _instance = TodoData._internal();

  List todoList = [
    ["Nau an luc 11h AM", true],
    ["On thi nmlt", false]
  ];

  factory TodoData() {
    return _instance;
  }

  TodoData._internal();
}