import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_cataloge/models/cart.dart';
import 'package:flutter_cataloge/models/catalog.dart';

class MyStore extends VxStore {
  late CartModel cart;
  late CatalogModel catalog;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
