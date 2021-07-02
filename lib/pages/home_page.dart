import 'package:cached_network_image/cached_network_image.dart';
import 'package:femmer/components/categories_icon.dart';
import 'package:femmer/models/get_image_url.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/image_carousel.dart';
import '../components/grid_view_list.dart';

import '../models/custom_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: "Press back again to exit",
        backgroundColor: Colors.grey[900],
        textColor: Colors.white,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 100,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.grey[500],
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(FontAwesomeIcons.home),
                    onPressed: () {
                      print('home');
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.search),
                    onPressed: () {
                      // print('search');
                      showSearch(
                          context: context, delegate: CustomSearchDelegate());
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.solidHeart),
                    onPressed: () {
                      print('wishlist');
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.shoppingCart),
                    onPressed: () {
                      print('cart');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.09,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          titleSpacing: 0,
          actions: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: SvgPicture.asset(
                  'assets/images/drawer.svg',
                ),
              ),
            ),
            Builder(
              builder: (context) => Expanded(
                child: GestureDetector(
                  child: Align(
                    alignment: Alignment(0.9, 0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/general/indra.jpeg',
                      ),
                    ),
                  ),
                  onTap: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
            ),

            // Expanded(
            //   child: Align(
            //     alignment: Alignment(1, 0),
            //     child: Padding(
            //       padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
            //       child: IconButton(
            //         onPressed: () {
            //           // Navigator.push(
            //           //   context,
            //           //   MaterialPageRoute(
            //           //     builder: (_) => SearchPage(),
            //           //   ),
            //           // );
            //         },
            //         icon: Icon(
            //           Icons.search,
            //           color: Colors.black,
            //           size: 30,
            //         ),
            //         iconSize: 30,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
        drawer: Container(
          child: Drawer(
            child: Center(
              child: Text(
                'browse different categories',
              ),
            ),
          ),
        ),
        endDrawer: Container(
          child: Drawer(
            child: Center(
              child: Text("user profile stuff here"),
            ),
          ),
        ),
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: true,
          minimum: EdgeInsets.only(top: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                CarouselWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                GridViewWidget(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Column(
                    children: [
                      Container(
                        child: Align(
                          alignment: Alignment(-1, 0),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              "Shop by categories",
                              style: GoogleFonts.playfairDisplay(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                CategoriesWidget(
                                  imagePath: getImageURL('men_category.jpg'),
                                  category: 'Men',
                                ),
                                CategoriesWidget(
                                  imagePath: getImageURL('women_category.jpg'),
                                  category: 'Women',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: onWillPop,
    );
  }
}
