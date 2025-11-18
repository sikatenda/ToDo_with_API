import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_do_api/model.dart';

Future<Tasks> fetchTasks() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Tasks.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load tasks');
  }
}
