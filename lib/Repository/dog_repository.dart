import 'dart:convert';
import 'dart:io';

import 'package:dog_application/Models/dog.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class DogRepository {
  Future<List<Dog>> getDog();

}

class SampleDogRepository implements DogRepository {
  final dogUrl = "https://dog.ceo/api/breeds/list/all";


  @override
  Future<List<Dog>> getDog() async {
    try {
      final response = await http.get(Uri.parse(dogUrl));
      if (kDebugMode) {
        print("response${response.body}");
      }

      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        if (jsonData.containsKey('message')) {
          final Map<String, dynamic> dogList = jsonData['message'];

          return dogList.entries.map((e) => Dog(breedName: e.key)).toList();
        } else {
          throw NetworkError('Error', 'Invalid response format');
        }
      } else {
        throw NetworkError(response.statusCode.toString(), response.body);
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(stackTrace.toString());
      }
      if (kDebugMode) {
        print(e.toString());
      }
      throw NetworkError('Error', e.toString());
    }
  }
  // String getBreedImage(String breedName){

  //   // istel attın
  //  // return //foto url;    

  // }
}

class NetworkError implements Exception {
  final String statusCode;
  final String message;

  NetworkError(this.statusCode, this.message);

  @override
  String toString() {
    return 'NetworkError: $statusCode, $message';
  }
}
