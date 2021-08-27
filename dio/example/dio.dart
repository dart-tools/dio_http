import 'package:dio/dio.dart';

/// More examples see https://github.com/dart-tools/dio_http/tree/master/example
void main() async {
  var dio = Dio();
  final response = await dio.get('https://google.com');
  print(response.data);
}
