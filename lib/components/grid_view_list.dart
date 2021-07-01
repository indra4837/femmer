import 'package:flutter/material.dart';

import './grid_items.dart';

class GridViewWidget extends StatelessWidget {
  GridViewWidget({
    Key key,
  }) : super(key: key);

  var menPerfumeList = [
    {
      'image': 'assets/images/men/versace_dylan_blue.png',
      'name': 'Dylan Blue',
    },
    {
      'image': 'assets/images/men/versace_eros_flame.png',
      'name': 'Eros Flame',
    },
    {
      'image': 'assets/images/men/versace_eros.png',
      'name': 'Eros',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: menPerfumeList.length != 0
          ? GridView.builder(
              itemCount: menPerfumeList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // mainAxisSpacing: MediaQuery.of(context).size.height * 0.005,
                crossAxisSpacing: 0,
              ),
              itemBuilder: (_, index) {
                if (menPerfumeList.isNotEmpty) {
                  return GridItems(
                    imgPath: menPerfumeList[index]['image'],
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
