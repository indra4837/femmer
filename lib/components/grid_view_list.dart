import 'package:flutter/material.dart';

import './grid_items.dart';
import '../models/get_image_url.dart';

class GridViewWidget extends StatelessWidget {
  GridViewWidget({
    Key key,
  }) : super(key: key);

  var menPerfumeList = [
    {
      'image': 'versace_dylan_blue.png',
      'name': 'Dylan Blue',
    },
    {
      'image': 'versace_eros_flame.png',
      'name': 'Eros Flame',
    },
    {
      'image': 'versace_eros.png',
      'name': 'Eros',
    },
    {
      'image': 'versace_pour_homme.png',
      'name': 'Pour Homme',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.53,
      child: menPerfumeList.length != 0
          ? GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: menPerfumeList.length < 4 ? menPerfumeList.length : 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // mainAxisSpacing: MediaQuery.of(context).size.height * 0.005,
                crossAxisSpacing: 0,
                mainAxisExtent: MediaQuery.of(context).size.height * 0.25,
              ),
              itemBuilder: (_, index) {
                if (menPerfumeList.isNotEmpty) {
                  return GridItems(
                    imgPath: getImageURL(menPerfumeList[index]['image']),
                    name: menPerfumeList[index]['name'],
                  );
                }
                return Container();
              },
            )
          : Text("No previous data available"),
    );
  }
}
