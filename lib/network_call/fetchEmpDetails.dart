import 'dart:convert';
import 'dart:io';

import 'package:employee_dir/db/db_connect.dart';
import 'package:employee_dir/models/employees.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class FetchEmpDetails {
  Future<List<Employees>> details() async {
    final response = await http
        .get(Uri.parse('http://www.mocky.io/v2/5d565297300000680030a986'));

    // ignore: deprecated_member_use
    var emp = List<Employees>();

    if (response.statusCode == 200) {
      var empJson = json.decode(response.body);
      for (var i in empJson) {
        emp.add(Employees.fromJson(i));
      }
    }
    return emp;

    // Future<dynamic> fetchData(
    // ) async {
    //   var responseJson;
    //   try {
    //     final response = await http
    //         .get(Uri.parse('http://www.mocky.io/v2/5d565297300000680030a986'));
    //     print(response.body.toString());

    //     if (response.statusCode == 200) {
    //       responseJson = json.decode(response.body);
    //   //     return (responseJson as List).map((employee) {
    //   //   print('Inserting $employee');
    //   //   DBConnect.db.createEmployee(Employees.fromJson(employee));
    //   // }).toList();
    //     } else {
    //       Fluttertoast.showToast(
    //           gravity: ToastGravity.TOP,
    //           msg: "Unable to fetch details",
    //           backgroundColor: Colors.red[900]);
    //     }
    //   } on SocketException {
    //     // throw FetchDataException('No Internet connection');
    //     Fluttertoast.showToast(
    //         gravity: ToastGravity.TOP,
    //         msg: "No Internet Connection",
    //         backgroundColor: Colors.red[900]);
    //   }
    //   return responseJson;
    // }
  }
}
