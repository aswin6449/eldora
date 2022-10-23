import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/managedata.dart';

class Calculations with ChangeNotifier {
  // final QueryDocumentSnapshot queryDocumentSnapshot;
  // Calculations({required this.queryDocumentSnapshot});

  addtoUserData(BuildContext context, dynamic data) async {
    await Provider.of<ManageData>(context, listen: false)
        .submitUserData(context, data);
    notifyListeners();
  }

}
