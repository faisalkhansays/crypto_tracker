import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto_tracker/model/crypto_model.dart';

class ApiServices {
  final String apiUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd";

  Future<List<CryptoModel>> fetchCryptos() async {
    final response = await http.get(Uri.parse(apiUrl));
    print(response.body);  // Print API response

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);

      return jsonData.map((json) => CryptoModel.fromJson(json)).toList();

    } else {
      throw Exception('Failed to load cryptocurrencies');
    }
  }
}
