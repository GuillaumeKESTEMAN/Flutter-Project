import 'package:flutter/material.dart';
import 'package:flutter_project/app_state.dart';
import 'package:flutter_project/src/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final ApplicationState appState;

  const HomePage(this.appState, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(16, 132, 132, 1),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // To add
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(16, 132, 132, 1),
            centerTitle: true,
            title: const Text('Accueil',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ))),
        drawer: Consumer<ApplicationState>(
          builder: (context, appState, _) => CustomDrawer(appState),
        ),
        body: appState.loggedIn
            ? Stack(
                children: [
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: Text(
                      'Placeholder Dernières Ventes',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )),
                SizedBox(height: 20),
                Container(
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: Text(
                      'Placeholder Top 3 Vendeurs',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )),
              ],
            )),
          ],
              )
            : Scaffold(),
      ),
    );
  }
}
