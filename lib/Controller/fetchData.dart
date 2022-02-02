/// This file will load data from [API] and parse that json into [BoomBoxModel] class
///
/// A [Example Json](lib/Model/BoomBoxModel.dart) is Placed in [Model] directory
///

import 'dart:convert';
import 'dart:developer';

import 'package:boombox/Model/BoomBoxModel.dart';
import 'package:boombox/Utils/constants.dart';
import 'package:http/http.dart' as http;

/// [URL] to load data from APi or default jsonURL will be used if it is not porvided during call to this function
Future<BoomBoxModel?> fetchJsonFromAPI({String? url}) async {
  return await http.get(Uri.parse(url ?? jsonUrl)).then((response) {
    log("Http response ${response.statusCode}");

    // log("HTTP Body ${response.body}");

    if (response.statusCode == 200) {
      return BoomBoxModel.fromMap(jsonDecode(response.body));
    } else {
      return null;
    }
  });
}
