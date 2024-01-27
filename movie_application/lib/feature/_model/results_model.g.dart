// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultsAdapter extends TypeAdapter<Results> {
  @override
  final int typeId = 0;

  @override
  Results read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Results(
      sId: fields[0] as String?,
      id: fields[1] as String?,
      primaryImage: fields[2] as PrimaryImage?,
      titleType: fields[3] as TitleType?,
      titleText: fields[4] as TitleText?,
      originalTitleText: fields[5] as TitleText?,
      releaseYear: fields[6] as ReleaseYear?,
      releaseDate: fields[7] as ReleaseDate?,
    );
  }

  @override
  void write(BinaryWriter writer, Results obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.sId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.primaryImage)
      ..writeByte(3)
      ..write(obj.titleType)
      ..writeByte(4)
      ..write(obj.titleText)
      ..writeByte(5)
      ..write(obj.originalTitleText)
      ..writeByte(6)
      ..write(obj.releaseYear)
      ..writeByte(7)
      ..write(obj.releaseDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PrimaryImageAdapter extends TypeAdapter<PrimaryImage> {
  @override
  final int typeId = 1;

  @override
  PrimaryImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrimaryImage(
      id: fields[0] as String?,
      width: fields[1] as int?,
      height: fields[2] as int?,
      url: fields[3] as String?,
      caption: fields[4] as Caption?,
      sTypename: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PrimaryImage obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.width)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.caption)
      ..writeByte(5)
      ..write(obj.sTypename);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrimaryImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CaptionAdapter extends TypeAdapter<Caption> {
  @override
  final int typeId = 2;

  @override
  Caption read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Caption(
      plainText: fields[0] as String?,
      sTypename: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Caption obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.plainText)
      ..writeByte(1)
      ..write(obj.sTypename);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CaptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TitleTypeAdapter extends TypeAdapter<TitleType> {
  @override
  final int typeId = 3;

  @override
  TitleType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TitleType(
      text: fields[0] as String?,
      id: fields[1] as String?,
      isSeries: fields[2] as bool?,
      isEpisode: fields[3] as bool?,
      sTypename: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TitleType obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.isSeries)
      ..writeByte(3)
      ..write(obj.isEpisode)
      ..writeByte(4)
      ..write(obj.sTypename);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TitleTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TitleTextAdapter extends TypeAdapter<TitleText> {
  @override
  final int typeId = 4;

  @override
  TitleText read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TitleText(
      text: fields[0] as String?,
      sTypename: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TitleText obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.sTypename);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TitleTextAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReleaseYearAdapter extends TypeAdapter<ReleaseYear> {
  @override
  final int typeId = 5;

  @override
  ReleaseYear read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReleaseYear(
      year: fields[0] as int?,
      endYear: fields[1] as int?,
      sTypename: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ReleaseYear obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.year)
      ..writeByte(1)
      ..write(obj.endYear)
      ..writeByte(2)
      ..write(obj.sTypename);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReleaseYearAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReleaseDateAdapter extends TypeAdapter<ReleaseDate> {
  @override
  final int typeId = 6;

  @override
  ReleaseDate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReleaseDate(
      day: fields[0] as int?,
      month: fields[1] as int?,
      year: fields[2] as int?,
      sTypename: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ReleaseDate obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.month)
      ..writeByte(2)
      ..write(obj.year)
      ..writeByte(3)
      ..write(obj.sTypename);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReleaseDateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
