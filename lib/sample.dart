//2. Import the required packages.
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

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '7E2ED189-B0B8-4AA6-BDD5-DF8A0402ADEE';

class CoinData {
  //TODO 3: Update getCoinData to take the selectedCurrency as an input.
  Future getCoinData() async {
    String requestURL = '$coinAPIURL/BTC/USD?apikey=$apiKey';
    Uri uri = Uri.parse(requestURL); // Parse the URL string to a Uri object.
    http.Response response = await http.get(uri); // Use the Uri object.
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      print(lastPrice);
      //return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
