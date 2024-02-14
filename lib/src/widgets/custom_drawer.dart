import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/logo.png'),
            ),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(16, 132, 132, 1),
            )
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () {
              // Handle home button tap
            },
          ),
          ListTile(
            leading: Icon(Icons.addchart),
            title: Text('Dernières Ventes'),
            onTap: () {
              // Handle settings button tap
            },
          ),
          ListTile(
            leading: Icon(Icons.groups),
            title: Text('Top 3 Vendeurs'),
            onTap: () {
              // Handle settings button tap
            },
          )
        ],
      ),
    );
  }
}
