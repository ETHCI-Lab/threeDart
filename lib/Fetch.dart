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

class DreamLog{
  final String USER_ID;
  final String UserName;
  final String InputPrompt;
  final int Seed;
  final String Time;

  const DreamLog({
    required this.USER_ID,
    required this.UserName,
    required this.InputPrompt,
    required this.Seed,
    required this.Time,
  });


  factory DreamLog.fromJson(Map<String, dynamic> json) {
    return DreamLog(
      USER_ID: json['USER_ID'],
      UserName: json['UserName'],
      InputPrompt: json['InputPrompt'],
      Seed: json['Seed'],
      Time: json['Time'],
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

  static Future<List<DreamLog>> search()async{
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
      List<DreamLog> list = <DreamLog>[];
      json.decode(utf8.decode(response.bodyBytes)).forEach((element) => list.add(DreamLog.fromJson(element)));
      return list;
    }else{
      throw Exception('Failed to fetch');
    }
  }

  static Future<String> chat(String promp)async{
    final response = await http.post(
      Uri.parse("https://dev.ethci.org:2087/chat"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'promp': promp,
      }),
    );

    if(response.statusCode == 200){
      return response.body;
    }else{
      throw Exception('Failed to fetch');
    }
  }
}