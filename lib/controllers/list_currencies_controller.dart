import 'package:cotacao_btc/models/cotacao_model.dart';
import 'package:cotacao_btc/services/cotacao_service.dart';
import 'package:get/get.dart';

class ListCurrenciesController extends GetxController{

  CotacaoSerive cotacaoService = CotacaoSerive();

  var isLoading = false.obs;

  var listCurrenciesObs = <CotacaoModel>[].obs;

  static ListCurrenciesController get listCurrencies => Get.find();

  Future<dynamic> listCurrecies() async{
    isLoading.value = true;
    var list = await cotacaoService.fetchListCurriencies();

    listCurrenciesObs.value = list.listCurrenciesModel;
    isLoading.value = false;

    return listCurrenciesObs;
  }

}