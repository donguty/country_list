import 'dart:convert';

import 'package:flutter/services.dart';

List<String> countries = [];

Future<void> loadCountries() async {
  //WidgetsFlutterBinding.ensureInitialized();
  String jsonStr = await rootBundle.loadString('assets/countries.json');
  Map<String, dynamic> json = jsonDecode(jsonStr);
  countries = json.values.toList().cast<String>();
  countries.sort();
  //print(countries);
}
