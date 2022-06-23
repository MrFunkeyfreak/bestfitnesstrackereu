import 'package:bestfitnesstrackereu/provider/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../widgets/page_content_details/informations_content_details.dart';

class InformationContentDesktop extends StatelessWidget {
  const InformationContentDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //AuthProvider authProvider = AuthProvider();
    //var mapUserinformations = authProvider.getUserByEmail('tester@web.de');
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
