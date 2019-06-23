class Pessoa{
  int id;
  String nome;
  String sobrenome;
  int idade;

  set Id(int id) => this.id = id;
  int get Id => this.id;

  set Nome(String nome) => this.nome = nome;
  String get Nome => this.nome;

  set Sobrenome(String sobrenome) => this.sobrenome = sobrenome;
  String get Sobrenome => this.sobrenome;

  set Idade(int idade) => this.idade = idade;
  int get Idade => this.idade;

  Pessoa({this.id, this.nome, this.sobrenome, this.idade});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'sobrenome': sobrenome,
      'idade': idade,
    };
  }
}