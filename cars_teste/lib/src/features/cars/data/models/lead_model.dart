import 'package:cars_teste/src/config/imports.dart';

class Lead {
  int id;
  String nome;
  String telefone;
  String email;
  CarModel carro;

  Lead({
    required this.id,
    required this.nome,
    required this.telefone,
    required this.email,
    required this.carro,
  });

  factory Lead.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> car = jsonDecode(json['carro']);
    return Lead(
      id: json['id'],
      nome: json['nome'] ?? '',
      telefone: json['telefone'] ?? '',
      email: json['email'] ?? '',
      carro: CarModel.fromJson(car),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'carro': carro.toJson(),
    };
  }
}
