import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project/src/models/product.dart';
import 'package:flutter_project/src/models/sale.dart';

class FirebaseService {
  Future<List<Product>> getProducts() async {
    CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');

    QuerySnapshot querySnapshot = await productsCollection.get();
    
    List<Product> products = [];
    for (final doc in querySnapshot.docs) {
      Map productMap = doc.data() as Map;
      products.add(Product(
          id: doc.id, name: productMap['name'], price: productMap['price']));
    }

    return products;
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
