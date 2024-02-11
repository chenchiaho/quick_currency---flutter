import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUrl = 'https://freecurrencyapi.net/api/v2/latest';
const apiKey = 'f8fbdc40-5398-11ec-b8f1-757e371ba593';

class CurrencyService {
  Future<Map<String, dynamic>> fetchConversionRate(String baseCurrency) async {
    final url =
        Uri.parse('$baseUrl?apikey=$apiKey&base_currency=$baseCurrency');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load conversion rate');
    }
  }
}
