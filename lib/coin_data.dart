import 'dart:convert';
import 'package:http/http.dart' as http;

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

// const List<String> cryptoList = [
//   'BTC',
//   'ETH',
//   'LTC',
// ];

// const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
// const apiKey = '7E2ED189-B0B8-4AA6-BDD5-DF8A0402ADEE';

const List<String> cryptoList = ['BTC', 'ETH', 'LTC'];

class CoinData {
  //TODO 3: Update getCoinData to take the selectedCurrency as an input.
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      //String requestURL = '$coinAPIURL/BTC/USD?apikey=$apiKey';
      Uri uri = Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$selectedCurrency?apikey=7E2ED189-B0B8-4AA6-BDD5-DF8A0402ADEE'); // Parse the URL string to a Uri object.
      http.Response response = await http.get(uri); // Use the Uri object.
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double Price = decodedData['rate'];
        //print('the last price is:$lastPrice');
        // return lastPrice;
        cryptoPrices[crypto] = Price.toStringAsFixed(0);
      } else {
        print('the status code is:${response.statusCode}');
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
