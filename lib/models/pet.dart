import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/utils/constants.dart';

//Criação da classe de entidade
class Pet with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double age;
  final String imageUrl;
  bool isFavorite;
  //Construtor passandod os atributos como parametro
  Pet({
    required this.id,
    required this.name,
    required this.description,
    required this.age,
    required this.imageUrl,
    this.isFavorite = false,
  });
  //Metodo que alterna o valor do favorito
  void _toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> toggleFavorite() async {
    try {
      _toggleFavorite();

      final response = await http.patch(
        Uri.parse('${Constants.productBaseUrl}/$id.json'),
        body: jsonEncode({"isFavorite": isFavorite}),
      );

      if (response.statusCode >= 400) {
        _toggleFavorite();
      }
    } catch (_) {
      _toggleFavorite();
    }
  }
}
