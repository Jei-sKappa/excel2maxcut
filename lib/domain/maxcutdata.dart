typedef MaxCutData = String;
typedef MaxCutObject = Map<MaxCutDataType, MaxCutData>;

/// MaxCutFields
/// DO NOT REORDER, IT MATTERS
enum MaxCutDataType {
  tipo, // 0
  nome, // 1
  lunghezza, // 2
  larghezza, // 3
  quantita, // 4
  note, // 5
  puoRuotare, // 6
  materiale, // 7
  bordaturaLunghezza1, // 8
  bordaturaLunghezza2, // 9
  larghezzaBordo1, // 10
  bordaturaLarghezza2, // 11
  includiSpessoreBordatura, // 12
  nota1, // 13
  nota2, // 14
  nota3, // 15
  nota4, // 16
  raggruppa, // 17
  tagReport, // 18
  importId, // 19
  idPadre, // 20
  nomeOggettoLibreria, // 21
  lunghezzaFori1, // 22
  lunghezzaFori2, // 23
  larghezzaFori1, // 24
  larghezzaFori2, // 25
  lunghezzaScanalatura1, // 26
  lunghezzaScanalatura2, // 27
  larghezzaScanalatura1, // 28
  larghezzaScanalatura2, // 29
  selezionaIMaterialiDaSostituire, // 30
  edgingLength1Tag, // 31
  edgingLength2Tag, // 32
  edgingWidth1Tag, // 33
  edgingWidth2Tag, // 34
  applyMachiningCharge, // 35
  longExpansion, // 36
  shortExpansion, // 37
}

extension MaxCutDataTypeExtension on MaxCutDataType {
  String get fieldName {
    switch (this) {
      case MaxCutDataType.tipo:
        return "Tipo";
      case MaxCutDataType.nome:
        return "Nome";
      case MaxCutDataType.lunghezza:
        return "Lunghezza";
      case MaxCutDataType.larghezza:
        return "Larghezza";
      case MaxCutDataType.quantita:
        return "Quantita";
      case MaxCutDataType.note:
        return "Note";
      case MaxCutDataType.puoRuotare:
        return "Può ruotare (0 = N. / 1 = Sì / 2 = Uguale al materiale)";
      case MaxCutDataType.materiale:
        return "Materiale";
      case MaxCutDataType.bordaturaLunghezza1:
        return "Bordatura lunghezza 1";
      case MaxCutDataType.bordaturaLunghezza2:
        return "Bordatura lunghezza 2";
      case MaxCutDataType.larghezzaBordo1:
        return "Larghezza bordo 1";
      case MaxCutDataType.bordaturaLarghezza2:
        return "Bordatura larghezza 2";
      case MaxCutDataType.includiSpessoreBordatura:
        return "Includi spessore bordatura";
      case MaxCutDataType.nota1:
        return "Nota 1";
      case MaxCutDataType.nota2:
        return "Nota 2";
      case MaxCutDataType.nota3:
        return "Nota 3";
      case MaxCutDataType.nota4:
        return "Nota 4";
      case MaxCutDataType.raggruppa:
        return "Raggruppa";
      case MaxCutDataType.tagReport:
        return "Tag report";
      case MaxCutDataType.importId:
        return "Import ID";
      case MaxCutDataType.idPadre:
        return "ID padre";
      case MaxCutDataType.nomeOggettoLibreria:
        return "Nome oggetto libreria";
      case MaxCutDataType.lunghezzaFori1:
        return "Lunghezza fori 1";
      case MaxCutDataType.lunghezzaFori2:
        return "Lunghezza fori 2";
      case MaxCutDataType.larghezzaFori1:
        return "Larghezza fori 1";
      case MaxCutDataType.larghezzaFori2:
        return "Larghezza fori 2";
      case MaxCutDataType.lunghezzaScanalatura1:
        return "Lunghezza scanalatura 1";
      case MaxCutDataType.lunghezzaScanalatura2:
        return "Lunghezza scanalatura 2";
      case MaxCutDataType.larghezzaScanalatura1:
        return "Larghezza scanalatura 1";
      case MaxCutDataType.larghezzaScanalatura2:
        return "Larghezza scanalatura 2";
      case MaxCutDataType.selezionaIMaterialiDaSostituire:
        return "Seleziona i materiali da sostituire";
      case MaxCutDataType.edgingLength1Tag:
        return "Edging Length 1 Tag";
      case MaxCutDataType.edgingLength2Tag:
        return "Edging Length 2 Tag";
      case MaxCutDataType.edgingWidth1Tag:
        return "Edging Width 1 Tag";
      case MaxCutDataType.edgingWidth2Tag:
        return "Edging Width 2 Tag";
      case MaxCutDataType.applyMachiningCharge:
        return "Apply Machining Charge";
      case MaxCutDataType.longExpansion:
        return "Long Expansion";
      case MaxCutDataType.shortExpansion:
        return "Short Expansion";
    }
  }

