import 'package:cotacao_btc/controllers/list_currencies_controller.dart';
import 'package:get/get.dart';

class ControllerBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ListCurrenciesController>( () => ListCurrenciesController());
  }

}