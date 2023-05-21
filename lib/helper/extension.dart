import 'package:flutter/material.dart';

extension BearerToken on String {
  String changeAmToPm() {
    String timeAmPm = this;
    print("pickUpTIme==>${timeAmPm}");

    int hour = int.parse(timeAmPm.split(":").first.trim());
    int minute =
    int.parse(timeAmPm.split(":").last.trim().split(" ").first.trim());

    if (hour > 12) {
      hour -= 12;

      timeAmPm = hour.toString().padLeft(2, '0') +
          ":" +
          minute.toString().padLeft(2, '0') +
          " PM";
    } else {
      timeAmPm = timeAmPm + " AM";
    }
    return timeAmPm;
  }
}
