import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:album_app/app/models/user_stickers_model.dart';

class GroupsStickersModel {
  int id;
  String countryCode;
  String countryName;
  String createdAt;
  String updatedAt;
  int index;
  int stickersStart;
  int stickersEnd;
  List<UserStickersModel> stickers;

  String flag;
  GroupsStickersModel({
    required this.id,
    required this.countryCode,
    required this.countryName,
    required this.createdAt,
    required this.updatedAt,
    required this.index,
    required this.stickersStart,
    required this.stickersEnd,
    required this.stickers,
    required this.flag,
  });

  GroupsStickersModel copyWith({
    int? id,
    String? countryCode,
    String? countryName,
    String? createdAt,
    String? updatedAt,
    int? index,
    int? stickersStart,
    int? stickersEnd,
    ValueGetter<List<UserStickersModel>?>? stickers,
    String? flag,
  }) {
    return GroupsStickersModel(
      id: id ?? this.id,
      countryCode: countryCode ?? this.countryCode,
      countryName: countryName ?? this.countryName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      index: index ?? this.index,
      stickersStart: stickersStart ?? this.stickersStart,
      stickersEnd: stickersEnd ?? this.stickersEnd,
      stickers: this.stickers,
      flag: flag ?? this.flag,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'countryCode': countryCode,
      'countryName': countryName,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'index': index,
      'stickersStart': stickersStart,
      'stickersEnd': stickersEnd,
      'stickers': stickers.map((x) => x.toMap()).toList(),
      'flag': flag,
    };
  }

  factory GroupsStickersModel.fromMap(Map<String, dynamic> map) {
    return GroupsStickersModel(
      id: map['id']?.toInt() ?? 0,
      countryCode: map['country_code'] ?? '',
      countryName: map['country_name'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      index: map['index']?.toInt() ?? 0,
      stickersStart: map['stickers_start']?.toInt() ?? 0,
      stickersEnd: map['stickers_end']?.toInt() ?? 0,
      stickers: List<UserStickersModel>.from(
          map['stickers']?.map((x) => UserStickersModel.fromMap(x))),
      flag: map['flag'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupsStickersModel.fromJson(String source) =>
      GroupsStickersModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GroupsStickersModel(id: $id, countryCode: $countryCode, countryName: $countryName, createdAt: $createdAt, updatedAt: $updatedAt, index: $index, stickersStart: $stickersStart, stickersEnd: $stickersEnd, stickers: $stickers, flag: $flag)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GroupsStickersModel &&
        other.id == id &&
        other.countryCode == countryCode &&
        other.countryName == countryName &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.index == index &&
        other.stickersStart == stickersStart &&
        other.stickersEnd == stickersEnd &&
        listEquals(other.stickers, stickers) &&
        other.flag == flag;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        countryCode.hashCode ^
        countryName.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        index.hashCode ^
        stickersStart.hashCode ^
        stickersEnd.hashCode ^
        stickers.hashCode ^
        flag.hashCode;
  }
}
