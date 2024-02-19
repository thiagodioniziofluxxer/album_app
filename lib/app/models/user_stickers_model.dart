import 'dart:convert';

class UserStickersModel {
  final int id;
  final int idUser;
  final int idSticker;
  final int duplicate;
  final String stickerCode;
  final String stickerNumber;
  UserStickersModel({
    this.id = 0,
    this.idUser = 0,
    this.idSticker = 0,
    this.duplicate = 0,
    this.stickerCode = '',
    this.stickerNumber = '',
  });

  UserStickersModel copyWith({
    int? id,
    int? idUser,
    int? idSticker,
    int? duplicate,
    String? stickerCode,
    String? stickerNumber,
  }) {
    return UserStickersModel(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      idSticker: idSticker ?? this.idSticker,
      duplicate: duplicate ?? this.duplicate,
      stickerCode: stickerCode ?? this.stickerCode,
      stickerNumber: stickerNumber ?? this.stickerNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idUser': idUser,
      'idSticker': idSticker,
      'duplicate': duplicate,
      'stickerCode': stickerCode,
      'stickerNumber': stickerNumber,
    };
  }

  factory UserStickersModel.fromMap(Map<String, dynamic> map) {
    return UserStickersModel(
      id: map['id']?.toInt() ?? 0,
      idUser: map['id_user']?.toInt() ?? 0,
      idSticker: map['id_sticker']?.toInt() ?? 0,
      duplicate: map['duplicate']?.toInt() ?? 0,
      stickerCode: map['sticker_code'] ?? '',
      stickerNumber: map['sticker_number'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserStickersModel.fromJson(String source) => UserStickersModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserStickersModel(id: $id, idUser: $idUser, idSticker: $idSticker, duplicate: $duplicate, stickerCode: $stickerCode, stickerNumber: $stickerNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserStickersModel &&
      other.id == id &&
      other.idUser == idUser &&
      other.idSticker == idSticker &&
      other.duplicate == duplicate &&
      other.stickerCode == stickerCode &&
      other.stickerNumber == stickerNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idUser.hashCode ^
      idSticker.hashCode ^
      duplicate.hashCode ^
      stickerCode.hashCode ^
      stickerNumber.hashCode;
  }
}
