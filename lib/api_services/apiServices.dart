import 'dart:async';
import 'dart:convert';

import 'package:first_crud/models/user_model.dart';
import 'package:first_crud/utils/api_constants.dart';
import 'package:http/http.dart' as http;

Future<UserDetail> fetchUserDetails() async {
  final response =
      await http.get(Uri.parse(ApiConstants.baseUrl + ApiConstants.users));

  if (response.statusCode == 200) {
    return UserDetail.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load user details');
  }
}

Future<UserDetail> createUser(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    print("User Create Successfully");
    return UserDetail.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to create user detail.');
  }
}

Future<UserDetail> updateAlbum(String title, String id) async {
  final response = await http.put(
    Uri.parse(ApiConstants.baseUrl + ApiConstants.users + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 200) {
    return UserDetail.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to update album.');
  }
}

Future<UserDetail> deleteAlbum(String id) async {
  final http.Response response = await http.delete(
    Uri.parse(ApiConstants.baseUrl + ApiConstants.users + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    return UserDetail.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to delete user.');
  }
}
