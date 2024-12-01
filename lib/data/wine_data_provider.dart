import 'dart:convert';
import 'package:flutter/services.dart';
import '../domain/models/wine.dart'; // Corectat importul pentru modelul Wine
import '../domain/models/wine_category.dart'; // Corectat importul pentru modelul WineCategory

class WineDataProvider {
  static Future<List<WineCategory>> fetchWineCategories() async {
    final String response = await rootBundle.loadString('assets/data/wines.json');
    final data = json.decode(response);
    return (data['wineCategories'] as List)
        .map((category) => WineCategory.fromJson(category))
        .toList();
  }

  static Future<List<Wine>> fetchWines() async {
    final String response = await rootBundle.loadString('assets/data/wines.json');
    final data = json.decode(response);
    return (data['wines'] as List).map((wine) => Wine.fromJson(wine)).toList();
  }
}