import 'dart:convert';

import 'package:flutter_tutorial/travel_app/models/places_model.dart';
import 'package:http/http.dart' as http;
class ApiClient {
  // String BASE_URL= "http://10.0.2.2:8000/mystore/";
  String BASE_URL= "https://jsonplaceholder.typicode.com/";
  // String BASE_URL= "http://192.168.1.108:8000/mystore/";
  Future<List<PlacesModel>> getPlaces() async {
    // var END_POINT= "places.php";
    var END_POINT= "photos";
    http.Response response= await http.get(Uri.parse(BASE_URL+END_POINT));

    try{
      if (response.statusCode==200) {
        List<dynamic>  list= json.decode(response.body);
        print("Getting data in Api Client -----------------------");
        print(list);
        return list.map((e) => PlacesModel.fromJson(e)).toList();
      }
      else{
        return <PlacesModel>[];
      }
    }catch(e){
      print(e);
      return <PlacesModel>[];
    }
  }
}