class CarModel {
  final int id;
  final int timestampCadastro;
  final int modeloId;
  final int ano;
  final String combustivel;
  final int numPortas;
  final String cor;
  final String nomeModelo;
  final double valor;
  final bool isSaved;

  CarModel({
    required this.id,
    required this.timestampCadastro,
    required this.modeloId,
    required this.ano,
    required this.combustivel,
    required this.numPortas,
    required this.cor,
    required this.nomeModelo,
    required this.valor,
    this.isSaved = false,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      timestampCadastro: json['timestamp_cadastro'],
      modeloId: json['modelo_id'],
      ano: json['ano'],
      combustivel: json['combustivel'],
      numPortas: json['num_portas'],
      cor: json['cor'],
      nomeModelo: json['nome_modelo'],
      valor: json['valor'].toDouble(),
      isSaved: json['isSaved'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timestamp_cadastro': timestampCadastro,
      'modelo_id': modeloId,
      'ano': ano,
      'combustivel': combustivel,
      'num_portas': numPortas,
      'cor': cor,
      'nome_modelo': nomeModelo,
      'valor': valor,
      'isSaved': isSaved,
    };
  }

  CarModel copyWith({
    int? id,
    int? timestampCadastro,
    int? modeloId,
    int? ano,
    String? combustivel,
    int? numPortas,
    String? cor,
    String? nomeModelo,
    double? valor,
    bool? isSaved,
  }) {
    return CarModel(
      id: id ?? this.id,
      timestampCadastro: timestampCadastro ?? this.timestampCadastro,
      modeloId: modeloId ?? this.modeloId,
      ano: ano ?? this.ano,
      combustivel: combustivel ?? this.combustivel,
      numPortas: numPortas ?? this.numPortas,
      cor: cor ?? this.cor,
      nomeModelo: nomeModelo ?? this.nomeModelo,
      valor: valor ?? this.valor,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
