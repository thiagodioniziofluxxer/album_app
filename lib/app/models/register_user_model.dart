import 'dart:convert';

class RegisterUserModel {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  RegisterUserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });
  


  RegisterUserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? passwordConfirmation,
  }) {
    return RegisterUserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }

  factory RegisterUserModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      passwordConfirmation: map['password_confirmation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserModel.fromJson(String source) => RegisterUserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterUserModel(name: $name, email: $email, password: $password, password_confirmation: $passwordConfirmation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RegisterUserModel &&
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.passwordConfirmation == passwordConfirmation;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      passwordConfirmation.hashCode;
  }
}
