import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_do_api/model.dart';

//this class contains the API services
class Apiservice {
  Future<List<Todo>> fetchTodos() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );

    // the if statement checks and return the API response
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      return jsonList.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
/*
Future<Todos> fetchTodos() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/todos'),
  );

  if (response.statusCode == 200)  {
    // If the se rver did return a 200 OK response,
    // then par se the JSON.
    return  T odos.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load todos');
  }
}
*/