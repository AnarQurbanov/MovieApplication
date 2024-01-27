import 'package:hive/hive.dart';

part 'results_model.g.dart';

@HiveType(typeId: 0)
class Results {
  @HiveField(0)
  String? sId;
  @HiveField(1)
  String? id;
  @HiveField(2)
  PrimaryImage? primaryImage;
  @HiveField(3)
  TitleType? titleType;
  @HiveField(4)
  TitleText? titleText;
  @HiveField(5)
  TitleText? originalTitleText;
  @HiveField(6)
  ReleaseYear? releaseYear;
  @HiveField(7)
  ReleaseDate? releaseDate;
  Results(
      {this.sId,
      this.id,
      this.primaryImage,
      this.titleType,
      this.titleText,
      this.originalTitleText,
      this.releaseYear,
      this.releaseDate});
  Results.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    primaryImage = json['primaryImage'] != null
        ? new PrimaryImage.fromJson(json['primaryImage'])
        : null;
    titleType = json['titleType'] != null
        ? new TitleType.fromJson(json['titleType'])
        : null;
    titleText = json['titleText'] != null
        ? new TitleText.fromJson(json['titleText'])
        : null;
    originalTitleText = json['originalTitleText'] != null
        ? new TitleText.fromJson(json['originalTitleText'])
        : null;
    releaseYear = json['releaseYear'] != null
        ? new ReleaseYear.fromJson(json['releaseYear'])
        : null;
    releaseDate = json['releaseDate'] != null
        ? new ReleaseDate.fromJson(json['releaseDate'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    if (this.primaryImage != null) {
      data['primaryImage'] = this.primaryImage!.toJson();
    }
    if (this.titleType != null) {
      data['titleType'] = this.titleType!.toJson();
    }
    if (this.titleText != null) {
      data['titleText'] = this.titleText!.toJson();
    }
    if (this.originalTitleText != null) {
      data['originalTitleText'] = this.originalTitleText!.toJson();
    }
    if (this.releaseYear != null) {
      data['releaseYear'] = this.releaseYear!.toJson();
    }
    if (this.releaseDate != null) {
      data['releaseDate'] = this.releaseDate!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 1)
class PrimaryImage {
  @HiveField(0)
  String? id;
  @HiveField(1)
  int? width;
  @HiveField(2)
  int? height;
  @HiveField(3)
  String? url;
  @HiveField(4)
  Caption? caption;
  @HiveField(5)
  String? sTypename;
  PrimaryImage(
      {this.id,
      this.width,
      this.height,
      this.url,
      this.caption,
      this.sTypename});
  PrimaryImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
    caption =
        json['caption'] != null ? new Caption.fromJson(json['caption']) : null;
    sTypename = json['__typename'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    if (this.caption != null) {
      data['caption'] = this.caption!.toJson();
    }
    data['__typename'] = this.sTypename;
    return data;
  }
}

@HiveType(typeId: 2)
class Caption {
  @HiveField(0)
  String? plainText;
  @HiveField(1)
  String? sTypename;
  Caption({this.plainText, this.sTypename});
  Caption.fromJson(Map<String, dynamic> json) {
    plainText = json['plainText'];
    sTypename = json['__typename'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plainText'] = this.plainText;
    data['__typename'] = this.sTypename;
    return data;
  }
}

@HiveType(typeId: 3)
class TitleType {
  @HiveField(0)
  String? text;
  @HiveField(1)
  String? id;
  @HiveField(2)
  bool? isSeries;
  @HiveField(3)
  bool? isEpisode;
  @HiveField(4)
  String? sTypename;
  TitleType(
      {this.text, this.id, this.isSeries, this.isEpisode, this.sTypename});
  TitleType.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    id = json['id'];
    isSeries = json['isSeries'];
    isEpisode = json['isEpisode'];
    sTypename = json['__typename'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['id'] = this.id;
    data['isSeries'] = this.isSeries;
    data['isEpisode'] = this.isEpisode;
    data['__typename'] = this.sTypename;
    return data;
  }
}

@HiveType(typeId: 4)
class TitleText {
  @HiveField(0)
  String? text;
  @HiveField(1)
  String? sTypename;
  TitleText({this.text, this.sTypename});
  TitleText.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    sTypename = json['__typename'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['__typename'] = this.sTypename;
    return data;
  }
}

@HiveType(typeId: 5)
class ReleaseYear {
  @HiveField(0)
  int? year;
  @HiveField(1)
  int? endYear;
  @HiveField(2)
  String? sTypename;
  ReleaseYear({this.year, this.endYear, this.sTypename});
  ReleaseYear.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    endYear = json['endYear'];
    sTypename = json['__typename'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['endYear'] = this.endYear;
    data['__typename'] = this.sTypename;
    return data;
  }
}

@HiveType(typeId: 6)
class ReleaseDate {
  @HiveField(0)
  int? day;
  @HiveField(1)
  int? month;
  @HiveField(2)
  int? year;
  @HiveField(3)
  String? sTypename;
  ReleaseDate({this.day, this.month, this.year, this.sTypename});
  ReleaseDate.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    month = json['month'];
    year = json['year'];
    sTypename = json['__typename'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['month'] = this.month;
    data['year'] = this.year;
    data['__typename'] = this.sTypename;
    return data;
  }
}
