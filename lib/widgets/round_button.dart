import 'package:flutter/material.dart';
import 'package:oppknocksapp/shared/constants.dart';

class RoundButton extends StatelessWidget {
  final String? title;
  final Function? onTap;
  const RoundButton({
    Key? key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()? ?? () {},
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title!,
          style: kTitleStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
