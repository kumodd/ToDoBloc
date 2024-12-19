import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'appConstant/app_color_constant.dart';

class CustomEasyLoading {
  static void init() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorColor = AppColorConstant.green
      ..backgroundColor = AppColorConstant.white
      ..textColor = AppColorConstant.green;
  }

  static void showLoading(
    String message,
  ) {
    EasyLoading.show(status: message, maskType: EasyLoadingMaskType.black);
  }

  static void showSuccess(String message) {
    EasyLoading.showSuccess(message);
  }

  static void showError(String message) {
    EasyLoading.showError(message);
  }

  static void showWarning(String message) {
    EasyLoading.showInfo(message);
  }

  static void showToast(String message) {
    EasyLoading.showToast(message,
        duration: Duration(seconds: 3),
        toastPosition: EasyLoadingToastPosition.bottom);
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }
}
