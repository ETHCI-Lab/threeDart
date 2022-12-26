import 'package:flutter/material.dart';
import 'Fetch.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('log')),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.transparent,
                child:  Icon(BootstrapIcons.person_fill,color: Color(0XFF263238),),
              ),
              title: Text('${list[index].UserName}'),
              subtitle: Text('${list[index].Time}'),
            );
          },
        )
    );
  }
}
