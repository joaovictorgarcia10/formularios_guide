import 'package:flutter/material.dart';

@immutable
class UserModel {
  final String saldo;
  final String nome;
  final String cpf;
  final String email;
  final String password;

  const UserModel({
    this.saldo = "",
    this.nome = "",
    this.cpf = "",
    this.email = "",
    this.password = "",
  });

  // Prototype Pattern
  UserModel copyWith({
    String? saldo,
    String? nome,
    String? cpf,
    String? email,
    String? password,
  }) {
    return UserModel(
      saldo: saldo ?? this.saldo,
      nome: nome ?? this.nome,
      cpf: cpf ?? this.cpf,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
