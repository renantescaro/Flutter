class Funcoes{

  String parseDateTime(DateTime dataHora){

    return "${dataHora.year.toString()}-${dataHora.month.toString().padLeft(2,'0')}-${dataHora.day.toString().padLeft(2,'0')}";
  }
}