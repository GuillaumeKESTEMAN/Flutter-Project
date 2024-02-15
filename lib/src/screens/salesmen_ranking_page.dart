import 'package:flutter/material.dart';
import '/src/models/user.dart';
import 'package:flutter_project/app_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/src/widgets/custom_drawer.dart';

class SalesmenRankingPage extends StatelessWidget {
  List<User> salesmen = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(16, 132, 132, 1),
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(16, 132, 132, 1),
            centerTitle: true,
            title: const Text('Classement des Vendeurs',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ))),
        drawer: Consumer<ApplicationState>(
          builder: (context, appState, _) => CustomDrawer(appState),
        ),
        body: Center(
            child: Column(
          children: [
            DataTable(
              columns: [
                DataColumn(label: Text('Rang')),
                DataColumn(label: Text('Vendeur')),
                DataColumn(label: Text('Ventes')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('John')),
                  DataCell(Text('100')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2')),
                  DataCell(Text('Jane')),
                  DataCell(Text('90')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3')),
                  DataCell(Text('Mike')),
                  DataCell(Text('80')),
                ]),
              ],
            ),
          ],
        )));
  }
}
