// ignore_for_file: avoid_print, void_checks, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:apinoteapp/features/home/data/home_repo/home_repo.dart';
import 'package:http/http.dart' as http;

import '../../../../constant.dart';

class HomeRepoImp extends HomeRepo {
  @override
  void addNotes(
      {required String id,
      required String title,
      required String color,
      required String content}) async {
    var res = await http.post(Uri.parse(linkAddNoteserver), body: {
      'notes_user': '$id',
      'notes_image': color,
      'notes_title': title,
      'notes_content': content,
    });
    if (res.statusCode == 200) {
      print(res.statusCode);
    } else {
      print(res.statusCode);
    }
  }

  @override
  void deleteNotes({required String id}) async {
    try {
      var res = await http.post(Uri.parse(linkDeleteNoteserver), body: {
        'id': id,
      });
      if (res.statusCode == 200) {
        print('deleted');
        return jsonDecode(res.body)["status"];
      } else {
        print(res.statusCode);
      }
    } catch (e) {
      print("errrrror " + e.toString());
    }
  }

  @override
  getNotes({required String id}) async {
    try {
      var res = await http.post(Uri.parse(linkViewNoteserver), body: {
        'id': id,
      });
      if (res.statusCode == 200) {
        print(jsonDecode(res.body)["notes"]);
        return jsonDecode(res.body)["notes"];
      } else {
        print(res.statusCode);
      }
    } catch (e) {
      print("errrrror " + e.toString());
    }
    throw UnimplementedError();
  }

  @override
  void updateNotes(
      {required String id,
      required String title,
      required String content}) async {
    try {
      var res = await http.post(Uri.parse(linkUpdateNoteserver),
          body: {'id': '$id', 'notes_title': title, 'notes_content': content});
      if (res.statusCode == 200) {
        return jsonDecode(res.body)["data"];
      } else {
        print(res.statusCode);
      }
    } catch (e) {
      print("errrrror " + e.toString());
    }
  }
}
