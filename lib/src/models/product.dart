class Product {
  int _id;
  String _name;
  double _price;

  Product(this._id, this._name, this._price);

  String get name => _name;
  double get price => _price;
}
