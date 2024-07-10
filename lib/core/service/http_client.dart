import 'package:http/http.dart';

abstract class IHttpClient {
  Future<Response> get(String url);
}

class HttpClient implements IHttpClient {
  final client = Client();

  @override
  Future<Response> get(
    String url,
  ) {
    return client.get(
      Uri.parse(url),
    );
  }
}
