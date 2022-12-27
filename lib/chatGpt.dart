import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'Fetch.dart';
import 'EventBus.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatGPT extends StatefulWidget {
  const ChatGPT({super.key});

  @override
  _ChatGPT createState() => _ChatGPT();
}

class _ChatGPT extends State<ChatGPT> {
  String hint = "....";
  String _ask = "";
  String _res  = "";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/bg5.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0XFF402A26),
            title: Text('talk to AI',
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
              child: ClipRect(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(30, 100, 30, 0),
                    height: 500,
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(51, 51, 51, 0.6)
                    ),
                    child: SingleChildScrollView(
                      // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                                        labelText: "要說的話",
                                        hintText: "你要跟ai說的話",
                                        prefixIcon:  Icon(BootstrapIcons.chat_left,color: Color(0XFFFCFCFC),),
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 15,
                                    ),

                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(252, 252, 252, 1),
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          foregroundColor: Colors.black,
                                          textStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400
                                          )
                                      ),
                                      onPressed: () async{
                                        setState(() {
                                          _res = "";
                                          hint = "思考中...";
                                        });
                                        var ans =  await Fetch.chat(_nameController.text);
                                        setState(() {
                                          _res = ans;
                                          _ask = _nameController.text;
                                        });
                                      },
                                      child: const Text('submit'),
                                    ),

                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      child: _res==""? Text(hint,style: const TextStyle(color: Color.fromRGBO(252, 252, 252, 0.8)),):Wrap(
                                        runSpacing: 10,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Icon(
                                                  BootstrapIcons.person_fill,
                                                  size: 30,
                                                  color: Color(0XFFFCFCFC)
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(':',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color.fromRGBO(252, 252, 252, 0.8)
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                              color: const Color.fromRGBO(23, 23, 23, 0.8),
                                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                              child: Text(_ask,
                                                style: const TextStyle(
                                                    color: Color.fromRGBO(252, 252, 252, 0.8)
                                                ),
                                              )
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Icon(
                                                  BootstrapIcons.robot,
                                                  size: 30,
                                                  semanticLabel:'chatgpt',
                                                  color: Color(0XFFFCFCFC)
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(':',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color.fromRGBO(252, 252, 252, 0.8)
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                              color: const Color.fromRGBO(23, 23, 23, 0.8),
                                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                              child: Text(_res,
                                                style: const TextStyle(
                                                    color: Color.fromRGBO(252, 252, 252, 0.8)
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]
                      ),
                    )
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }

  chat(context,promp) async{
    var ans =  await Fetch.chat(promp);
    showAlert(context,ans);
  }

  Future<void> showAlert(BuildContext context,text) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            backgroundColor: Color.fromRGBO(51, 51, 51, .8),
            titleTextStyle: GoogleFonts.notoSerif(
              textStyle: const TextStyle(
                color: Color.fromRGBO(252, 252, 252, 0.8),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            contentTextStyle:GoogleFonts.notoSerif(
              textStyle: const TextStyle(
                color: Color.fromRGBO(252, 252, 252, 0.8),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            title: const Text('Response'),
            content: Text(text),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(51, 51, 51, .8),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400
                    )
                ),
                child: Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
