import 'package:green_grocery/src/models/item_model.dart';

class CartItemModel {
  ItemModel item;
  int quantity;

  CartItemModel({required this.item, required this.quantity});

  double totalPrice() =>
     item.price * quantity;

}