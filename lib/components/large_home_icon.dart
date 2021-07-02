import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LargeIcon extends StatelessWidget {
  final Future<String> imagePath;

  LargeIcon(
    this.imagePath,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: imagePath,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data);
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment(0, 0),
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
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
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment(0, 0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.black.withOpacity(0.5),
                //     ),
                //   ),
                // ),
                Align(
                  alignment: Alignment(0.68, 0.3),
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                        ),
                        child: Center(
                          child: Text(
                            "This",
                            style: GoogleFonts.playfairDisplay(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.9, 0.5),
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                        ),
                        child: Center(
                          child: Text(
                            "season's",
                            style: GoogleFonts.playfairDisplay(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.78, 0.72),
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                        ),
                        child: Center(
                          child: Text(
                            "latest",
                            style: GoogleFonts.playfairDisplay(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => MatchSelectorPageWidget(
                      //       imagePath: imagePath,
                      //       location: location,
                      //       rating: rating,
                      //       courtName: courtName,
                      //     ),
                      //   ),
                      // );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold();
        }
      },
    );
  }
}
