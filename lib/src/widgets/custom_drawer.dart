import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/app_state.dart';
import 'package:flutter_project/src/services/authentication.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  final ApplicationState appState;

  const CustomDrawer(this.appState, {super.key});

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
              )),
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
          ),
          const Divider(),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => AuthFunc(
              loggedIn: appState.loggedIn,
              signOut: () {
                FirebaseAuth.instance.signOut();
                context.push('/sign-in');
              },
            ),
          )
        ],
      ),
    );
  }
}
