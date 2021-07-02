import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoriesWidget extends StatelessWidget {
  final Future<String> imagePath;
  final String category;

  const CategoriesWidget({
    Key key,
    this.imagePath,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.98,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        // borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          FutureBuilder(
            future: imagePath,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CachedNetworkImage(
                  imageUrl: snapshot.data,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: new CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => new Icon(
                    Icons.error,
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          Align(
            alignment: Alignment(0.95, 0.9),
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.03,
              // width: MediaQuery.of(context).size.width * 0.12,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.2,
                maxHeight: MediaQuery.of(context).size.height * 0.04,
              ),
              decoration: BoxDecoration(color: Colors.black),
              child: Center(
                child: Text(
                  this.category,
                  style: GoogleFonts.playfairDisplay(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
