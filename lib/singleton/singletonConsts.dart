class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() => _singleton;

  Singleton._internal();

  int? ApiStatusCode;
  String? username;
  String? password;
}

main() {}
