import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  // const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delimeal'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        // children: <Widget>[],
        children: DUMMY_CATEGORIES
          .map((cateData) => CategoryItem(
            cateData.id,
            cateData.title, 
            cateData.color,
            )
          ).toList(),

        //sliver:(شظية) is a scrollable space in flutter 
        //delegate: (يفوض) 
        //main axis: (المحور الاساسي، عشان اتجاه القريد على تحت) same as height
        //cross axis: (المحور المتقاطع، عشان اتجاه القريد على تحت فدا يتقاطع مع الاتجاه) same as width
        //Extent:(مدى)
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //width
          childAspectRatio: 3 / 2, //so if width is 200 height will be 300
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,


        ),
      ),
    );
  }
}
