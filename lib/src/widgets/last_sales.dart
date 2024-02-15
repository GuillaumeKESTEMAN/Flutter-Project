import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/src/models/sale.dart';

class LastSalesWidget extends StatelessWidget {
  List<Sale> lastSales = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Dernières Ventes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        DataTable(
          border: TableBorder.all(),
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
              ]
            ),
          ],
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            context.push('/sales');
          },
          child: Text('Consulter toutes les Ventes'),
        ),
      ],
    );
  }
}
