class SafeResult {
  SafeResult._();

  factory SafeResult.success(String foo) = MySuccessState;
  factory SafeResult.error(String foo) = MyErrorState;
}

class MyErrorState extends SafeResult {
  MyErrorState(this.msg): super._();

  final String msg;
}

class MySuccessState extends SafeResult {
  MySuccessState(this.value): super._();

  final String value;
}