import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'home.dart';
import 'Fetch.dart';
import 'login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('test')),
        drawer:  Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(60),
                bottomRight: Radius.circular(60)
            ),
          ),
          child: Column(
            children:  [
              Row(
                children: const [
                  Expanded(
                    flex: 1,
                    child: UserAccountsDrawerHeader(
                      accountName: Text("test"),
                      accountEmail: Text("test@gmail.com"),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage("http://media.discordapp.net/attachments/1051886825142243419/1052240060612890744/1606783962.png"),
                      ),
                      decoration: BoxDecoration(
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
                title: Text("setProfile"),
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child:  Icon(BootstrapIcons.people_fill,color: Color(0XFF263238),),
                ),
              ),
              const Divider(),
              const ListTile(
                title: Text("setting"),
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child:  Icon(BootstrapIcons.sliders,color: Color(0XFF263238),),
                ),
              ),
              const Divider(),
            ],
          ),
        ),
        body: const MyStatefulWidget(),
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("test"),
            ElevatedButton(
            style: style,
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context)=> const WebGlLoaderObj())
              );
            },
            child: const Text('to three'),
            ),
            ElevatedButton(
              style: style,
              onPressed: (){
                // login('root','aaaa');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=> const CategoryPage())
                );
              },
              child: const Text('login'),
            ),
          ],
        ),
      ));
  }
}

