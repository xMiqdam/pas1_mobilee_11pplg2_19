// services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas1_mobilee_11pplg2_19/model/post_model.dart';




class ApiServiceGet {
  final String baseUrl = 'https://www.thesportsdb.com';

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/json/3/search_all_teams.php?l=Spanish%20La%20Liga'));

   if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> teams = json['teams'];
      return teams.map((team) => PostModel.fromJson(team)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}