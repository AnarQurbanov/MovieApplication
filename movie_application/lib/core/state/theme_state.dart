import 'package:hive/hive.dart';

part "theme_state.g.dart";

@HiveType(typeId: 0)
enum AppThemes {
  @HiveField(0)
  LIGHT,
  @HiveField(1)
  DARK,
}