  String? get defaultValue {
    switch (this) {
      case MaxCutDataType.tipo:
        return "Input Panel";
      case MaxCutDataType.nome:
        return null;
      case MaxCutDataType.lunghezza:
        return null;
      case MaxCutDataType.larghezza:
        return null;
      case MaxCutDataType.quantita:
        return null;
      case MaxCutDataType.note:
        return null;
      case MaxCutDataType.puoRuotare:
        return "IfNoGrain";
      case MaxCutDataType.materiale:
        return "2000x1000";
      case MaxCutDataType.bordaturaLunghezza1:
        return null;
      case MaxCutDataType.bordaturaLunghezza2:
        return null;
      case MaxCutDataType.larghezzaBordo1:
        return null;
      case MaxCutDataType.bordaturaLarghezza2:
        return null;
      case MaxCutDataType.includiSpessoreBordatura:
        return "False";
      case MaxCutDataType.nota1:
        return null;
      case MaxCutDataType.nota2:
        return null;
      case MaxCutDataType.nota3:
        return null;
      case MaxCutDataType.nota4:
        return null;
      case MaxCutDataType.raggruppa:
        return null;
      case MaxCutDataType.tagReport:
        return null;
      case MaxCutDataType.importId:
        return null;
      case MaxCutDataType.idPadre:
        return null;
      case MaxCutDataType.nomeOggettoLibreria:
        return null;
      case MaxCutDataType.lunghezzaFori1:
        return null;
      case MaxCutDataType.lunghezzaFori2:
        return null;
      case MaxCutDataType.larghezzaFori1:
        return null;
      case MaxCutDataType.larghezzaFori2:
        return null;
      case MaxCutDataType.lunghezzaScanalatura1:
        return null;
      case MaxCutDataType.lunghezzaScanalatura2:
        return null;
      case MaxCutDataType.larghezzaScanalatura1:
        return null;
      case MaxCutDataType.larghezzaScanalatura2:
        return null;
      case MaxCutDataType.selezionaIMaterialiDaSostituire:
        return null;
      case MaxCutDataType.edgingLength1Tag:
        return null;
      case MaxCutDataType.edgingLength2Tag:
        return null;
      case MaxCutDataType.edgingWidth1Tag:
        return null;
      case MaxCutDataType.edgingWidth2Tag:
        return null;
      case MaxCutDataType.applyMachiningCharge:
        return null;
      case MaxCutDataType.longExpansion:
        return "0";
      case MaxCutDataType.shortExpansion:
        return "0";
    }
  }

