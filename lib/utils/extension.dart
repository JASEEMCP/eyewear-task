import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  mq() {
    return MediaQuery.of(this).size;
  }
}
