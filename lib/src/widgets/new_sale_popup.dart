import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewSalePopup extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _showDialog(context);
      },
      child: Icon(Icons.add),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    String newTask = '';
    _textEditingController.text = newTask;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enregister une nouvelle vente'),
          content: NewSaleForm(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                _addTodoItem(newTask);
                Navigator.of(context).pop();
              },
              child: const Text('Valider'),
            ),
          ],
        );
      },
    );
  }

  void _addTodoItem(String task) {
    // Add your logic to add a new task
    print('Adding task: $task');
  }
}

class NewSaleForm extends StatefulWidget {
  const NewSaleForm({super.key});

  @override
  State<NewSaleForm> createState() => _NewSaleFormState();
}

class _NewSaleFormState extends State<NewSaleForm> {
  final _formKey = GlobalKey<FormState>();
  final _textEditingController = TextEditingController();

  int quantity = 0;
  int price = 1500;

  @override
  Widget build(BuildContext context) {
    print(quantity);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Sélectionnez le produit',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 20),
          DropdownMenuExample(),
          TextField(
            decoration: new InputDecoration(labelText: "Précisez la quantité"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (value) => quantity = int.parse(value),
          ),
          SizedBox(height: 20),
          Text(
            'Prix',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          TextField(
            decoration: new InputDecoration(labelText: "${quantity * price}"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            enabled: enabled,
          ),
          Row(
            children: [
              Text('Modifier manuellement le prix : '),
              SwitchExample(),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Sélectionnez le Statut',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 20),
          DropdownMenuExample(),
        ],
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
bool enabled = false;

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: enabled,
      activeColor: const Color.fromRGBO(16, 132, 132, 1),
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          enabled = value;
        });
      },
    );
  }
}
