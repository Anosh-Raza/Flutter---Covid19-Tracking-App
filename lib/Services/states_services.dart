import 'dart:convert';

import 'package:flutter_covid_19_app/Models/WorldStatesModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_covid_19_app/Services/utilities/app_url.dart';


class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecords () async {
    final resposne = await http.get(Uri.parse(ApiUrl.worldStatsApi));
    if(resposne.statusCode == 200){
      var data = jsonDecode(resposne.body);
      return WorldStatesModel.fromJson(data);
    }else{
      throw Exception('Error');
    }
  }
  Future<List<dynamic>> CountresListApi () async {
    var data;
    final resposne = await http.get(Uri.parse(ApiUrl.countriesList));
    if(resposne.statusCode == 200){
      var data = jsonDecode(resposne.body);
      return data;
    }else{
      throw Exception('Error');
    }
  }
}