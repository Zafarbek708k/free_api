import "dart:developer";

import "package:flutter/material.dart";
import "package:free_api/src/core/storage/app_storage.dart";


class EntryViewModel extends ChangeNotifier {
  PageController pageController = PageController();
  int currentPage = 0;
  List<String> images = ["assets/images/onboarding1.png","assets/images/onboarding2.png","assets/images/onboarding1.png" ];

  void onPageChanged(int index) {
    currentPage = index;
    log(currentPage.toString());
    if(currentPage == 2){
      AppStorage.$write(key: StorageKey.enter, value: "Enter user");
    }
    notifyListeners();
  }


}




