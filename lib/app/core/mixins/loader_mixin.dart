import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loading) {
    ever(loading, (_) {
      if (loading.isTrue) {
        Get.dialog(
          WillPopScope(
            onWillPop: () async => false,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white
                ),
                child: const CircularProgressIndicator()
              ),
            ),
          ),
          barrierDismissible: false
        );
      } else {
        Get.close(1);
      }
    });
  }
}