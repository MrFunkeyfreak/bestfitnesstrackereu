import 'package:flutter/material.dart';
import '../../widgets/page_content_details/informations_content_details.dart';


class InformationContentMobile extends StatelessWidget {
  const InformationContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InformationContentDetails(),
        SizedBox(
          height: 100,
        ),
        //CallToAction('Join Course'),
      ],
    );
  }
}
