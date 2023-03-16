import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterModel {
 final String name;
 final String email;
 final String phone;
 final String age;
 final String password;
 final String passwordConfirmation;
 final bool tc;

  RegisterModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.age,
    required this.password,
    required this.passwordConfirmation,
    required this.tc
  });

  



  RegisterModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? age,
    String? password,
    String? passwordConfirmation,
    dynamic? tc,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      age: age ?? this.age,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      tc: tc ?? this.tc,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'age': age,
      'password': password,
      'passwordConfirmation': passwordConfirmation,
      'tc': tc,
    };
  }

  factory RegisterModel.fromMap(Map<dynamic, dynamic> map) {
    return RegisterModel(
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      age: map['age'] as String,
      password: map['password'] as String,
      passwordConfirmation: map['passwordConfirmation'] as String,
      tc: map['tc'] as dynamic,
    );
  }


  }






