import 'dart:io';

import 'package:flutter/services.dart';

Future<String> routineFixture(String name) async => await rootBundle.loadString(name);
