import 'package:dio_http/dio.dart';

class ListParam<T> {
  final ListFormat format;
  List<T> value;

  ListParam(this.value, this.format);
}
