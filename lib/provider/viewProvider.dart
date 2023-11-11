import 'package:flutter/material.dart';

class ViewProvider with ChangeNotifier {
  bool fullScreen = true;
  bool fullCaption = false;

  fullScreenFunction() {
    fullScreen = !fullScreen;
    notifyListeners();
  }
   fullHeightCaption() {
    fullCaption = !fullCaption;
    notifyListeners();
  }
}
