import 'package:flutter/material.dart';
import 'package:flutter_project/app_state.dart';
import 'package:flutter_project/src/widgets/custom_drawer.dart';
import 'package:flutter_project/src/widgets/last_sales.dart';
import 'package:flutter_project/src/widgets/salesmen_ranking.dart';
import 'package:flutter_project/src/widgets/new_sale_popup.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final ApplicationState appState;

  const HomePage(this.appState, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(16, 132, 132, 1),
        floatingActionButton: NewSalePopup(),
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
            ? SingleChildScrollView(
              child:
            Stack(
                children: [
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: LastSalesWidget(),
                ),
                SizedBox(height: 20),
                Container(
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: SalesmenRankingWidget()
                ),
              ],
            )),
          ],
              )
            )
            : Scaffold(),
      ),
    );
  }
}
