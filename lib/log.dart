import 'package:flutter/material.dart';

class Log extends StatefulWidget {
  final List list ;
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
    print(list);
    // return const Placeholder();
    return null;
  }
}
