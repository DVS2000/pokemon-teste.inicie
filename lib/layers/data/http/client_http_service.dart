import 'package:http/http.dart';

abstract class ClientHttpService {
  Future<Response> get({required String url, Map<String, String>? headers});
}