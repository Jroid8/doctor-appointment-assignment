import 'package:dio/dio.dart';

class ServerConn {
  static final ServerConn _instance = ServerConn._init();

  factory ServerConn() {
    return _instance;
  }

  ServerConn._init();

  final Dio dio = Dio(BaseOptions(baseUrl: "http://localhost:1234"));
}
