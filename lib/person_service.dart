import 'package:firebase_cloud/user.dart';
import 'package:http/http.dart';
import 'dart:convert';

Future<List<User>> getUsers() async {
  Response res = await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  List<dynamic> response = json.decode(res.body);
  final x = response.map((user) => User.fromJson(user as Map<String, dynamic>)).toList();
  print(x);
  return x;
}