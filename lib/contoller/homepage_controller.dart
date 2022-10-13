import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:raftlabs_test/main.dart';
import 'package:raftlabs_test/model.dart';

bool isempty=false;

Future<Model?> getcall() async {
  HttpOverrides.global = MyHttpOverrides();
  String url = "https://api.publicapis.org/entries";

  var urlk = Uri.parse(url);

  try {
    final response = await http.get(urlk);

    if (response.statusCode == 200) {
      String respostring = response.body;
      return modelFromJson(respostring);
    } else {
      log(response.statusCode.toString());
    }
  } catch (e) {
    log(e.toString());
  }
}

    String ?mode;
    Model ?nullmodel;


Future <Model?>search({required String searchKeyword}) async {
  try {
    var url = Uri.parse(
        "https://api.publicapis.org/entries?category=$searchKeyword");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      log(response.body);
      String responsestr=response.body;
      if(responsestr.contains("null")){
        return nullmodel;
      }else{
      var model = modelFromJson(response.body);
       return model;
      }

    }
  } catch (e) {
    log(e.toString());
  }
}
