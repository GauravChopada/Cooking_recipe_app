import 'package:flutter/material.dart';

import '../Widgets/Catagary_item.dart';
import '../Models/dummy_list.dart';

class CategariesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView(
        padding: EdgeInsets.all(10),
        children: DummyList.map((Catagary) => CatagaryItem(
                Catagary.title, Catagary.rang, Catagary.id, Catagary.imageUrl))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
