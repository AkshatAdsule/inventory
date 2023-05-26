import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:inventory/models/household.dart';
import 'package:inventory/models/user.dart';
import 'package:inventory/services/user.dart';

class APIService {
  static const bool _testing = true;
  static const String _baseUrl = _testing
      // ? 'http://168.150.111.230:8080'
      ? 'https://3f79-168-150-104-213.ngrok-free.app'
      // ? 'http://168.150.60.67:8080'
      : 'https://inventory-paradise.wl.r.appspot.com';
  static APIService? _instance;

  static APIService get instance {
    _instance ??= APIService._();
    return _instance!;
  }

  APIService._();

  Future<User> getCurrentUser(String uid) async {
    String url = '$_baseUrl/users/$uid';
    Response res = await get(Uri.parse(url));
    return User.fromJson(jsonDecode(res.body));
  }

  Future<void> createUser(User user) async {
    String url = '$_baseUrl/users';
    log(jsonEncode(user.toJson()));
    await post(
      Uri.parse(url),
      body: jsonEncode(user.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    UserService.instance.refresh();
  }

  Future<List<Household>> getHouseholds(List<String> households) {
    String url = '$_baseUrl/getHouseholds';
    return post(
      Uri.parse(url),
      body: jsonEncode(households),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((res) {
      List<dynamic> json = jsonDecode(res.body);
      return json.map((e) => Household.fromJson(e)).toList();
    });
  }

    Future<void> addItems(String uid, List<String> itemList) async {
    String url =
        '$_baseUrl/inventory/$uid/add-items'; // this is the route specified in backend/routes/inventory
    await put(
      Uri.parse(url),
      body: jsonEncode({"itemList": itemList}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  Future<void> removeItems(String uid, List<String> itemList) async {
    String url =
        '$_baseUrl/inventory/$uid/remove-items'; // this is the route specified in backend/routes/inventory
    await put(
      Uri.parse(url),
      body: jsonEncode({"itemList": itemList}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}
