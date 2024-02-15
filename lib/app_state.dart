import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/src/models/product.dart';
import 'package:flutter_project/src/services/firebase.dart';

import 'firebase_options.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  final FirebaseService _firebaseService = FirebaseService();

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  User? _user = null;
  User? get user => _user;

  List<Product> _products = [];
  List<Product> get products => _products;

  Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);

    FirebaseAuth.instance.userChanges().listen((user) async {
      if (user != null) {
        _loggedIn = true;
        _user = user;

        if (products.isEmpty) {
          _products = await _firebaseService.getProducts();
        }
      } else {
        _loggedIn = false;
        _user = null;
      }
      notifyListeners();
    });
  }
}
