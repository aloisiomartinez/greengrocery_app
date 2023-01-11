import 'package:flutter/material.dart';
import 'package:green_grocery/src/config/custom_colors.dart';
import 'package:green_grocery/src/models/item_model.dart';
import 'package:green_grocery/src/pages/product/product_screen.dart';
import 'package:green_grocery/src/services/utils_services.dart';

class ItemTile extends StatelessWidget {
  ItemModel item;
  final GlobalKey imageGk = GlobalKey();
  final void Function(GlobalKey) cartAnimationMethod;

  ItemTile({Key? key, required this.item, required this.cartAnimationMethod})
      : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ProductScreen(
                item: item,
              );
            }));
          },
          child: Card(
            elevation: 2,
            shadowColor: Colors.grey.shade300,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Image
                  Expanded(
                      child: Hero(
                          tag: item.imgUrl,
                          child: Image.asset(
                            item.imgUrl,
                            key: imageGk,
                          ))),

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
                        utilsServices.priceToCurrency(item.price),
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
          ),
        ),
        Positioned(
            top: 4,
            right: 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20)),
              child: Material(
                child: InkWell(
                  onTap: () {
                    cartAnimationMethod(imageGk);
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: CustomColors.customSwatchColor,
                    ),
                    height: 40,
                    width: 35,
                    child: const Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
