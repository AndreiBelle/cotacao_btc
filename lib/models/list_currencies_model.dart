import 'cotacao_model.dart';

class ListCurrenciesModel {

  final List<CotacaoModel> listCurrenciesModel;

  ListCurrenciesModel(this.listCurrenciesModel);

  ListCurrenciesModel.fromJson(Map<String, dynamic> json):
      listCurrenciesModel = List.from(json.values).map((item) => CotacaoModel.fromJson(item)).toList();

}