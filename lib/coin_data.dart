import 'dart:convert';
import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];
const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<double?> getCoinData(var url, String selectedCurrency) async {
    var cryptoPrices = {};
    for (String crypto in cryptoList) {
      Response response = await get(
        Uri.parse(url),
      );
      var decodedata = jsonDecode(response.body);
      var lastprice = decodedata['rate'];
      cryptoPrices[crypto] = lastprice.toStringAsFixed(0);
    }
    return cryptoPrices;
  }
}
