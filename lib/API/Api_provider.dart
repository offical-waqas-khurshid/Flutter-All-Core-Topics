import 'dart:convert';

import 'package:flutter_api_demo/modals/album.dart';
import 'package:http/http.dart' as http;

extension Success on http.Response {
  bool get isSuccess => statusCode == 200;
}

abstract class APIProvider {
  String get baseURL => 'https://jsonplaceholder.typicode.com';
  String get apiURL;
  String get url => baseURL + apiURL;

  dynamic fetch({String endPoint = ''}) async {
    var response = await http.get(Uri.parse(url + endPoint));
    if (response.isSuccess) {
      return await jsonDecode(response.body);
    }
    return null;
  }
}

class AlbumAPIProvider extends APIProvider {
  static AlbumAPIProvider? _instance;

  AlbumAPIProvider._internal();

  factory AlbumAPIProvider() {
    return _instance ??= AlbumAPIProvider._internal();
  }

  Future<List<Album>> fetchAlbums() async {
    var data = await fetch() as List;
    List<Album> albums = data.map((e) => Album.fromMap(e)).toList();
    return albums;
  }

  Future<Album> fetchAlbum(int id) async {
    var data = await fetch(endPoint: '/$id') as Map<String, dynamic>;
    return Album.fromMap(data);
  }

  insertAlbum(Album album) async {
    var response = http.post(Uri.parse(url), body: album.toMap());
  }

  @override
  String get apiURL => '/albums';
}
