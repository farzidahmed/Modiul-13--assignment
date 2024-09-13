import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

void main(){
  runApp(assApp());
}
class assApp extends StatelessWidget {
  const assApp({super.key});

  @override
  Widget build(BuildContext context) =>
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
}
