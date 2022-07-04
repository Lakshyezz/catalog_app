// ignore_for_file: unused_field

import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_cataloge/core/store.dart';
import 'package:flutter_cataloge/models/catalog.dart';

class CartModel {
  late CatalogModel _catalog;

  //collection of Ids - store Ids of item
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  //set Catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

//get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
