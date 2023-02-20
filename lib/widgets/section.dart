import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section {
  static Widget normal(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(Get.context!).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(3),
                  topRight: Radius.circular(3),
                ),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Có gì mới'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(Get.context!).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
