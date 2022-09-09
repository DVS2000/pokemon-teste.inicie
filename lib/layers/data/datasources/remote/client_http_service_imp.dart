/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone: 944557610 / 992228230(WhatsApp)
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/client_http_service.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';


class ClientHttpServiceImp implements ClientHttpService {
  final _ioc = HttpClient();
  Client _client = Client();

  ClientHttpServiceImp() {
    _ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    _client = IOClient(_ioc);
  }

  @override
  Future<Response> get({required String route, required Map<String, String>? headers}) async {
    try {
      bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();

      if (isConnected) {

        return await _client.get(
          Uri.parse("https://pokeapi.co/api/v2/" + route),
          headers: headers
        );

      } else {
        return Response("{\"data\": null, \"message\": \"Sem internet\"}", 511);
      }
    } catch (e) {
      return Response("{\"data\": null, \"message\": \"Ocorreu um erro interno\"}", 500);
    }
  }
}