import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'Fetch.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  CategoryPageState createState() => CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {
  bool _isObscure = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("輸入框"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: "使用者名稱",
              hintText: "使用者名稱或郵箱",
              prefixIcon:  Icon(BootstrapIcons.person_fill,color: Color(0XFF263238),),
            ),
          ),

          TextField(
            obscureText:_isObscure,
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: "密碼",
              hintText: "您的登入密碼",
              prefixIcon:  Icon(BootstrapIcons.key_fill,color: Color(0XFF263238),),
              suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                  ),
              ),
           ),

          const SizedBox(
            height: 40,
          ),

          ElevatedButton(
            onPressed: (){
              login(_nameController.text,_passwordController.text);
            },
            child: const Text('login'),
          ),
      ]
    ),
    );
  }
}

login(String name,String password) async{
  var ans =  await Fetch.login(User(name: name, password: password));
  print(ans.name);
}