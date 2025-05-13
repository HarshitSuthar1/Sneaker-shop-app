import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sneaker_app/animations/fade_animation.dart';
import 'package:sneaker_app/data/dummy_data.dart';
import 'package:sneaker_app/models/models.dart';
import 'package:sneaker_app/theme/custom_app_theme.dart';
import 'package:sneaker_app/utils/constants.dart';
import 'package:sneaker_app/view/detail/details_view.dart';
import 'package:sneaker_app/view/home/components/home_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndexOfCategory = 0;
  int selectedIndexOfFeatured = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: const HomeAppBar(),
        body: Column(
          children: [
            _categorySection(size),
            SizedBox(height: size.height * 0.04),
            _mainShoesListView(size),
            _moreTextAndIcon(),
            _bottomSideCategory(size),
          ],
        ),
      ),
    );
  }

  SizedBox _bottomSideCategory(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.26,
      child: ListView.builder(
        itemCount: availableShoes.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          ShoeModel model = availableShoes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsView(
                            isComeFromMoreSection: true,
                            model: model,
                          )));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 4,
                    child: FadeAnimation(
                      delay: 1,
                      child: Container(
                        width: size.width / 13,
                        height: size.height / 10,
                        color: Colors.red,
                        child: const RotatedBox(
                          quarterTurns: -1,
                          child: Center(
                            child: FadeAnimation(
                                delay: 1.5,
                                child: Text(
                                  'NEW',
                                  style: AppThemes.homeGridNewText,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 5,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          color: AppConstantsColor.darkTextColor,
                        )),
                  ),
                  Positioned(
                    top: 40,
                    child: FadeAnimation(
                      delay: 1.5,
                      child: RotationTransition(
                        turns: const AlwaysStoppedAnimation(-13 / 360),
                        child: Hero(
                          tag: model.model,
                          child: Image(
                              image: AssetImage(model.imgAddress),
                              width: size.width * 0.45),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    child: FadeAnimation(
                      delay: 2,
                      child: Text(
                        "${model.name} ${model.model}",
                        style: AppThemes.homeGridNameAndModel,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    child: FadeAnimation(
                        delay: 2.3,
                        child: FittedBox(
                          child: Text(
                            "\$${model.price.toStringAsFixed(2)}",
                            style: AppThemes.homeGridPrice,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _moreTextAndIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "More",
            style: AppThemes.homeMoreText,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.arrow_right,
              size: 27,
            ),
          )
        ],
      ),
    );
  }

  /// **Category List View**
  Widget _categorySection(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.04,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndexOfCategory = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Text(
                categories[index],
                style: TextStyle(
                  fontSize: selectedIndexOfCategory == index ? 21 : 18,
                  color: selectedIndexOfCategory == index
                      ? AppConstantsColor.darkTextColor
                      : AppConstantsColor.unSelectedTextColor,
                  fontWeight: selectedIndexOfCategory == index
                      ? FontWeight.w600
                      : FontWeight.w400,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// **Featured List View**
  Widget _mainShoesListView(Size size) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          width: size.width / 16,
          height: size.height / 2.9,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: featured.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndexOfFeatured = index;
                    });
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Text(
                      featured[index],
                      style: TextStyle(
                        fontSize: selectedIndexOfFeatured == index ? 21 : 18,
                        color: selectedIndexOfFeatured == index
                            ? AppConstantsColor.darkTextColor
                            : AppConstantsColor.unSelectedTextColor,
                        fontWeight: selectedIndexOfFeatured == index
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          width: size.width * 0.87,
          height: size.height * 0.4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: availableShoes.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              ShoeModel model = availableShoes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsView(
                                isComeFromMoreSection: false,
                                model: model,
                              )));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: size.height * 0.005,
                      vertical: size.width * 0.01),
                  width: size.width / 1.5,
                  child: Stack(
                    children: [
                      Container(
                        width: size.width / 1.81,
                        decoration: BoxDecoration(
                          color: model.modelColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        child: FadeAnimation(
                          delay: 1,
                          child: Row(
                            children: [
                              Text(
                                model.name,
                                style: AppThemes.homeProductName,
                              ),
                              SizedBox(
                                width: size.width * 0.3,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 10,
                        child: FadeAnimation(
                            delay: 1.5,
                            child: Text(
                              model.model,
                              style: AppThemes.homeProductModel,
                            )),
                      ),
                      Positioned(
                        top: 80,
                        left: 10,
                        child: FadeAnimation(
                            delay: 2,
                            child: Text(
                              "\$${model.price.toStringAsFixed(2)}",
                              style: AppThemes.homeProductPrice,
                            )),
                      ),
                      Positioned(
                        right: 10,
                        top: 50,
                        child: FadeAnimation(
                          delay: 2,
                          child: Hero(
                            tag: model.imgAddress,
                            child: RotationTransition(
                              turns: const AlwaysStoppedAnimation(-30 / 360),
                              child: SizedBox(
                                width: 250,
                                height: 230,
                                child: Image(
                                  image: AssetImage(model.imgAddress),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 160,
                        child: IconButton(
                            onPressed: () {},
                            icon: FaIcon(
                              FontAwesomeIcons.arrowCircleRight,
                              color: Colors.white,
                              size: 25,
                            )),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
