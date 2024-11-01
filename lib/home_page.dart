import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'account_page.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'notificaions_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isClicked = false;
  final List<String> imglist = [
    "assets/images/015d5d5b0f75f510.webp",
    "assets/images/Big-Billion-Days-1-1000x600.jpg",
    "assets/images/flipkart-independence-day-mobile-phones-bonanza-sale-on-poco-smartphones-1660496682.webp",
    "assets/images/flipkart-phone-for-free-offer-details-cashback-1630140116.jpg",
    "assets/images/Pre-Book-Nothing-Phone-1-on-Flipkart.jpg",
  ];

  int currentIndex = 0;

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 90,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/images/Flipkart-Logo-removebg-preview.png"),
                  ),
                ),
              ),
              const Text(
                "Flipkart",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Brand Mall',
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.black87,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 1,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterSwitch(
                              activeTextColor: Colors.white,
                              width: 50,
                              height: 18,
                              padding: 2,
                              valueFontSize: 11,
                              toggleSize: 18,
                              value: isClicked,
                              activeColor: Colors.black,
                              borderRadius: 50.0,
                              showOnOff: true,
                              onToggle: (val) {
                                setState(() {
                                  isClicked = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      color: Colors.grey[100],
                      height: 50,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.mic_none_outlined),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.none,
                                color: Colors.transparent),
                          ),
                          hintText: 'search',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            color: Colors.black87,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                CarouselSlider.builder(
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      height: 160.0,
                      viewportFraction: 1,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                    ),
                    itemCount: imglist.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: const BoxDecoration(color: Colors.black),
                        padding: const EdgeInsets.only(),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          child: Image(
                            image: AssetImage(imglist[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
                Positioned(
                  bottom: 0,
                  width: 350,
                  child: DotsIndicator(
                    dotsCount: 5,
                    position: currentIndex,
                    decorator: DotsDecorator(
                        size: const Size.square(8.0),
                        activeSize: const Size(14.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: Colors.grey,
                        activeColor: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 80,
              width: 360,
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.black12),
                            height: 30,
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  top: 2, left: 2, bottom: 2, right: 2),
                              child: Image(
                                image: AssetImage(
                                    "assets/images/1696668859811_SKU-3776_0.png"),
                                height: 30,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, right: 2),
                          child: Text(
                            "SuperCoin",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage("assets/images/vcFigOB (1).png"),
                            height: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 2),
                          child: Text(
                            "Feeds",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage(
                                "assets/images/flipkart-app-revampled.png"),
                            height: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 2),
                          child: Text(
                            "Offers",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage(
                                "assets/images/Flipkart_Brand-Mall-1200x805.png"),
                            height: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 2),
                          child: Text(
                            "Plus",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage(
                                "assets/images/388963b1b4a48ace76c4f887e79ac22181851794.png"),
                            height: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 2),
                          child: Text(
                            "Stores",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage(
                                "assets/images/1696668859811_SKU-3776_0.png"),
                            height: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 2),
                          child: Text(
                            "SuperCoin",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage(
                                "assets/images/1696668859811_SKU-3776_0.png"),
                            height: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 2),
                          child: Text(
                            "SuperCoin",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage(
                                "assets/images/1696668859811_SKU-3776_0.png"),
                            height: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 2),
                          child: Text(
                            "SuperCoin",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage(
                                "assets/images/1696668859811_SKU-3776_0.png"),
                            height: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 2),
                          child: Text(
                            "SuperCoin",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage(
                                "assets/images/1696668859811_SKU-3776_0.png"),
                            height: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 2),
                          child: Text(
                            "SuperCoin",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              height: 5,
              width: 380,
              color: Colors.black12,
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "FAVORITE BRANDS FOR YOU",
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                      ),
                      height: 200,
                      width: 150,
                      child: const Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 1, top: 10, bottom: 1),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/Samsung_-_Galaxy_A54_5G_-_Awesome_Graphite__92791.jpg"),
                              height: 120,
                            ),
                          ),
                          SizedBox(
                            height: 46,
                          ),
                          Text(
                            "Mobiles",
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                      ),
                      height: 200,
                      width: 150,
                      child: const Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 1, top: 10, bottom: 1),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/Samsung_-_Galaxy_A54_5G_-_Awesome_Graphite__92791.jpg"),
                              height: 120,
                            ),
                          ),
                          SizedBox(
                            height: 46,
                          ),
                          Text(
                            "Mobiles",
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                      ),
                      height: 200,
                      width: 150,
                      child: const Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 1, top: 10, bottom: 1),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/Samsung_-_Galaxy_A54_5G_-_Awesome_Graphite__92791.jpg"),
                              height: 120,
                            ),
                          ),
                          SizedBox(
                            height: 46,
                          ),
                          Text(
                            "Mobiles",
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                      ),
                      height: 200,
                      width: 150,
                      child: const Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 1, top: 10, bottom: 1),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/Samsung_-_Galaxy_A54_5G_-_Awesome_Graphite__92791.jpg"),
                              height: 120,
                            ),
                          ),
                          SizedBox(
                            height: 46,
                          ),
                          Text(
                            "Mobiles",
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "BRAND",
                    style: TextStyle(
                        color: Colors.amberAccent,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: Text(
                    "of the",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Image(
                    image: AssetImage("assets/images/flipkart 2.jpg"),
                    height: 30,
                  ),
                )
              ],
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Big Brands Big Savings",
                    style: TextStyle(
                        color: Colors.black26,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 150,
                    width: 100,
                    color: Colors.black12,
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Image(
                            image:
                                AssetImage("assets/images/powebank edited.png"),
                            height: 120,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 150,
                  width: 100,
                  color: Colors.black12,
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Image(
                          image:
                              AssetImage("assets/images/powebank edited.png"),
                          height: 120,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 150,
                  width: 100,
                  color: Colors.black12,
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Image(
                          image:
                              AssetImage("assets/images/powebank edited.png"),
                          height: 120,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 15,
                    width: 100,
                    color: Colors.black,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20, top: 0),
                      child: Text(
                        "Power Banks",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 15,
                    width: 100,
                    color: Colors.black,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20, top: 0),
                      child: Text(
                        "Power Banks",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 15,
                    width: 100,
                    color: Colors.black,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20, top: 0),
                      child: Text(
                        "Power Banks",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    "From ₹799",
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 12),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    "From ₹799",
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 12),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    "From ₹799",
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 150,
                    width: 100,
                    color: Colors.black12,
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Image(
                            image:
                                AssetImage("assets/images/powebank edited.png"),
                            height: 120,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 150,
                    width: 100,
                    color: Colors.black12,
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Image(
                            image:
                                AssetImage("assets/images/powebank edited.png"),
                            height: 120,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 150,
                    width: 100,
                    color: Colors.black12,
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Image(
                            image:
                                AssetImage("assets/images/powebank edited.png"),
                            height: 120,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 15,
                    width: 100,
                    color: Colors.black,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Power Banks",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 15,
                    width: 100,
                    color: Colors.black,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Power Banks",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 9),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 15,
                    width: 100,
                    color: Colors.black,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Power Banks",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 9),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    "From ₹799",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    "From ₹799",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    "From ₹799",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "RECENTLY VIEWED STORES",
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                      ),
                      height: 200,
                      width: 150,
                      child: const Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 1, top: 10, bottom: 1),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/Samsung_-_Galaxy_A54_5G_-_Awesome_Graphite__92791.jpg"),
                              height: 120,
                            ),
                          ),
                          SizedBox(
                            height: 46,
                          ),
                          Text(
                            "Mobiles",
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                      ),
                      height: 200,
                      width: 150,
                      child: const Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 1, top: 10, bottom: 1),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/Samsung_-_Galaxy_A54_5G_-_Awesome_Graphite__92791.jpg"),
                              height: 120,
                            ),
                          ),
                          SizedBox(
                            height: 46,
                          ),
                          Text(
                            "Mobiles",
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                      ),
                      height: 200,
                      width: 150,
                      child: const Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 1, top: 10, bottom: 1),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/Samsung_-_Galaxy_A54_5G_-_Awesome_Graphite__92791.jpg"),
                              height: 120,
                            ),
                          ),
                          SizedBox(
                            height: 46,
                          ),
                          Text(
                            "Mobiles",
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                      ),
                      height: 200,
                      width: 150,
                      child: const Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 1, top: 10, bottom: 1),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/Samsung_-_Galaxy_A54_5G_-_Awesome_Graphite__92791.jpg"),
                              height: 120,
                            ),
                          ),
                          SizedBox(
                            height: 46,
                          ),
                          Text(
                            "Mobiles",
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "2 items in your cart",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(
                    height: 40,
                    width: 120,
                    color: Colors.black,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Go to Cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              icon: const Icon(Icons.home),
              padding: const EdgeInsets.only(top: 24),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryPage(),
                    ));
              },
              icon: const Icon(Icons.category_outlined),
              padding: const EdgeInsets.only(top: 24),
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsPage(),
                    ));
              },
              icon: const Icon(Icons.notifications),
              padding: const EdgeInsets.only(top: 24),
            ),
            label: 'notifications',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountPage(),
                    ));
              },
              icon: const Icon(Icons.account_circle_outlined),
              padding: const EdgeInsets.only(top: 24),
            ),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ));
              },
              icon: const Icon(Icons.shopping_cart),
              padding: const EdgeInsets.only(top: 24),
            ),
            label: 'Cart',
          ),
        ],
        currentIndex: 0,
        onTap: onItemTapped,
      ),
    );
  }
}
