import 'package:flutter/material.dart';

import 'package:oppknocksapp/models/models.dart';
import 'package:oppknocksapp/screens/details_screen/item_details_screen.dart';
import 'package:oppknocksapp/shared/constants.dart';

import '../../../mq.dart';

class DiscountItem extends StatelessWidget {
  final MGrocery? item;
  const DiscountItem({
    Key? key,
    this.item,
  }) : super(key: key);

  void onTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => ItemDetailsSreen(item: item)));
  }

  fontSizeChoice(fontSize) {
    switch (fontSize) {
      case 1:
        return Text(item!.name!, style: productTitleStyleSmall1);

      case 2:
        return Text(item!.name!, style: productTitleStyleSmall2);

      default:
        return Text(item!.name!, style: productTitleStyle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        width: MQuery.width * 0.4,
        decoration: BoxDecoration(
          color: item!.color,
          border: Border.all(color: kBorderColor, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: item.hashCode,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        item!.url!,
                        height: constraints.maxHeight * 0.6,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                fontSizeChoice(item!.fontSize!),
                SizedBox(height: 2),
                Text(item!.description!, style: productDescriptionStyle),
                Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
