import 'package:flutter/material.dart';
import '../../widgets/page_content_details/informations_content_details.dart';

class InformationContentDesktop extends StatelessWidget {
  const InformationContentDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InformationContentDetails(),
        Expanded(
          child: Center(
            //child: CallToAction('Join Course'),
          ),
        )
      ],
    );
  }
}
