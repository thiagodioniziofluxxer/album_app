import 'package:album_app/app/album_app.dart';
import 'package:album_app/app/core/env/env.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Env.instance.load();
  runApp(const AlbumApp());
}
