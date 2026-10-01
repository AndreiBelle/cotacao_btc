import 'package:cotacao_btc/components/PaisCotacaoCard.dart';
import 'package:cotacao_btc/screens/price_details_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money2/money2.dart';

import '../controllers/list_currencies_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {

  var controller = ListCurrenciesController.listCurrencies;
  @override
  void initState() {
    super.initState();
    controller.listCurrecies();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
        Obx(() => controller.isLoading.value ? Center(child: CircularProgressIndicator(),) :
            Container(
              child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: controller.listCurrenciesObs.length,
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                      child: ListTile(
                        onTap: (){
                          Get.to(PriceDetailsScreens(cotacaoModel: controller.listCurrenciesObs[index])
                          );
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child:
                            Paiscotacaocard(
                                image:'assets/imagens-moedas/${controller.listCurrenciesObs[index].symbol}.png',
                                width: 150
                            )
                        ),
                        title: Text(Money.fromNum(controller.listCurrenciesObs[index].buy,
                            isoCode: controller.listCurrenciesObs[index].symbol).toString()
                        ),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    );
                  }),
            )
        )
    );
  }
}