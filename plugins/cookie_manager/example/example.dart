import 'package:dio_http/dio_http.dart';
import 'package:dio_http_cookie_manager/dio_http_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

main() async {
  var dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  await dio.get("https://baidu.com/");
  // Print cookies
  print(cookieJar.loadForRequest(Uri.parse("https://baidu.com/")));
  // second request with the cookie
  await dio.get("https://baidu.com/");
}
