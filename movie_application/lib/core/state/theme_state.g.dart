// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppThemesAdapter extends TypeAdapter<AppThemes> {
  @override
  final int typeId = 0;

  @override
  AppThemes read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AppThemes.LIGHT;
      case 1:
        return AppThemes.DARK;
      default:
        return AppThemes.LIGHT;
    }
  }

  @override
  void write(BinaryWriter writer, AppThemes obj) {
    switch (obj) {
      case AppThemes.LIGHT:
        writer.writeByte(0);
        break;
      case AppThemes.DARK:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppThemesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
