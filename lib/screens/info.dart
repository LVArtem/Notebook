import 'package:rflutter_alert/rflutter_alert.dart';

class Info {
  void onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "Hello",
      desc:
          "This application is made as part of the Flutter Development Bootcamp with Dart training course. Author: Artem L.",
    ).show();
  }
}
