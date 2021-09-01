import 'package:flutter/material.dart';

import 'package:oppknocksapp/models/models.dart';
import 'package:oppknocksapp/shared/constants.dart';

import '../../../mq.dart';
import 'discount_item.dart';

class BestSellings extends StatelessWidget {
  BestSellings({
    Key? key,
  }) : super(key: key);

  final List<MGrocery> _items = [
    MGrocery(
        name: 'Jennifer Morris Massage and Esthetics',
        description: '10% off',
        url: 'assets/images/massage.png',
        color: appColor1,
        fontSize: 1),
    MGrocery(
      name: 'Sanctuary Salon',
      description: '10% off',
      url: 'assets/images/salon.png',
      color: appColor1,
      fontSize: 0,
    ),
    MGrocery(
      name: 'The Vault',
      description: '25% off',
      url: 'assets/images/The_Vault.png',
      color: appColor1,
      fontSize: 0,
    ),
    MGrocery(
      name: 'Soccer & Lifestyle',
      description: 'BOGO Tees',
      url: 'assets/images/soccerlifestyles.jpeg',
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
