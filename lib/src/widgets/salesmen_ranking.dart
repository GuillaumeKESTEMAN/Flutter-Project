import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/src/models/user.dart';

class SalesmenRankingWidget extends StatelessWidget {
  List<User> topSalesmen = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: 
    Column(
      children: [
        Text(
          'Top 3 Vendeurs',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        DataTable(
          border: TableBorder.all(),
          columns: [
            DataColumn(label: Text('Rang')),
            DataColumn(label: Text('Vendeur')),
            DataColumn(label: Text('Ventes Totales'))
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Jean Mich')),
              DataCell(Text('\€30000')),
            ]),
             DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('Sébastien')),
              DataCell(Text('\€25000')),
            ]),
             DataRow(cells: [
              DataCell(Text('3')),
              DataCell(Text('Philippe')),
              DataCell(Text('\€22500')),
            ]),
          ],
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            context.push('/salesmen-ranking');
          },
          child: Text('Consulter le Classement Complet'),
        ),
        SizedBox(height: 20),
      ],
    )
    );
  }
}
