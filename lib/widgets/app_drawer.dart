import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String logoUrl = "https://spoonacular.com/images/spoonacular-logo-b.svg";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Remove default padding
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue[100],
            ),
            child: Center(
              child: Image.network(
                logoUrl,
                fit: BoxFit.contain,
                height: 80,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.restaurant_menu),
            title: Text("Recipes"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/recipes');
            },
          ),
        ],
      ),
    );
  }
}
