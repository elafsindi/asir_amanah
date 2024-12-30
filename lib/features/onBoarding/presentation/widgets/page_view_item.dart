import 'package:flutter/material.dart';
import 'package:asir_amanah/core/utils/size_config.dart';
import 'package:asir_amanah/core/widgets/space_widget.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({Key? key, this.title, this.subTitle, this.image})
      : super(key: key);

  final String? title;
  final String? subTitle;
  final String? image;
  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Column(
        children: [
          const VerticalSpace(23),
          SizedBox(
              height: SizeConfig.defaultSize! * 25, child: Image.asset(image!)),
          const VerticalSpace(2.5),
          Text(
            title!,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          const VerticalSpace(1),
          Text(
            subTitle!,
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              fontSize: 15,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
