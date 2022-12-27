import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'Fetch.dart';
import 'EventBus.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/bg2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0XFF402A26),
            title: Text('Login page',
              style: GoogleFonts.notoSerif(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
          body: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
                margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: ClipRect(
                    child: Container(
                      height: 500,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(51, 51, 51, 0.6)
                      ),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 2.0,sigmaY: 2.0),
                              child: Opacity(
                                opacity: 0.8,
                                child: Column(
                                  children: [
                                    TextField(
                                      style: GoogleFonts.notoSerif(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        labelStyle:const TextStyle(
                                          color: Color.fromRGBO(252, 252, 252, 0.8)
                                        ),
                                        hintStyle: const TextStyle(
                                            color: Color.fromRGBO(252, 252, 252, 0.3)
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderRadius: BorderRadius.circular(60),
                                          borderSide: const BorderSide(
                                              width: 3.0,
                                              color:Color.fromRGBO(252, 252, 252, 0.2),
                                          ),
                                        ),
                                        focusedBorder:  UnderlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:const BorderSide(
                                            color:Color.fromRGBO(252, 252, 252, 0.8),
                                          ),
                                        ),
                                        labelText: "使用者名稱",
                                        hintText: "使用者名稱或郵箱",
                                        prefixIcon:  Icon(BootstrapIcons.person_fill,color: Color(0XFFFCFCFC),),
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextField(
                                      style: GoogleFonts.notoSerif(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      obscureText:_isObscure,
                                      controller: _passwordController,
                                      decoration: InputDecoration(
                                        labelStyle:const TextStyle(
                                            color: Color.fromRGBO(252, 252, 252, 0.8)
                                        ),
                                        hintStyle: const TextStyle(
                                            color: Color.fromRGBO(252, 252, 252, 0.3)
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderRadius: BorderRadius.circular(60),
                                          borderSide: const BorderSide(
                                            width: 3.0,
                                            color:Color.fromRGBO(252, 252, 252, 0.2),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color:Color.fromRGBO(252, 252, 252, 0.8),
                                          ),
                                        ),
                                        labelText: "密碼",
                                        hintText: "您的登入密碼",
                                        prefixIcon:  Icon(BootstrapIcons.key_fill,color: Color(0XFFFCFCFC),),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                              _isObscure ? Icons.visibility : Icons.visibility_off,
                                            color: Color(0XFFFCFCFC),
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
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(252, 252, 252, 1),
                                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                          foregroundColor: Colors.black,
                                          textStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400
                                          )
                                      ),
                                      onPressed: (){
                                        login(_nameController.text,_passwordController.text);
                                      },
                                      child: const Text('submit'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]
                      ),
                    )
                ),
            ),
          ),
        ),
      ),
    );
  }

  login(String name,String password) async{
    var ans =  await Fetch.login(User(name: name, password: password));
    if(ans.name!=null){
      bus.emit('login',ans.name);
      Navigator.of(context).pop();
    }
  }
}
