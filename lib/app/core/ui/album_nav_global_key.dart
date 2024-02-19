
import 'package:flutter/material.dart';

class AlbumNavGlobalKey {
  static AlbumNavGlobalKey ? _instance;
  final navigatorKey = GlobalKey<NavigatorState>();
  // Avoid self instance
  AlbumNavGlobalKey ._();
  static AlbumNavGlobalKey  get instance =>
      _instance ??= AlbumNavGlobalKey ._();
}