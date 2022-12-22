import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter/services.dart';
void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((value) =>runApp(const ThreeDa()));
}

class ThreeDa extends StatelessWidget{

  const ThreeDa({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'threeDart',
      home: WebGlLoaderObj(),
    );
  }

}