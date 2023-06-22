// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controller/share/components/component.dart';
import 'package:carousel_slider/carousel_slider.dart';

class EasyTwoShipDetailsScreen extends StatefulWidget {
  const EasyTwoShipDetailsScreen({super.key});

  @override
  State<EasyTwoShipDetailsScreen> createState() =>
      _EasyTwoShipDetailsScreenState();
}

class _EasyTwoShipDetailsScreenState extends State<EasyTwoShipDetailsScreen> {
  int activeIndex = 0;
  final controller = CarouselController();
  List<String> pathImages = [
    'asset/images/1.gif',
    'asset/images/2.jpg',
    'asset/images/3.jpg',
    'asset/images/4.jpg',
    'asset/images/5.png',
    'asset/images/6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColorNavyBlue,
      appBar: AppBar(
        iconTheme:  IconThemeData(color: defaultColorWhite,),
        title:  Text(
          'Package Images',
          style: TextStyle(
            color: defaultColorWhite,
          ),
        ),
        centerTitle: true,
        leading: Image.asset(
          'asset/images/logo-removebg.png',
        ),
        backgroundColor: defaultColorNavyBlue,
        elevation: 0.0,
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: defaultColorNavyBlue,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      endDrawer: defaultDrawer(context: context),
      body: Center(
        child: Container(
          width: 300,
          height: 530,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: defaultColorWhite,
            border: Border.all(
              color: defaultColorNavyBlue,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CarouselSlider.builder(
                  carouselController: controller,
                  itemCount: pathImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = pathImages[index];
                    return buildImage(urlImage, index);
                  },
                  options: CarouselOptions(
                    height: 400,
                    autoPlay: true,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                buildIndicator(),
                const SizedBox(
                  height: 12,
                ),
                defaultButton(
                  text: 'Back',
                  widt: 100,
                  function: () {
                    Navigator.of(context).pop();
                  },
                  color: defaultColorOrange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() =>
      AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: ExpandingDotsEffect(
          dotWidth: 15,
          activeDotColor: defaultColorOrange,
        ),
        activeIndex: activeIndex,
        count: pathImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);

  Widget buildImage(String urlImage, int index) =>
      Container(child: Image.asset(urlImage, fit: BoxFit.cover));
}
