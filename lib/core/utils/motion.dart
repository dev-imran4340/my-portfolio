import 'package:flutter/widgets.dart';

abstract final class Motion {
  static Duration of(BuildContext context, Duration duration) {
    return MediaQuery.disableAnimationsOf(context) ? Duration.zero : duration;
  }

  static bool reduced(BuildContext context) {
    return MediaQuery.disableAnimationsOf(context);
  }
}
