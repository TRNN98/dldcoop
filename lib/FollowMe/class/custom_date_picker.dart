import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime? currentTime, LocaleType? locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.setLeftIndex(this.currentTime.year + 543);
    this.setMiddleIndex(this.currentTime.month);
    this.setRightIndex(0);
  }

  @override
  String? leftStringAtIndex(int index) {
    if (index >= this.currentTime.year + 542 &&
        index < this.currentTime.year + 544) {
      return this.digits(index, 2);
    } else {
      return null;
    }
    // return this.digits(index, 2);
  }

  @override
  String? middleStringAtIndex(int index) {
    if (index >= 1 && index < 13) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? rightStringAtIndex(int index) {
    if (index >= 0 && index < 0) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "/";
  }

  @override
  String rightDivider() {
    return "";
  }

  @override
  List<int> layoutProportions() {
    return [1, 1, 0];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(
            // currentTime.year,
            // currentTime.month,
            // currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            1)
        : DateTime(
            // currentTime.year,
            // currentTime.month,
            // currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            1);
  }
}
