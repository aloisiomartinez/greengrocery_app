import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:get/get.dart';
import 'package:green_grocery/src/config/custom_colors.dart';
import 'package:green_grocery/src/pages/common_widgets/custom_shmmer.dart';
import 'package:green_grocery/src/pages/home/controller/home_controller.dart';
import 'package:green_grocery/src/pages/home/view/components/item_tile.dart';
import 'package:green_grocery/src/services/utils_services.dart';
import '../../common_widgets/app_name_widget.dart';
import 'components/category_tile.dart';
import 'package:green_grocery/src/config/app_data.dart' as appData;

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  @override
  void initState() {
    super.initState();
  }

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //App Bar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const AppNameWidget(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: GestureDetector(
                onTap: () {},
                child: badge.Badge(
                    badgeColor: CustomColors.customContrastColor,
                    badgeContent: const Text(
                      '2',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    child: AddToCartIcon(
                      key: globalKeyCartItems,
                      icon: Icon(
                        Icons.shopping_cart,
                        color: CustomColors.customSwatchColor,
                      ),
                    )),
              ),
            )
          ],
        ),
        body: AddToCartAnimation(
          gkCart: globalKeyCartItems,
          previewDuration: const Duration(milliseconds: 100),
          previewCurve: Curves.ease,
          receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
            runAddToCardAnimation = addToCardAnimationMethod;
          },
          child: Column(
            children: [
              //Campo de Pesquisa
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      hintText: 'Pesquise aqui...',
                      hintStyle:
                          TextStyle(color: Colors.grey.shade400, fontSize: 14),
                      prefixIcon: Icon(
                        Icons.search,
                        color: CustomColors.customContrastColor,
                        size: 21,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none))),
                ),
              ),

              // Categorias
              GetBuilder<HomeController>(builder: (controller) {
                return Container(
                  padding: const EdgeInsets.only(left: 25),
                  height: 40,
                  child: !controller.isLoading
                      ? ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return CategoryTile(
                              onPressed: () {
                                controller.selectCategory(
                                    controller.allCategories[index]);
                              },
                              category: controller.allCategories[index].title,
                              isSelected: controller.allCategories[index] ==
                                  controller.currentCategory,
                            );
                          },
                          separatorBuilder: (_, index) => const SizedBox(
                            width: 10,
                          ),
                          itemCount: controller.allCategories.length,
                        )
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                              10,
                              (index) => Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(right: 12),
                                    child: CustomShimmer(
                                      height: 20,
                                      width: 80,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ))),
                );
              }),

              // Grid
              GetBuilder<HomeController>(builder: (controller) {
                return Expanded(
                  child: !controller.isLoading
                      ? GridView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 9 / 11.5,
                          ),
                          itemCount: appData.items.length,
                          itemBuilder: (_, index) {
                            return ItemTile(
                                item: appData.items[index],
                                cartAnimationMethod:
                                    itemSelectedCartAnimations);
                          },
                        )
                      : GridView.count(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          physics: const BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 11.5,
                          children: List.generate(
                              10,
                              (index) => CustomShimmer(
                                    height: double.infinity,
                                    width: double.infinity,
                                    borderRadius: BorderRadius.circular(20),
                                  ))),
                );
              })
            ],
          ),
        ));
  }
}
