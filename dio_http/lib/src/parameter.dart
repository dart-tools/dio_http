import 'package:dio_http/dio_http.dart';

class ListParam<T> {
  final ListFormat format;
  List<T> value;

  ListParam(this.value, this.format);
}
