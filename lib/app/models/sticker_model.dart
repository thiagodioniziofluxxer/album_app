import 'dart:convert';

class StickerModel {
  final int id;
  final String stickerCode;
  final String stickerName;
  final String stickerNumber;
  final String stickerImage;
  final String token;
  StickerModel({
    required this.id,
    required this.stickerCode,
    required this.stickerName,
    required this.stickerNumber,
    required this.stickerImage,
    required this.token,
  });

  StickerModel copyWith({
    int? id,
    String? stickerCode,
    String? stickerName,
    String? stickerNumber,
    String? stickerImage,
    String? token,
  }) {
    return StickerModel(
      id: id ?? this.id,
      stickerCode: stickerCode ?? this.stickerCode,
      stickerName: stickerName ?? this.stickerName,
      stickerNumber: stickerNumber ?? this.stickerNumber,
      stickerImage: stickerImage ?? this.stickerImage,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stickerCode': stickerCode,
      'stickerName': stickerName,
      'stickerNumber': stickerNumber,
      'stickerImage': stickerImage,
      'token': token,
    };
  }

  factory StickerModel.fromMap(Map<String, dynamic> map) {
    return StickerModel(
      id: map['id']?.toInt() ?? 0,
      stickerCode: map['sticker_code'] ?? '',
      stickerName: map['sticker_name'] ?? '',
      stickerNumber: map['sticker_number'] ?? '',
      stickerImage: map['sticker_image'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StickerModel.fromJson(String source) =>
      StickerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StickerModel(id: $id, stickerCode: $stickerCode, stickerName: $stickerName, stickerNumber: $stickerNumber, stickerImage: $stickerImage, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StickerModel &&
        other.id == id &&
        other.stickerCode == stickerCode &&
        other.stickerName == stickerName &&
        other.stickerNumber == stickerNumber &&
        other.stickerImage == stickerImage &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        stickerCode.hashCode ^
        stickerName.hashCode ^
        stickerNumber.hashCode ^
        stickerImage.hashCode ^
        token.hashCode;
  }
}
