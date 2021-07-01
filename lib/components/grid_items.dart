import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GridItems extends StatelessWidget {
  final String imgPath;
  final String name;

  const GridItems({
    Key key,
    this.imgPath,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 4, 5, 2),
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(
            color: Colors.grey[200],
          ),
          // borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(1, -1),
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.heart,
                  size: 20,
                ),
                onPressed: () {
                  print('liked');
                },
              ),
            ),
            Align(
              alignment: Alignment(0, -0.5),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.6),
              child: Text(
                name,
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
                  print('Shop Now');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
