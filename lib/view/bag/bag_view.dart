import 'package:flutter/material.dart';
import 'package:sneaker_app/animations/fade_animation.dart';
import 'package:sneaker_app/data/dummy_data.dart';
import 'package:sneaker_app/models/models.dart';
import 'package:sneaker_app/theme/custom_app_theme.dart';
import 'package:sneaker_app/utils/app_methods.dart';
import 'package:sneaker_app/utils/constants.dart';
import 'package:sneaker_app/view/bag/components/empty_state.dart';

class BagView extends StatefulWidget {
  const BagView({super.key});

  @override
  State<BagView> createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  int lengthsOfItemsOnBag = itemsOnBag.length;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 0.8),
          width: width,
          height: height,
          child: Column(
            children: [
              _bagAppBar(width, height),
              const SizedBox(height: 10),
              itemsOnBag.isEmpty
                  ? const EmptyState()
                  : Column(
                      children: [
                        _mainProductList(width, height),
                        _bottomBar(width, height),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomBar(double width, double height) {
    return Container(
      width: width,
      height: height / 7,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FadeAnimation(
            delay: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total', style: AppThemes.bagTotalPrice),
                Text(
                  "\$${AppMethods.sumOfItemsOnBag()}",
                  style: AppThemes.bagTotalPrice,
                ),
              ],
            ),
          ),
          customMaterialButton(width, height),
        ],
      ),
    );
  }

  Widget customMaterialButton(double width, double height) {
    return FadeAnimation(
      delay: 3,
      child: SizedBox(
        width: width / 1.2,
        height: height / 15,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppConstantsColor.materialButtonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {},
          child: const Text(
            "Next",
            style: TextStyle(
              color: AppConstantsColor.lightTextColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _mainProductList(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.6,
      child: itemsOnBag.isEmpty
          ? const EmptyState()
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: itemsOnBag.length,
              itemBuilder: (context, index) {
                ShoeModel currentItem = itemsOnBag[index];
                return FadeAnimation(
                  delay: 1.5 * (index / 4),
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    width: width,
                    height: height * 0.2,
                    child: Row(
                      children: [
                        SizedBox(
                          width: width * 0.4,
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                width: width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      currentItem.modelColor.withOpacity(0.9),
                                ),
                              ),
                              Positioned(
                                right: 2,
                                bottom: 15,
                                child: RotationTransition(
                                  turns:
                                      const AlwaysStoppedAnimation(-40 / 360),
                                  child: SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: Image.asset(
                                      currentItem.imgAddress,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(currentItem.model,
                                  style: AppThemes.bagProductModel),
                              const SizedBox(height: 4),
                              Text("\$${currentItem.price}",
                                  style: AppThemes.bagProductPrice),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        itemsOnBag.remove(currentItem);
                                        lengthsOfItemsOnBag = itemsOnBag.length;
                                      });
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300],
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.remove, size: 15),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      "${currentItem.price}",
                                      style: AppThemes.bagProductNumOfShoe,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300],
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.add, size: 15),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  SizedBox _bagAppBar(double width, double height) {
    return SizedBox(
      width: width,
      height: height / 14,
      child: FadeAnimation(
        delay: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('My Bag', style: AppThemes.bagTitle),
            Text(
              "Total: $lengthsOfItemsOnBag Items",
              style: AppThemes.bagTotalPrice,
            ),
          ],
        ),
      ),
    );
  }
}
