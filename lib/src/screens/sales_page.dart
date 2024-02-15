import 'package:flutter/material.dart';
import '/src/models/sale.dart';
import 'package:flutter_project/src/widgets/custom_drawer.dart';
import 'package:flutter_project/app_state.dart';
import 'package:provider/provider.dart';

class SalesPage extends StatelessWidget {
  List<Sale> sales = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 132, 132, 1),
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(16, 132, 132, 1),
          centerTitle: true,
          title: const Text('Historique des Ventes',
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
              DataColumn(label: Text('Vendeur')),
              DataColumn(label: Text('Valeur de la Vente')),
              DataColumn(label: Text('Statut')),
              DataColumn(label: Text('Date/Heure')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Jean Mich')),
                DataCell(Text('\€1500')),
                DataCell(Text('Vendu')),
                DataCell(Text('2024-02-15 10:00')),
              ]),
              DataRow(cells: [
                DataCell(Text('Christophe')),
                DataCell(Text('\€3000')),
                DataCell(Text('Visite Technique Effectuée')),
                DataCell(Text('2024-02-13 10:00')),
              ]),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Text('Charger plus'),
          )
        ],
      )),
    );
  }
}
