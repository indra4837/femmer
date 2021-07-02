import 'package:femmer/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GridItems extends StatefulWidget {
  final Future<String> imgPath;
  final String name;

  GridItems({
    Key key,
    this.imgPath,
    this.name,
  }) : super(key: key);

  @override
  _GridItemsState createState() => _GridItemsState();
}

class _GridItemsState extends State<GridItems> {
  var liked = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.imgPath,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 4, 5, 2),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.grey[200],
                ),
                // borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment(0.9, -0.9),
                        child: liked
                            ? Icon(
                                FontAwesomeIcons.solidHeart,
                                size: 20,
                              )
                            : Icon(
                                FontAwesomeIcons.heart,
                                size: 20,
                              ),
                      ),
                      Align(
                        child: GestureDetector(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            color: Colors.transparent,
                          ),
                          onTap: () {
                            setState(
                              () {
                                liked = !liked;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment(0, -0.5),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      child: CachedNetworkImage(
                        imageUrl: snapshot.data,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Center(
                          child: new CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => new Icon(
                          Icons.error,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.6),
                    child: Text(
                      widget.name,
                      style: GoogleFonts.playfairDisplay(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 1.1),
                    child: TextButton(
                      child: Text(
                        'Shop Now',
                        style: GoogleFonts.workSans(
                          textStyle: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.double,
                          ),
                        ),
                      ),
                      onPressed: () {
                        // print('Shop Now');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold();
        }
      },
    );
  }
}
