import 'package:flutter/material.dart';

class ViewProvider with ChangeNotifier {
  bool fullScreen = true;

  fullScreenFunction() {
    fullScreen = !fullScreen;
    notifyListeners();
  }
}
