import 'dart:convert';

import 'package:e_officedesk/consts/base.dart';
import 'package:e_officedesk/consts/customerconsts.dart';
import 'package:http/http.dart' as http;

class User {
  final String name;

  const User({
    required this.name,
  });

  static User fromJson(Map<String, dynamic> json) => User(
        name: json['name'],
      );
}

class UserApi {
  static Future<List<User>> getUserSuggestions(query) async {
    /*  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);*/

    var url = App.BaseURL + "Customer/Search";

    //TODO Request Parameter
    Map<String, String> body = {
      CustomerConst.WORD: query,
      CustomerConst.COMPANY_ID: '12'
    };

    //TODO API BODY / HEADERS / Emcoding Type
    final response = await http.post((Uri.parse(url)),
        //body: body,
        body: body,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8"));

    /* var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));*/
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body); //response.body;

      final List users = json.decode(response.body);

      return users.map((json) => User.fromJson(json)).where((user) {
        final nameLower = user.name.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();

      //return customersSearchModelFromJson(jsonString);
    } else {
      //show error message
      throw Exception();
    }

    /*  if (response.statusCode == 200) {
      final List users = json.decode(response.body);

      return users.map((json) => User.fromJson(json)).where((user) {
        final nameLower = user.name.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }*/
  }
}
