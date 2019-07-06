
class Pessoa{

  int id;
  String nome;
  String dtNascimento;
  String rg;
  String cpf;

  set Id(int id) => this.id = id;
  int get Id => this.id;

  set Nome(String nome) => this.nome = nome;
  String get Nome => this.nome;

  set DtNascimento(String dtNascimento) => this.dtNascimento = dtNascimento;
  String get DtNascimento => this.dtNascimento;
  
  set Rg(String rg) => this.rg = rg;
  String get Rg => this.rg;

  set Cpf(String cpf) => this.cpf = cpf;
  String get Cpf => this.cpf;

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'nome':nome,
      'dtNascimento':dtNascimento,
      'rg': rg,
      'cpf':cpf,
    };
  }

  Pessoa.map(dynamic obj) {
    this.id = obj['id'];
    this.nome = obj['nome'];
    this.dtNascimento = obj['dtNascimento'];
    this.rg = obj['rg'];
    this.cpf = obj['cpf'];
  }

  Pessoa({this.id, this.nome, this.dtNascimento, this.rg, this.cpf});
}