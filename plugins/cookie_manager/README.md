# dio_cookie_manager [![Pub](https://img.shields.io/pub/v/dio_cookie_manager.svg?style=flat-square)](https://pub.dartlang.org/packages/dio_cookie_manager)

A  cookie manager for [Dio](https://github.com/dart-tools/dio_http). 

## Getting Started

### Install

```yaml
dependencies:
  dio_cookie_manager: ^2.0.0  #latest version
```

### Usage

```dart
import 'package:dio_http/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

main() async {
  var dio =  Dio();
  var cookieJar=CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  
  // first request, and save cookies (CookieManager do it).
  await dio.get("https://baidu.com/");
  
  // Print cookies
  // print(await cookieJar.loadForRequest(Uri.parse("https://baidu.com/")));

  // second request with the cookies
  await dio.get("https://baidu.com/");
  ... 
}
```

## Cookie Manager

CookieManager Interceptor can help us manage the request/response cookies automatically. CookieManager depends on `cookieJar` package :

> The dio_cookie_manager  manage API is based on the withdrawn [cookie_jar](https://github.com/flutterchina/cookie_jar).

You can create a `CookieJar` or `PersistCookieJar` to manage cookies automatically, and dio use the `CookieJar` by default, which saves the cookies **in RAM**. If you want to persists cookies, you can use the `PersistCookieJar` class, for example:

```dart
dio.interceptors.add(CookieManager(PersistCookieJar()))
```

`PersistCookieJar` persists the cookies in files, so if the application exit, the cookies always exist unless call `delete` explicitly.

> Note: In flutter, the path passed to `PersistCookieJar` must be valid(exists in phones and with write access). you can use [path_provider](https://pub.dartlang.org/packages/path_provider) package to get right path.

In flutter: 

```dart
Directory appDocDir = await getApplicationDocumentsDirectory();
String appDocPath = appDocDir.path;

var cj = PersistCookieJar(ignoreExpires: true, storage: FileStorage(appDocPath +"/.cookies/" ));
dio.interceptors.add(CookieManager(cj));
...
```
