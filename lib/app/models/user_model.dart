import 'dart:convert';

class UserModel {
  final int id;
  final String name;
  final String email;
  final int totalAlbum;
  final int todalStickers;
  final int totalDuplicates;
  final int totalComplete;
  final int totalCompletePercent;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.totalAlbum,
    required this.todalStickers,
    required this.totalDuplicates,
    required this.totalComplete,
    required this.totalCompletePercent,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    int? totalAlbum,
    int? todalStickers,
    int? totalDuplicates,
    int? totalComplete,
    int? totalCompletePercent,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      totalAlbum: totalAlbum ?? this.totalAlbum,
      todalStickers: todalStickers ?? this.todalStickers,
      totalDuplicates: totalDuplicates ?? this.totalDuplicates,
      totalComplete: totalComplete ?? this.totalComplete,
      totalCompletePercent: totalCompletePercent ?? this.totalCompletePercent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'totalAlbum': totalAlbum,
      'todalStickers': todalStickers,
      'totalDuplicates': totalDuplicates,
      'totalComplete': totalComplete,
      'totalCompletePercent': totalCompletePercent,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      totalAlbum: map['total_album']?.toInt() ?? 0,
      todalStickers: map['todal_stickers']?.toInt() ?? 0,
      totalDuplicates: map['total_duplicates']?.toInt() ?? 0,
      totalComplete: map['total_complete']?.toInt() ?? 0,
      totalCompletePercent: map['total_complete_percent']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, totalAlbum: $totalAlbum, todalStickers: $todalStickers, totalDuplicates: $totalDuplicates, totalComplete: $totalComplete, totalCompletePercent: $totalCompletePercent)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.totalAlbum == totalAlbum &&
        other.todalStickers == todalStickers &&
        other.totalDuplicates == totalDuplicates &&
        other.totalComplete == totalComplete &&
        other.totalCompletePercent == totalCompletePercent;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        totalAlbum.hashCode ^
        todalStickers.hashCode ^
        totalDuplicates.hashCode ^
        totalComplete.hashCode ^
        totalCompletePercent.hashCode;
  }
}
