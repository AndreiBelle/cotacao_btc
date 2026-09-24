import 'dart:convert';

import 'package:cotacao_btc/models/list_currencies_model.dart';
import 'package:http/http.dart' as http;


class CotacaoSerive {
  String url = "https://blockchain.info/ticker";
  dynamic _response;
  CotacaoSerive() {
    _response = "";
  }

  Future<ListCurrenciesModel> fetchListCurriencies() async {
    _response = await http.get(Uri.parse(url));

    if(_response.statusCode == 200) {
      Map<String, dynamic> retorno = json.decode(_response.body);
      return ListCurrenciesModel.fromJson(retorno);
    } else {
      throw Exception('Falho ao carregar');
    }
  }

}