  //TODO: Those value should be taken from the user preferences
  // cause in this case for example we take for granted that the user does not
  // insert "  mm" after lunghezza and larghezza but maybe he already does in its excel file
  String get appendValue {
    switch (this) {
      case MaxCutDataType.tipo:
        return "";
      case MaxCutDataType.nome:
        return "";
      case MaxCutDataType.lunghezza:
        return " mm";
      case MaxCutDataType.larghezza:
        return " mm";
      case MaxCutDataType.quantita:
        return "";
      case MaxCutDataType.note:
        return "";
      case MaxCutDataType.puoRuotare:
        return "";
      case MaxCutDataType.materiale:
        return "";
      case MaxCutDataType.bordaturaLunghezza1:
        return "";
      case MaxCutDataType.bordaturaLunghezza2:
        return "";
      case MaxCutDataType.larghezzaBordo1:
        return "";
      case MaxCutDataType.bordaturaLarghezza2:
        return "";
      case MaxCutDataType.includiSpessoreBordatura:
        return "";
      case MaxCutDataType.nota1:
        return "";
      case MaxCutDataType.nota2:
        return "";
      case MaxCutDataType.nota3:
        return "";
      case MaxCutDataType.nota4:
        return "";
      case MaxCutDataType.raggruppa:
        return "";
      case MaxCutDataType.tagReport:
        return "";
      case MaxCutDataType.importId:
        return "";
      case MaxCutDataType.idPadre:
        return "";
      case MaxCutDataType.nomeOggettoLibreria:
        return "";
      case MaxCutDataType.lunghezzaFori1:
        return "";
      case MaxCutDataType.lunghezzaFori2:
        return "";
      case MaxCutDataType.larghezzaFori1:
        return "";
      case MaxCutDataType.larghezzaFori2:
        return "";
      case MaxCutDataType.lunghezzaScanalatura1:
        return "";
      case MaxCutDataType.lunghezzaScanalatura2:
        return "";
      case MaxCutDataType.larghezzaScanalatura1:
        return "";
      case MaxCutDataType.larghezzaScanalatura2:
        return "";
      case MaxCutDataType.selezionaIMaterialiDaSostituire:
        return "";
      case MaxCutDataType.edgingLength1Tag:
        return "";
      case MaxCutDataType.edgingLength2Tag:
        return "";
      case MaxCutDataType.edgingWidth1Tag:
        return "";
      case MaxCutDataType.edgingWidth2Tag:
        return "";
      case MaxCutDataType.applyMachiningCharge:
        return "";
      case MaxCutDataType.longExpansion:
        return "";
      case MaxCutDataType.shortExpansion:
        return "";
    }
  }
}

/// Example
/// Sep=;
/// Es: "Tipo;Nome;Lunghezza;Larghezza;Quantità;Note;Può ruotare (0 = N. / 1 = Sì / 2 = Uguale al materiale);Materiale;Bordatura lunghezza 1;Bordatura lunghezza 2;Larghezza bordo 1;Bordatura larghezza 2;Includi spessore bordatura;Nota 1;Nota 2;Nota 3;Nota 4;Raggruppa;Tag report;Import ID;ID padre;Nome oggetto libreria;Lunghezza fori 1;Lunghezza fori 2;Larghezza fori 1;Larghezza fori 2;Lunghezza scanalatura 1;Lunghezza scanalatura 2;Larghezza scanalatura 1;Larghezza scanalatura 2;Seleziona i materiali da sostituire;Edging Length 1 Tag;Edging Length 2 Tag;Edging Width 1 Tag;Edging Width 2 Tag;Apply Machining Charge;Long Expansion;Short Expansion";
/// Input Panel;a;1001 mm;500 mm;4;;IfNoGrain;2000x1000;;;;;False;;;;;;;1;1;;;;;;;;;;;;;;;;0;0
/// Input Panel;B;1700 mm;385 mm;1;;IfNoGrain;2000x1000;;;;;False;;;;;;;2;2;;;;;;;;;;;;;;;;0;0
class MaxCutResult {
  final String sep;
  final List<MaxCutObject> objects;

  MaxCutResult(this.objects, {this.sep = ";"});

  String get header {
    String res = "";
    for (final data in MaxCutDataType.values) {
      res += '"${data.fieldName}"$sep';
    }
    return res;
  }

  String _dumpObject(MaxCutObject object) {
    String res = "";
    for (final dataType in MaxCutDataType.values) {
      // Actual value inside Excel cell
      final String typeValue = object[dataType] ?? dataType.defaultValue ?? "";
      res += '"$typeValue${dataType.appendValue}"$sep';
    }
    return res;
  }

  String dump({bool includeHeader = true}) {
    String res = "";
    if (includeHeader) {
      res += "Sep=$sep\n$header\n";
    }

    for (final object in objects) {
      res += "${_dumpObject(object)}\n";
    }
    return res;
  }

  static String dumpAll(List<MaxCutResult> results) {
    String res = "";
    if (results.isEmpty) {
      return res;
    }

    res += results.first.dump();
    for (int i = 1; i < results.length; i++) {
      res += results[i].dump(includeHeader: false);
    }
    return res;
  }
}
