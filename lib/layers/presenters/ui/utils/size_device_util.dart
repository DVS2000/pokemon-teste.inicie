import 'package:flutter/cupertino.dart';

extension SizedDevice on BuildContext {
  Size get sizedDevice => MediaQuery.of(this).size;
}