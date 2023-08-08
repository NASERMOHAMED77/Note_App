// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:apinoteapp/features/login/data/repo/repo.dart';
import 'package:http/http.dart' as http;

class SignRepoImp extends SignRepo {
  @override
  postuserReq(String url, Map data) async {
    try {
      var res = await http.post(Uri.parse(url), body: data);
      if (res.statusCode == 200) {
        return jsonDecode(res.body)["data"];
      } else {
        print(res.statusCode);
      }
    } catch (e) {
      print("errrrror" + e.toString());
    }
  }
}
