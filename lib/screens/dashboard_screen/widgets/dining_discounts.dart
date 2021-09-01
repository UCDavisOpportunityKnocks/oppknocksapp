import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:oppknocksapp/models/models.dart';
import 'package:oppknocksapp/shared/constants.dart';

import '../../../mq.dart';
import 'discount_item.dart';

class DiningDiscounts extends StatelessWidget {
  DiningDiscounts({
    Key? key,
  }) : super(key: key);

  final List<MGrocery> _items = [
    MGrocery(
      name: 'Ali Baba Cafe',
      url: 'assets/images/Ali_Baba.png',
      description: 'Breakfast Burrito',
      color: appColor1,
      fontSize: 0,
    ),
    MGrocery(
      name: 'Davis Creamery',
      url: 'assets/images/Davis_Creamery.png',
      description: '2 pint (pick 2 flavors)',
      color: appColor1,
      fontSize: 0,
    ),
    MGrocery(
      name: '4:3 Image Test',
      url: 'assets/images/best_ratio_4_3.jpg',
      description: 'Testing which ratio is best',
      color: appColor1,
      fontSize: 0,
    ),
    MGrocery(
      name: '16:9 Image Test',
      url: 'assets/images/best_ratio_16_9.jpg',
      description: 'Testing which ratio is best',
      color: appColor1,
      fontSize: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MQuery.height * 0.25,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: _items.length,
        itemBuilder: (_, i) => DiscountItem(item: _items[i]),
        separatorBuilder: (_, __) => SizedBox(width: 10),
      ),
    );
  }
}
