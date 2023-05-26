import 'dart:convert';

import 'package:http/http.dart';

import '../models/contactmodel.dart';

class UserRepository {
  String userUrl = 'http://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts';

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      print(result);
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
