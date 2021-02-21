import 'dart:convert';

import 'package:http/http.dart';

class ApiService {
  Future getPost(type) async {
    try {
      Response response =
          await get('https://medfriendinfra.herokuapp.com/fetch/$type');
      final body = jsonDecode(response.body);
      return body['data'];
    } catch (e) {
      print(e);
    }
  }
}
