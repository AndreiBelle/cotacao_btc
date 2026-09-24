class CotacaoModel {

  final double last;
  final double buy;
  final double sell;
  final String symbol;

  CotacaoModel(this.last, this.buy, this.sell, this.symbol);

  CotacaoModel.fromJson(Map<String, dynamic> json) :
        last = json['last'],
        buy = json['buy'],
        sell = json['sell'],
        symbol = json['symbol'];
}