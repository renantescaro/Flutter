import '../Funcoes.dart';

class Vaca{
  int id;
  String nome;
  int numeroBrinco;
  DateTime dtNascimentoAquisicao;
  DateTime dtCio;

  int get Id => this.id;
  set Id(int id) => this.id = id;

  String get Nome => this.nome;
  set Nome(String nome) => this.nome = nome;

  int get NumeroBrinco => this.numeroBrinco;
  set NumeroBrinco(int numeroBrinco) => this.numeroBrinco = numeroBrinco;

  DateTime get DtNascimentoAquisicao => this.dtNascimentoAquisicao;
  set DtNascimentoAquisicao(DateTime dtNascimentoAquisicao) => this.dtNascimentoAquisicao = dtNascimentoAquisicao;

  DateTime get DtCio => this.dtCio;
  set DtCio(DateTime dtCio) => this.dtCio = dtCio;

  Vaca({this.id, this.nome, this.numeroBrinco, this.dtNascimentoAquisicao, this.dtCio});

  Funcoes f = new Funcoes();

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'nome':nome,
      'numeroBrinco':numeroBrinco,
      'dtNascimentoAquisicao': f.parseDateTime(dtNascimentoAquisicao),
      'dtCio':f.parseDateTime(dtCio),
    };
  }

  Vaca.map(dynamic obj) {
    this.id = obj['id'];
    this.nome = obj['nome'];
    this.numeroBrinco = obj['numeroBrinco'];
  } 
}