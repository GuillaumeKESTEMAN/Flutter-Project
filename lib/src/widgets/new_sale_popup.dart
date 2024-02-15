import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/app_state.dart';
import 'package:flutter_project/src/models/dropdown_element.dart';
import 'package:flutter_project/src/models/product.dart';
import 'package:provider/provider.dart';

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
          content: Consumer<ApplicationState>(
              builder: (context, appState, _) => NewSaleForm(
                    appState: appState,
                  )),
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
  final ApplicationState appState;

  const NewSaleForm({required this.appState, super.key});

  @override
  State<NewSaleForm> createState() => _NewSaleFormState();
}

class _NewSaleFormState extends State<NewSaleForm> {
  final _formKey = GlobalKey<FormState>();
  final _textEditingController = TextEditingController();

  int quantity = 0;
  int price = 0;
  Product? selectedProduct;
  String selectedStatus = '';

  bool priceEditable = false;

  void _validateForm() {
    print('Quantité: $quantity');
    print('Prix total: ${quantity * price}');
    print('Statut sélectionné: $selectedStatus');
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownElement> productList = widget.appState.products
        .map((e) => DropdownElement(label: e.name, value: e.id))
        .toList();

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
          DropdownMenuExample(
            options: productList,
            onChanged: (String value) {
              Product newProduct = widget.appState.products
                  .firstWhere((element) => element.id == value);
              setState(() {
                selectedProduct = newProduct;

                if (selectedProduct != null && quantity > 0) {
                  price = newProduct.price * quantity;
                }
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Précisez la quantité"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (value) {
              setState(() {
                quantity = int.parse(value);

                if (selectedProduct != null && quantity > 0) {
                  price = selectedProduct!.price * quantity;
                }
              });
            },
          ),
          SizedBox(height: 20),
          Text(
            'Prix',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "${price}"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            enabled: priceEditable,
          ),
          Row(
            children: [
              Text('Modifier manuellement le prix : '),
              SwitchExample(
                onChanged: (value) {
                  setState(() {
                    // Enable/disable price field based on switch value
                    priceEditable = value;
                  });
                },
              ),
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
          DropdownMenuExample(
            options: [],
            onChanged: (value) {
              setState(() {
                selectedStatus = value;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _validateForm,
            child: Text('Valider'),
          ),
        ],
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final List<DropdownElement> options;

  const DropdownMenuExample({Key? key, this.onChanged, required this.options})
      : super(key: key);

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = ''; // Initialisation du produit sélectionné

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        });
      },
      dropdownMenuEntries: widget.options
          .map<DropdownMenuEntry<String>>((DropdownElement element) {
        return DropdownMenuEntry<String>(
            value: element.value, label: element.label);
      }).toList(),
    );
  }
}

class SwitchExample extends StatefulWidget {
  final ValueChanged<bool>? onChanged;

  const SwitchExample({Key? key, this.onChanged}) : super(key: key);

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool enabled = false; // Ajout de la variable enabled

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: enabled,
      activeColor: const Color.fromRGBO(16, 132, 132, 1),
      onChanged: (bool value) {
        setState(() {
          enabled = value;
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        });
      },
    );
  }
}
