import 'dart:convert';


class RegisterStickerModel {
  final String stickerName;
  final String stickerCode;
  final String stickerNumber;
  RegisterStickerModel({
    this.stickerName = '',
    this.stickerCode = '',
    this.stickerNumber = '',
  });
  

  RegisterStickerModel copyWith({
    String? stickerName,
    String? stickerCode,
    String? stickerNumber,
  }) {
    return RegisterStickerModel(
      stickerName: stickerName ?? this.stickerName,
      stickerCode: stickerCode ?? this.stickerCode,
      stickerNumber: stickerNumber ?? this.stickerNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sticker_name': stickerName,
      'sticker_code': stickerCode,
      'sticker_number': stickerNumber,
    };
  }

  factory RegisterStickerModel.fromMap(Map<String, dynamic> map) {
    return RegisterStickerModel(
      stickerName: map['sticker_name'] ?? '',
      stickerCode: map['sticker_code'] ?? '',
      stickerNumber: map['sticker_number'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterStickerModel.fromJson(String source) => RegisterStickerModel.fromMap(json.decode(source));

  @override
  String toString() => 'RegisterStickerModel(stickerName: $stickerName, stickerCode: $stickerCode, stickerNumber: $stickerNumber)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RegisterStickerModel &&
      other.stickerName == stickerName &&
      other.stickerCode == stickerCode &&
      other.stickerNumber == stickerNumber;
  }

  @override
  int get hashCode => stickerName.hashCode ^ stickerCode.hashCode ^ stickerNumber.hashCode;
}
