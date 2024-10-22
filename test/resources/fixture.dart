import 'dart:convert';
import 'dart:io';

///
/// parse raw json file to Map
///
Map<String, dynamic> fixture(String fileName) {
  final file = File('test/resources/responses/$fileName').readAsStringSync();

  return jsonDecode(file) as Map<String, dynamic>;
}
