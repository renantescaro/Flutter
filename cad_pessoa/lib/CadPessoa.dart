import 'package:cad_pessoa/Funcoes.dart';
import 'package:cad_pessoa/Pessoa.dart';
import 'package:cad_pessoa/PessoaDao.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CadPessoa extends StatefulWidget {
  @override

  String selecionada;

  CadPessoa(String selecionada){
    this.selecionada = selecionada;
  }

  PagePessoa createState() {
    return new PagePessoa(selecionada);
  }
}

class PagePessoa extends State<CadPessoa>{

  var tfId = new TextEditingController();
  var tfNome = new TextEditingController();
  var tfDtNascimento = new TextEditingController();
  var tfRg = new TextEditingController();
  var tfCpf = new TextEditingController();

  String selecionada;
  PessoaDao pessoaDao = new PessoaDao();

  PagePessoa(String selecionada){
    this.selecionada = selecionada;

    main();
  }

  void main() async{
    if(selecionada != ""){
      
      int id = 0;
      int corte = selecionada.indexOf('--');
      selecionada = selecionada.substring(0, corte);

      id = int.tryParse(selecionada);

      Pessoa pe = await pessoaDao.select(id);

      if(pe != null){
        tfId.text = pe.Id.toString();
        tfNome.text = pe.Nome;
        tfDtNascimento.text = pe.DtNascimento;
        tfRg.text = pe.Rg;
        tfCpf.text = pe.Cpf;
      }
    }
  }

  void adicionar(BuildContext context) {

    Pessoa pessoa = new Pessoa();
    PessoaDao pessoaDao = new PessoaDao();

    pessoa.Id = int.tryParse(tfId.text);
    pessoa.Nome = tfNome.text;
    pessoa.DtNascimento = tfDtNascimento.text;
    pessoa.Rg = tfRg.text;
    pessoa.Cpf = tfCpf.text;

    pessoaDao.save(pessoa);

    if(tfId.text != ""){
      Funcoes.mensagem(context,"Pessoa alterada!","Alerta");
    }else{
      Funcoes.mensagem(context,"Pessoa inserida!","Alerta");

      tfId.clear();
      tfNome.clear();
      tfDtNascimento.clear();
      tfRg.clear();
      tfCpf.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cad Pessoa"),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.only(left: 16, right: 16, top:20),
          children: <Widget>[
            TextField(
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Código',
              ),
              controller: tfId,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
              controller: tfNome,
            ),
            DateTimePickerFormField(
              controller: tfDtNascimento,
              inputType: InputType.date,
              keyboardType: TextInputType.datetime,
              format: DateFormat("dd/MM/yyyy"),
              initialDate: DateTime(2019, 1, 1),
              editable: true,
              decoration: InputDecoration(
                  labelText: 'Nascimento',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'RG',
              ),
              controller: tfRg,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'CPF',
              ),
              controller: tfCpf,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>adicionar(context),
        tooltip: 'Adicionar',
        child: Icon(Icons.save),
      ), 
    );
  }
}
