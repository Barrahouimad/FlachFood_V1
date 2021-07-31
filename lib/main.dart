import 'package:flutter/material.dart';
import 'package:testapp/models/menu.dart';
import 'package:testapp/models/suppliment.dart';
import 'package:testapp/pages/Panier.dart';
import 'package:testapp/pages/supplimentairePage.dart';

import 'package:testapp/pages/track_folder.dart';
import 'package:testapp/pages/payment.dart';
import 'package:testapp/pages/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
      List<Menu>  listcarts=[];
      
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:SupplimentairePage(restauName: "imad",) /*Panier(listcarts)*/,
    );
  }
}