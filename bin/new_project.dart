import 'dart:convert';
import 'package:new_project/new_project.dart' as new_project;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  final url = Uri.https('dummyjson.com','/products');

  final response = await http.get(url);

  Map<String, dynamic> jsonData = json.decode(response.body);
  
  List<dynamic> products = jsonData['products'];
  
  print(products);

  int stockEntire = 0;

  List<int> stock = products.map((p)=>p['stock'] as int).toList();
  for (var p = 0; p < stock.length; p++) {
    stockEntire += stock[p];
  }

  print(stockEntire);
}