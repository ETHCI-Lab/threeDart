import 'package:flutter/material.dart';
import 'Fetch.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class Log extends StatefulWidget {
  final List<DreamLog> list ;
  const Log( {Key? key,required this.list}) : super(key: key);
  @override
  State<Log> createState() => _LogState(list);
}

class _LogState extends State<Log> {
  List list = List.filled(10, null, growable: false);
  _LogState(List list){
    this.list = list;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/bg3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Color(0XFF402A26),
              title: Text('log page',
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
            body: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(30,10, 30, 30),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    tileColor: const Color.fromRGBO(51, 51, 51, 0.5) ,
                    leading: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child:  Icon(BootstrapIcons.person_fill,color: Color(0XFFFFFFFF),),
                    ),
                    title: Text('${list[index].UserName}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text('${list[index].Time}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            )
        ),
      ),
    );
  }
}
