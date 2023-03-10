import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'home.dart';
import 'Fetch.dart';
import 'login.dart';
import 'EventBus.dart';
import 'log.dart';
import 'chatGpt.dart';
import 'package:google_fonts/google_fonts.dart';

String name = "";

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Fetch.search();
    bus.on('login', (arg) {
      name = arg;
    });
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0XFF402A26),
            title: Text('Meta Classroom alpha 0.01',
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
          drawer:  const StatefulDrawer(),
          backgroundColor: Colors.transparent,
          body: const MyStatefulWidget(),
        ),
      ),
    );
  }
}

class StatefulDrawer extends StatefulWidget{
  const StatefulDrawer({super.key});

  @override
  State<StatefulDrawer> createState() => _StatefulDrawer();
}

class _StatefulDrawer extends State<StatefulDrawer>{

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: const Color(0X90FFFFFF),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(60),
            bottomRight: Radius.circular(60)
        ),
      ),
      child: Column(
        children:  [
          Row(
            children:  [
              Expanded(
                flex: 1,
                child:SizedBox(
                  height: 220,
                  child: UserAccountsDrawerHeader(
                    accountName: name==""?const Text("guest"): Text(name),
                    accountEmail:name==""?const Text("not login"): Text(name+"@gmail.com"),
                    currentAccountPicture: name == ''?Icon(
                      size:60,
                      BootstrapIcons.person_fill,
                      color: Color(0XFFFFFFFF),
                    ):const CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage("http://media.discordapp.net/attachments/1051886825142243419/1052240060612890744/1606783962.png"),
                    ),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("assets/img/bg4.png")
                        )
                    ),
                  ),
                )
              )
            ],
          ),
          const ListTile(
            title: Text("setProfile",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child:  Icon(BootstrapIcons.people_fill,color: Color(0XFFFFFFFF),),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            title: Text("setting",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child:  Icon(BootstrapIcons.sliders,color: Color(0XFFFFFFFF),),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: const ListTile(
              title: Text("log list",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child:  Icon(BootstrapIcons.list_ul,color: Color(0XFFFFFFFF),),
              ),
            ),
            onTap: () async{
              List<DreamLog> list = await Fetch.search();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context)=>  Log(list: list))
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: ListTile(
              title: name == ""?const Text("login",
                  style: TextStyle(
                  color: Colors.white,
              ),
                ):const Text("logout",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child:  name == ""?Icon(BootstrapIcons.box_arrow_in_right,color: Color(0XFFFFFFFF),):Icon(BootstrapIcons.box_arrow_in_left,color: Color(0XFFFFFFFF),),
              ),
            ),
            onTap: () {
              if(name==""){
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=> const CategoryPage())
                );
              }else{
                Navigator.pop(context);
                name = "";
              }
            },
          ),
        ],
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  void initState() {
    Fetch.testServe();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4,sigmaY: 4),
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                 Expanded(
                  child:Text('Introducing to Meta Classroom',
                    softWrap:true,
                    style: GoogleFonts.notoSerif(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                    child: Padding(
                      padding:const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:const [
                          Image(
                            width: 40,
                            image: AssetImage("assets/img/icon.png")
                          )
                        ],
                      ),
                ),
              )
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border:const GradientBoxBorder(
                      gradient: LinearGradient(colors: [Colors.white, Color(0X400B0B0B)]),
                      width: 1,
                    ),
                    gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        colors: [Color(0x80FFFFFF), Color(0x20FFFFFF)]
                    )
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  <Widget>[
                        const Icon(BootstrapIcons.headset_vr,color: Color(0XFFFFFFFF)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Virtual Reality',
                          textScaleFactor: 1.25,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.notoSerif(
                            textStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
                InkWell(
                  child: Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border:const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Colors.white, Color(0X400B0B0B)]),
                          width: 1,
                        ),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            colors: [Color(0x80FFFFFF), Color(0x20FFFFFF)]
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  <Widget>[
                        const Icon(BootstrapIcons.robot,color: Color(0XFFFFFFFF)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Ai Assistant',
                          textScaleFactor: 1.25,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.notoSerif(
                            textStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    if(name == ""){
                      showAlert(context);
                    }else{
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context)=> const ChatGPT())
                      );
                    }
                  },
                ),

              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border:const GradientBoxBorder(
                        gradient: LinearGradient(colors: [Colors.white, Color(0X400B0B0B)]),
                        width: 1,
                      ),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          colors: [Color(0x80FFFFFF), Color(0x20FFFFFF)]
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  <Widget>[
                      const Icon(BootstrapIcons.people_fill,color: Color(0XFFFFFFFF)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Face to face Interaction',
                        textScaleFactor: 1.25,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.notoSerif(
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border:const GradientBoxBorder(
                        gradient: LinearGradient(colors: [Colors.white, Color(0X400B0B0B)]),
                        width: 1,
                      ),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          colors: [Color(0x80FFFFFF), Color(0x20FFFFFF)]
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Icon(BootstrapIcons.box_arrow_up_right,color: Color(0XFFFFFFFF)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Share Screen',
                        textScaleFactor: 1.25,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.notoSerif(
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              child: Container(
                width: 500,
                height: 170,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage("https://cdn.discordapp.com/attachments/758725799711866921/1057358825017065512/image_71.png")
                    ),
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        colors: [Color(0x80FFFFFF), Color(0x20FFFFFF)]
                    )
                ),
                child:  Center(
                  child: Text(
                    'Try it now',
                    textScaleFactor: 2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.notoSerif(
                      textStyle: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                if(name == ""){
                  showAlert(context);
                }else{
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context)=> const WebGlLoaderObj())
                  );
                }
              },
            ),
          ],
        ),
      ));
  }
}


Future<void> showAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
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
        title: const Text('Not login'),
        content: const Text('login to try the content.....'),
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
      );
    },
  );
}