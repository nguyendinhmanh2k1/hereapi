import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/address.dart';

class HereApi {
  static const String apiKey = 'D5OIPJbpZ_sCxILE_Z_-myKc8a201O2oEjLeQ4W5ae8';
  static const String baseUrl = 'https://geocode.search.hereapi.com/v1/geocode';

  static Future<List<Address>> searchAddress(String query) async {
    // Mã hóa query để đảm bảo đúng định dạng URL
    final encodedQuery = Uri.encodeComponent(query);

    // Gọi API với mã hóa UTF-8
    final response = await http.get(Uri.parse('$baseUrl?q=$encodedQuery&apiKey=$apiKey'));

    // Kiểm tra trạng thái phản hồi
    if (response.statusCode == 200) {
      // Giải mã body từ bytes thành UTF-8 để đảm bảo hiển thị tiếng Việt đúng
      final data = json.decode(utf8.decode(response.bodyBytes));

      // Chuyển đổi JSON thành danh sách Address
      return (data['items'] as List).map((item) => Address.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load addresses');
    }
  }
}
