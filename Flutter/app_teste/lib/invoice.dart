import 'dart:convert';

class InvoiceModel {
  String periodo;
  String nome;
  String cpf;
  String ug;
  String uc;
  String valor;
  String energia;
  String indicador;

  InvoiceModel({
    required this.periodo,
    required this.nome,
    required this.cpf,
    required this.ug,
    required this.uc,
    required this.valor,
    required this.energia,
    required this.indicador,
  });

  InvoiceModel copyWith({
    String? periodo,
    String? nome,
    String? cpf,
    String? ug,
    String? uc,
    String? valor,
    String? energia,
    String? indicador,
  }) {
    return InvoiceModel(
      periodo: periodo ?? this.periodo,
      nome: nome ?? this.nome,
      cpf: cpf ?? this.cpf,
      ug: ug ?? this.ug,
      uc: uc ?? this.uc,
      valor: valor ?? this.valor,
      energia: energia ?? this.energia,
      indicador: indicador ?? this.indicador,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'periodo': periodo,
      'nome': nome,
      'cpf': cpf,
      'ug': ug,
      'uc': uc,
      'valor': valor,
      'energia': energia,
      'indicador': indicador,
    };
  }

  factory InvoiceModel.fromMap(Map<String, dynamic> map) {
    return InvoiceModel(
      periodo: map['periodo'] ?? '',
      nome: map['nome'] ?? '',
      cpf: map['cpf'] ?? '',
      ug: map['ug'] ?? '',
      uc: map['uc'] ?? '',
      valor: map['valor'] ?? '',
      energia: map['energia'] ?? '',
      indicador: map['indicador'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceModel.fromJson(String source) =>
      InvoiceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InvoiceModel(periodo: $periodo, nome: $nome, cpf: $cpf, ug: $ug, uc: $uc, valor: $valor, energia: $energia, indicador: $indicador)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InvoiceModel &&
        other.periodo == periodo &&
        other.nome == nome &&
        other.cpf == cpf &&
        other.ug == ug &&
        other.uc == uc &&
        other.valor == valor &&
        other.energia == energia &&
        other.indicador == indicador;
  }

  @override
  int get hashCode {
    return periodo.hashCode ^
        nome.hashCode ^
        cpf.hashCode ^
        ug.hashCode ^
        uc.hashCode ^
        valor.hashCode ^
        energia.hashCode ^
        indicador.hashCode;
  }
}
