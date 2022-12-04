import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:marvel/constants/error_constants.dart';
import 'package:marvel/constants/service_constants.dart';
import '../data/models/marvel_models.dart';

class MarvelController extends ChangeNotifier {
  List<Data> lista = [];


  Future<List<Data>> getData() async {
    try {
      final baseUrl = Uri.parse(ServiceConstants.baseUrl);
      final response = await http.get(baseUrl);
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        decodeJson['data'].forEach((item) => lista.add(Data.fromJson(item)));
        notifyListeners();
        return lista;
      }
    } catch (e) {
      print('${ErrorConstants.erroAoAcessarPagina}$e');
      return [];
    }
    return[];
  }

  Future<List<Data>> searchData({String? query}) async {
    try {
      final baseUrl = Uri.parse(ServiceConstants.baseUrl);
      final response = await http.get(baseUrl);
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        decodeJson['data'].forEach((item) => lista.add(Data.fromJson(item)));
        if (query!.length > 1) {
          lista = lista
              .where((item) => item.title!.toLowerCase().contains(
            query.toLowerCase(),
          ))
              .toList();
        }
        notifyListeners();
        return lista;
      }
    } catch (e) {
      print('${ErrorConstants.erroAoAcessarPagina}$e');
      return [];
    }
    return[];
  }
}