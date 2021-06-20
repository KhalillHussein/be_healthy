import 'package:flutter/cupertino.dart';

enum Steps {
  first,
  second,
  third,
  four,
}

class AppointProvider with ChangeNotifier {
  Steps currentStep = Steps.first;

  void changeStep(Steps newStep) {
    currentStep = newStep;
    notifyListeners();
  }
}
