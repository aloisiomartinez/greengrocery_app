import 'package:flutter/material.dart';
import 'package:green_grocery/src/config/custom_colors.dart';
import 'package:green_grocery/src/models/item_model.dart';

class ItemTile extends StatelessWidget {
  ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Image
            Expanded(child: Image.asset(item.imgUrl)),
            //Nome
            Text(
              item.itemName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            //Preço - Unidade
            Row(
              children: [
                Text(
                  item.price.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: CustomColors.customSwatchColor),
                ),
                Text(
                  '/${item.unit}',
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
