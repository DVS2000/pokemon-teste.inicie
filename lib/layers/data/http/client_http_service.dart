import 'package:http/http.dart';

abstract class ClientHttpService {
  Future<Response> get({required String route, Map<String, String>? headers});
}