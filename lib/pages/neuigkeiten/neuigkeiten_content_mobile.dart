import 'package:flutter/material.dart';
import '../../widgets/page_content_details/neuigkeiten_content_details.dart';


class NeuigkeitenContentMobile extends StatelessWidget {
  const NeuigkeitenContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        NeuigkeitenContentDetails(),
        SizedBox(
          height: 100,
        ),
        //CallToAction('Join Course'),
      ],
    );
  }
}
