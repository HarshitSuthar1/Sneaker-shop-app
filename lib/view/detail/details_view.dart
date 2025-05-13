import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sneaker_app/animations/fade_animation.dart';
import 'package:sneaker_app/data/dummy_data.dart';
import 'package:sneaker_app/models/models.dart';
import 'package:sneaker_app/theme/custom_app_theme.dart';
import 'package:sneaker_app/utils/app_methods.dart';
import 'package:sneaker_app/utils/constants.dart';
import 'package:sneaker_app/view/detail/components/app_bar.dart';

class DetailsView extends StatefulWidget {
  const DetailsView(
      {Key? key, required this.model, required this.isComeFromMoreSection})
      : super(key: key);
  final ShoeModel model;
  final bool isComeFromMoreSection;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  bool _isCountrySelected = false;
  int? _isSizeSelected;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomDetailsViewAppBar(),
        body: SizedBox(
          width: size.width,
          height: size.height * 1.1,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _topProductImageAndBg(size),
                _morePicOfProduct(size),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _productNameAndPrice(),
                        _productInfo(size.width, size.height),
                        _moreDetailsText(size.width, size.height),
                        _SizedAndCountrySelectionSection(size),
                        _bottomSizeSelection(size),
                        _addToBagButton(size),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomSizeSelection(Size size) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: size.width,
      height: size.height * 0.07,
      child: FadeAnimation(
          delay: 1.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width / 4.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Try it",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: 0,
                      ),
                      RotatedBox(
                        quarterTurns: -1,
                        child: FaIcon(FontAwesomeIcons.shoePrints),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.7,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSizeSelected = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: size.width * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: _isSizeSelected == index
                                      ? Colors.black
                                      : Colors.grey,
                                  width: 1.5),
                              color: _isSizeSelected == index
                                  ? Colors.black
                                  : AppConstantsColor.backgroundColor),
                          child: Center(
                            child: Text(
                              sizes[index].toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: _isSizeSelected == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          )),
    );
  }

  Widget _SizedAndCountrySelectionSection(Size size) {
    return FadeAnimation(
      delay: 1.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Size",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppConstantsColor.darkTextColor,
                fontSize: 22,
              ),
            ),
            SizedBox(
              width: size.width * 0.35,
              height: size.height * 0.05,
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _isCountrySelected = false;
                        });
                      },
                      child: Text(
                        "Uk",
                        style: TextStyle(
                            fontWeight: _isCountrySelected
                                ? FontWeight.w400
                                : FontWeight.bold,
                            color: _isCountrySelected
                                ? Colors.grey
                                : AppConstantsColor.darkTextColor),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _isCountrySelected = true;
                        });
                      },
                      child: Text(
                        "USA",
                        style: TextStyle(
                            fontWeight: !_isCountrySelected
                                ? FontWeight.w400
                                : FontWeight.bold,
                            color: !_isCountrySelected
                                ? Colors.grey
                                : AppConstantsColor.darkTextColor),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _moreDetailsText(Width, height) {
    return FadeAnimation(
        delay: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            'MORE DETAILS',
            style: AppThemes.detailsMoreText,
          ),
        ));
  }

  Widget _productInfo(width, height) {
    return FadeAnimation(
        delay: 1.5,
        child: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: SizedBox(
            width: width,
            height: height / 9,
            child: Text(
              "Lorem ispum iuevbehrv uerfvberfviuebv vceiurbveuvfne rfvuerbfveiuv evnreiubve dfceirubvdiv fiv efeiurbvsbv sdfvirubd v rfviuebf vsrkfvnes v fneiurhgieubb wiergbf wprghwrug weriunuwbgewe wieruhgqirthwrigb do ejf werherv wrhefeoirvberh eebrifuenbgvehrf ehrbfeiurfe",
              style: AppThemes.detailsProductDescriptions,
            ),
          ),
        ));
  }

  _productNameAndPrice() {
    return FadeAnimation(
        delay: 1,
        child: Row(
          children: [
            Text(
              widget.model.model,
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: AppConstantsColor.darkTextColor),
            ),
            Expanded(child: Container()),
            Text(
              '\$${widget.model.price.toStringAsFixed(2)}',
              style: AppThemes.detailsProductPrice,
            )
          ],
        ));
  }

  Widget _morePicOfProduct(Size size) {
    return FadeAnimation(
      delay: 0.5,
      child: SizedBox(
        width: size.width,
        height: size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              4,
              (index) => index == 3
                  ? Container(
                      padding: EdgeInsets.all(2),
                      width: size.width / 5,
                      height: size.height / 14,
                      decoration: BoxDecoration(
                        color: Colors.green[300],
                        image: DecorationImage(
                            image: AssetImage(widget.model.imgAddress),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.grey.withOpacity(1), BlendMode.darken)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.play_circle_fill,
                          color: AppConstantsColor.lightTextColor,
                          size: 30,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      child: roundedImage(size.width, size.height),
                    )),
        ),
      ),
    );
  }

  Widget _topProductImageAndBg(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height / 2.3,
      child: Stack(
        children: [
          Positioned(
            left: 60,
            bottom: 20,
            child: FadeAnimation(
              delay: 0.5,
              child: Container(
                width: size.width,
                height: size.height / 2.2,
                decoration: BoxDecoration(
                    color: widget.model.modelColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(1500),
                      bottomRight: Radius.circular(100),
                    )),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Hero(
              tag: widget.isComeFromMoreSection
                  ? widget.model.model
                  : widget.model.imgAddress,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-25 / 360),
                child: SizedBox(
                  width: size.width / 1.3,
                  height: size.height / 4.3,
                  child: Image(image: AssetImage(widget.model.imgAddress)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  roundedImage(width, height) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Image(image: AssetImage(widget.model.imgAddress)),
    );
  }

  Widget _addToBagButton(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: FadeAnimation(
          delay: 1,
          child: MaterialButton(
            minWidth: size.width / 1.2,
            height: size.height / 15,
            color: widget.model.modelColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              AppMethods.addToCart(widget.model, context);
              Navigator.pushNamed(context, "/bagView");
            },
            child: const Text(
              "ADD TO BAG",
              style: TextStyle(color: AppConstantsColor.lightTextColor),
            ),
          ),
        ),
      ),
    );
  }
}
