import 'dart:convert';
import 'package:test_app/configs/api_conf.dart';
import 'package:test_app/entities/manufacturer.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/entities/manufacturer_details.dart';

class DataService{
  List<Manufacturer>? manufacturers_list;
  late ManufacturerDetails _details;

  Future<List<Manufacturer>?> fetchManufacturersByPage(page) async {
    final queryParams = {
      'format' : 'json',
      'page' : page.toString(),
    };
    final uri = Uri.https(ApiConfig.authority, ApiConfig.all_manufacturers, queryParams);
    final response = await http.get(uri);

    if(response.statusCode == 200){
      manufacturers_list = await json.decode(response.body)['Results'].map<Manufacturer>((data) => Manufacturer.fromJson(data)).toList();
      return manufacturers_list;
    }else{
      throw Exception('Failed to load manufacturers');
    }
  }

  Future<ManufacturerDetails?> fetchManufacturerById(id) async {
    final queryParams = {
      'format' : 'json',
    };
    final uri = Uri.https(ApiConfig.authority, ApiConfig.manufacturer_details+'/'+id.toString(), queryParams);
    final response = await http.get(uri);

    if(response.statusCode == 200){
      _details = await ManufacturerDetails.fromJson(await json.decode(response.body)['Results'][0]);
      return _details;
    }else{
      throw Exception('Failed to load manufacturers');
    }
  }
}
