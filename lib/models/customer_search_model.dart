// To parse this JSON data, do
//
//     final customersSearchModel = customersSearchModelFromJson(jsonString);

import 'dart:convert';

List<CustomersSearchModel> customersSearchModelFromJson(String str) =>
    List<CustomersSearchModel>.from(
        json.decode(str).map((x) => CustomersSearchModel.fromJson(x)));

String customersSearchModelToJson(List<CustomersSearchModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomersSearchModel {
  CustomersSearchModel({
    this.label,
    this.value,
    /* this.stateCode,
    this.stateName,
    this.erpClosing,
    this.countryCode,
    this.countryName,
    this.customerSourceName,
    this.emailAddress,
    this.blockCustomer,*/
  });

  var label;
  var value;
  /* var stateCode;
  var stateName;
  var erpClosing;
  var countryCode;
  var countryName;
  var customerSourceName;
  var emailAddress;
  var blockCustomer;
*/
  factory CustomersSearchModel.fromJson(Map<String, dynamic> json) =>
      CustomersSearchModel(
        label: json["label"],
        value: json["value"],
        /* stateCode: json["StateCode"],
        stateName: json["StateName"],
        erpClosing: json["ErpClosing"],
        countryCode: json["CountryCode"],
        countryName: json["CountryName"],
        customerSourceName: json["CustomerSourceName"],
        emailAddress: json["EmailAddress"],
        blockCustomer: json["BlockCustomer"],*/
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
        /*  "StateCode": stateCode,
        "StateName": stateName,
        "ErpClosing": erpClosing,
        "CountryCode": countryCode,
        "CountryName": countryName,
        "CustomerSourceName": customerSourceName,
        "EmailAddress": emailAddress,
        "BlockCustomer": blockCustomer,*/
      };
}
