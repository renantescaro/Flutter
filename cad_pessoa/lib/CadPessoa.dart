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

    pessoa.Nome = tfNome.text;
    pessoa.DtNascimento = tfDtNascimento.text;
    pessoa.Rg = tfRg.text;
    pessoa.Cpf = tfCpf.text;

    pessoaDao.insert(pessoa);

    tfNome.clear();
    tfDtNascimento.clear();
    tfRg.clear();
    tfCpf.clear();

    Funcoes.showAlertDialog(context,"Pessoa inserida!","Alerta");
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
