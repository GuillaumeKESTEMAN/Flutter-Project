import 'package:flutter_project/src/models/sale.dart';

class FirebaseService {
  void getProducts() {
    // change method return type to Product[]
    // create ProductDto to correspond to Firestore
    // convert ProductDto to Product
  }

  void getCurrentUser() {
    // change method return type to User
    // create UserDto to correspond to Firestore
    // convert UserDto to User
  }

  void getSalesOrderedByTime({int limit = 10}) {
    // create SaleDto to correspond to Firestore
    // change method return type to Sale[]
    // get sales from Firestore
  }

  void createSale(Sale sale) {
    // create SaleDto to correspond to Firestore
    // convert Sale to SaleDto
    // post the sale to Firestore
  }
}
