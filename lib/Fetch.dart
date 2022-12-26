import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Status {
  final String status;
  final String message;

  const Status({
    required this.status,
    required this.message,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      status: json['status'],
      message: json['message'],
    );
  }
}

class User{
  final String name;
  final String password;

  const User({
    required this.name,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['username'],
      password: json['password'],
    );
  }
}

class Fetch{
  static const _url = 'https://dev.ethci.org:2053/api/';

  static testServe()async{
    final response = await http.get(Uri.parse("${_url}test"));
    if(response.statusCode == 200){
      return Status.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to get');
    }
  }

  static login(User user)async{
    final response = await http.post(
      Uri.parse("${_url}login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': user.name,
        'password': user.password
      }),
    );

    if(response.statusCode == 200){
      // print(jsonDecode(response.body)[0]);
      return User.fromJson(jsonDecode(response.body)[0]);
    }else{

      throw Exception('Failed to login');
    }
  }

  static search()async{
    final response = await http.post(
      Uri.parse("${_url}SearchTable"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'DB': 'DreamLog',
      }),
    );

    if(response.statusCode == 200){
      // print(jsonDecode(response.body)[0]);
      jsonDecode(response.body).forEach((element) => print(element));
    }else{

      throw Exception('Failed to fetch');
    }
  }
}