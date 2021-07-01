import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/image_carousel.dart';
import '../components/grid_view_list.dart';

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
          elevation: 100,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey[300],
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
                      print('home');
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.solidHeart),
                    onPressed: () {
                      print('home');
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.shoppingCart),
                    onPressed: () {
                      print('home');
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
            Expanded(
              child: GestureDetector(
                child: Align(
                  alignment: Alignment(0.9, 0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/general/indra.jpeg',
                    ),
                  ),
                ),
                onTap: () {
                  print('avatar');
                },
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
                'user profile stuff here',
              ),
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
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                GridViewWidget(),
              ],
            ),
          ),
        ),
      ),
      onWillPop: onWillPop,
    );
  }
}
