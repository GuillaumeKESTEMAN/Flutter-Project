import 'package:flutter/material.dart';
import 'package:flutter_project/app_state.dart';

class CustomDrawer extends StatelessWidget {
  final ApplicationState appState;

  CustomDrawer(this.appState);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(appState.user?.displayName ?? ""),
              accountEmail: Text(appState.user?.email ?? ""),
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
