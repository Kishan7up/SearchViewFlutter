// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

List<CustomerModel> customerModelFromJson(String str) =>
    List<CustomerModel>.from(
        json.decode(str).map((x) => CustomerModel.fromJson(x)));

String customerModelToJson(List<CustomerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerModel {
  CustomerModel({
    /*this.customerId,*/
    this.customerName,
    /* this.customerType,
    this.address,
    this.area,
    this.pinCode,
    this.cityCode,
    this.cityName,
    this.stateCode,
    this.stateName,
    this.countryCode,
    this.countryName,
    this.address1,
    this.area1,
    this.pinCode1,
    this.cityCode1,
    this.cityName1,
    this.stateCode1,
    this.stateName1,
    this.countryCode1,
    this.countryName1,
    this.gstno,
    this.panno,
    this.cinno,
    this.contactNo1,
    this.contactNo2,
    this.emailAddress,
    this.websiteAddress,
    this.birthDate,
    this.anniversaryDate,
    this.orgTypeCode,
    this.customerSourceId,
    this.customerSourceName,
    this.parentId,
    this.createdDate,
    this.createdBy,
    this.blockCustomer,
    this.parentName,*/
  });

  /*  var customerId;*/
  var customerName;
/*
  var customerType;
  var address;
  var area;
  var pinCode;
  var cityCode;
  var cityName;
  var stateCode;
  var stateName;
  var countryCode;
  var countryName;
  var address1;
  var area1;
  var pinCode1;
  var cityCode1;
  var cityName1;
  var stateCode1;
  var stateName1;
  var countryCode1;
  var countryName1;
  var gstno;
  var panno;
  var cinno;
  var contactNo1;
  var contactNo2;
  var emailAddress;
  var websiteAddress;
  var birthDate;
  var anniversaryDate;
  var orgTypeCode;
  var customerSourceId;
  var customerSourceName;
  var parentId;
  var createdDate;
  var createdBy;
  var blockCustomer;
  var parentName;
*/
/*

  var CustomerName;
  var Email;
  var Address;
  var CityName;
  var CreatedDate;
  var CreatedBy;
  var CityCode;
  var PhoneNumber;
  var PinCode;
  var GstNo;
  var PanNo;

  var StateName;

  var CustomerType;
  var CustomerSource;
  var CustomerSourceID;
  var BlockCustomer;
  var Country;
  var CountryCode;
*/

/*
  dynamic rowNum;
  dynamic customerId;
  dynamic customerName;
  dynamic customerType;
  dynamic address;
  dynamic area;
  dynamic pinCode;
  dynamic cityCode;
  dynamic cityName;
  dynamic stateCode;
  dynamic stateName;
  dynamic countryCode;
  dynamic countryName;
  dynamic address1;
  dynamic area1;
  dynamic pinCode1;
  dynamic cityCode1;
  dynamic cityName1;
  dynamic stateCode1;
  dynamic stateName1;
  dynamic countryCode1;
  dynamic countryName1;
  dynamic gstno;
  dynamic panno;
  dynamic cinno;
  dynamic contactNo1;
  dynamic contactNo2;
  dynamic emailAddress;
  dynamic websiteAddress;
  dynamic birthDate;
  dynamic anniversaryDate;
  dynamic orgTypeCode;
  dynamic customerSourceId;
  dynamic customerSourceName;
  dynamic parentId;
  dynamic createdDate;
  dynamic createdBy;
  dynamic blockCustomer;
  dynamic parentName;*/

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        /* customerId: json["CustomerID"],*/
        customerName: json["CustomerName"],
        /*       customerType: json["CustomerType"],
        address: json["Address"],
        area: json["Area"],
        pinCode: json["PinCode"],
        cityCode: json["CityCode"],
        cityName: json["CityName"],
        stateCode: json["StateCode"],
        stateName: json["StateName"],
        countryCode: json["CountryCode"],
        countryName: json["CountryName"],
        address1: json["Address1"],
        area1: json["Area1"],
        pinCode1: json["PinCode1"],
        cityCode1: json["CityCode1"],
        cityName1: json["CityName1"] == null ? null : json["CityName1"],
        stateCode1: json["StateCode1"],
        stateName1: json["StateName1"] == null ? null : json["StateName1"],
        countryCode1: json["CountryCode1"],
        countryName1:
            json["CountryName1"] == null ? null : json["CountryName1"],
        gstno: json["GSTNO"],
        panno: json["PANNO"],
        cinno: json["CINNO"],
        contactNo1: json["ContactNo1"],
        contactNo2: json["ContactNo2"],
        emailAddress: json["EmailAddress"],
        websiteAddress: json["WebsiteAddress"],
        birthDate: DateTime.parse(json["BirthDate"]),
        anniversaryDate: DateTime.parse(json["AnniversaryDate"]),
        orgTypeCode: json["OrgTypeCode"],
        customerSourceId: json["CustomerSourceID"],
        customerSourceName: json["CustomerSourceName"],
        parentId: json["ParentID"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        createdBy: json["CreatedBy"],
        blockCustomer: json["BlockCustomer"],
        parentName: json["ParentName"],*/
      );

  Map<String, dynamic> toJson() => {
        /*    "CustomerID": customerId,*/
        "CustomerName": customerName,
        /* "CustomerType": customerType,
        "Address": address,
        "Area": area,
        "PinCode": pinCode,
        "CityCode": cityCode,
        "CityName": cityName,
        "StateCode": stateCode,
        "StateName": stateName,
        "CountryCode": countryCode,
        "CountryName": countryName,
        "Address1": address1,
        "Area1": area1,
        "PinCode1": pinCode1,
        "CityCode1": cityCode1,
        "CityName1": cityName1 == null ? null : cityName1,
        "StateCode1": stateCode1,
        "StateName1": stateName1 == null ? null : stateName1,
        "CountryCode1": countryCode1,
        "CountryName1": countryName1 == null ? null : countryName1,
        "GSTNO": gstno,
        "PANNO": panno,
        "CINNO": cinno,
        "ContactNo1": contactNo1,
        "ContactNo2": contactNo2,
        "EmailAddress": emailAddress,
        "WebsiteAddress": websiteAddress,
        "BirthDate": birthDate.toIso8601String(),
        "AnniversaryDate": anniversaryDate.toIso8601String(),
        "OrgTypeCode": orgTypeCode,
        "CustomerSourceID": customerSourceId,
        "CustomerSourceName": customerSourceName,
        "ParentID": parentId,
        "CreatedDate": createdDate.toIso8601String(),
        "CreatedBy": createdBy,
        "BlockCustomer": blockCustomer,
        "ParentName": parentName,*/
      };
}
