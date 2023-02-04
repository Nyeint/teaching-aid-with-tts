import 'package:flutter/widgets.dart';
import 'package:putu/ui/alphabets.dart';
import 'package:putu/ui/colors.dart';

class Routes {
  Routes._();

  static const String colors='/colors';
  static const String alphabets='/alphabets';

  static final routes = <String, WidgetBuilder>{
    colors: (BuildContext context) => ColorsPage(),
    alphabets: (BuildContext context) => Alphabets(),
  };
}