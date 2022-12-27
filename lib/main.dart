import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'home.dart';
import 'Fetch.dart';
import 'login.dart';
import 'EventBus.dart';
import 'log.dart';

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
            backgroundColor: Color(0XFFA49188),
            title: const Text('Meta Classroom alpha 0.01'),
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
                child: UserAccountsDrawerHeader(
                  accountName: Text(name),
                  accountEmail:const Text("test@gmail.com"),
                  currentAccountPicture: const CircleAvatar(
                    backgroundImage: NetworkImage("http://media.discordapp.net/attachments/1051886825142243419/1052240060612890744/1606783962.png"),
                  ),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: NetworkImage("http://cdn.discordapp.com/attachments/1051886825142243419/1053691923526864896/242274964.png")
                      )
                  ),
                ),
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
          const Divider(),
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
          const Divider(),
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
                const Expanded(
                  child:Text('Introducing to Meta Classroom',
                    softWrap:true,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
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
                  // backgroundImage: AssetImage("assets/img/icon.png"),
                ),
              ))],
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
                  child: const Center(
                    child: Text(
                      'Virtual Reality',
                      textScaleFactor: 1.25,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ),
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
                  child: const Center(
                    child: Text(
                      'Ai Assistant',
                      textScaleFactor: 1.25,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
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
                  child: const Center(
                    child: Text(
                      'Face to face Interaction',
                      textScaleFactor: 1.25,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
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
                  child: const Center(
                    child: Text(
                      'Share Screen',
                      textScaleFactor: 1.25,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 500,
              height: 170,
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
              child: const Center(
                child: Text(
                  'Try it now',
                  textScaleFactor: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ));
  }
}
