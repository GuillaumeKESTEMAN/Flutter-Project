class Product {
  final String _id;
  final String _name;
  final double _price;

  Product(this._id, this._name, this._price);

  String get name => _name;
  double get price => _price;
}
