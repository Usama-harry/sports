import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data with ChangeNotifier {
  Future<void> loadCatagories() {
    final url = Uri.parse(
        'http://api.football-api.com/2.0/competitions?Authorization=565ec012251f932ea4000001fa542ae9d994470e73fdb314a8a56d76');

    return http.get(url).catchError((error) {
      throw error;
    });
  }

  Future<void> loadStandings(String compId) {
    final url = Uri.parse(
        'http://api.football-api.com/2.0/standings/$compId?Authorization=565ec012251f932ea4000001fa542ae9d994470e73fdb314a8a56d76');

    return http.get(url).catchError((error) {});
  }
}
