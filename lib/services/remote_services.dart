import 'dart:convert';

import 'package:e_officedesk/consts/base.dart';
import 'package:e_officedesk/consts/customerconsts.dart';
import 'package:e_officedesk/models/customer.dart';
import 'package:e_officedesk/models/customer_search_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<CustomerModel>?> fetchCustomerList() async {
    var url = App.BaseURL + "Customer/1-10";

    //TODO Request Parameter
    Map<String, String> body = {
      CustomerConst.LOGIN_USER: 'admin',
      CustomerConst.COMPANY_ID: '10'
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
      return customerModelFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  static Future<List<CustomersSearchModel>?>
      fetch_search_customer_details() async {
    await Future.delayed(Duration(seconds: 1));

    var url = App.BaseURL + "Customer/Search";

    //TODO Request Parameter
    Map<String, String> body = {
      CustomerConst.WORD: "",
      CustomerConst.COMPANY_ID: '10'
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

      return customersSearchModelFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
