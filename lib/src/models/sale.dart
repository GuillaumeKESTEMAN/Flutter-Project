import '/src/models/product.dart';
import '/src/models/user.dart';
import '/src/models/status.dart';

class Sale {
  int _id;
  Product _product;
  double price;
  User _user;
  Status status;
  DateTime _createdAt;

  Sale(
    this._id,
    this._product,
    this.price,
    this._user,
    this.status,
    this._createdAt,
  );

  Product get product => _product;
  User get user => _user;
  DateTime get createdAt => _createdAt;
}
