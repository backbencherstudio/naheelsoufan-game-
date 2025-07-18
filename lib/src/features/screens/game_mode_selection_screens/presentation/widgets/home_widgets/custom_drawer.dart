import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
   final GlobalKey<ScaffoldState> scaffoldKey;
  const CustomDrawer({super.key,
  
  required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: scaffoldKey,
      
      child: Column(
        children: [
Text("djsagfk")
        ],
      ),
    );
  }
}