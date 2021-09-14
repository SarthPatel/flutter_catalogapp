import 'package:flutter_catalogapp/models/catalog.dart';

class CartModel
{
  CatalogModel _catalog;

  //Collection of IDS - store Ids of each item
  final List<int> _itemIds = [];

  //Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalprice => items.fold(0, (total, current) => total + current.price);

  // ADD Item
  void add(Item item)
  {
    _itemIds.add(item.id);
  }

  // Remove Item
  void remove(Item item)
  {
    _itemIds.remove(item.id);
  }
}