import 'package:flutter/material.dart';
import '../../widgets/page_content_details/neuigkeiten_content_details.dart';

class NeuigkeitenContentDesktop extends StatelessWidget {
  const NeuigkeitenContentDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NeuigkeitenContentDetails(),
        Expanded(
          child: Center(
            //child: CallToAction('Join Course'),
          ),
        )
      ],
    );
  }
}
