library translit;

/// Simple dart package for converting Cyrillic symbols to Translit and back
class Translit {
  final Map _transliteratedSymbol = {
    'А': 'A',
    'Б': 'B',
    'В': 'V',
    'Г': 'G',
    'Д': 'D',
    'Ђ': 'Đ',
    'Е': 'E',
    'Ж': 'Ž',
    'З': 'Z',
    'И': 'I',
    'Ј': 'J',
    'К': 'K',
    'Л': 'L',
    'Љ': 'LJ',
    'М': 'M',
    'Н': 'N',
    'Њ': 'NJ',
    'О': 'O',
    'П': 'P',
    'Р': 'R',
    'С': 'S',
    'Ш': 'Š',
    'Т': 'T',
    'Ћ': 'Ć',
    'У': 'U',
    'Ф': 'F',
    'Х': 'H',
    'Ц': 'C',
    'Ч': 'Č',
    'Џ': 'DŽ',
    'а': 'a',
    'б': 'b',
    'в': 'v',
    'г': 'g',
    'д': 'd',
    'ђ': 'đ',
    'е': 'e',
    'ж': 'ž',
    'з': 'z',
    'и': 'i',
    'ј': 'j',
    'к': 'k',
    'л': 'l',
    'љ': 'lj',
    'м': 'm',
    'н': 'n',
    'њ': 'nj',
    'о': 'o',
    'п': 'p',
    'р': 'r',
    'с': 's',
    'ш': 'š',
    'т': 't',
    'ћ': 'ć',
    'у': 'u',
    'ф': 'f',
    'х': 'h',
    'ц': 'c',
    'ч': 'č',
    'џ': 'dž',
  };

  final Map _complicatedSymbols = {
    'Ња': 'Nja',
    'Ње': 'Nje',
    'Њи': 'Nji',
    'Њо': 'Njo',
    'Њу': 'Nju',
    'Ља': 'Lja',
    'Ље': 'Lje',
    'Љи': 'Lji',
    'Љо': 'Ljo',
    'Љу': 'Lju',
    'Џа': 'Dža',
    'Џе': 'Dže',
    'Џи': 'Dži',
    'Џо': 'Džo',
    'Џу': 'Džu',
    '.срб': '.срб',
    'иѕ.срб': 'иѕ.срб',
    'њњњ.из.срб': 'њњњ.из.срб',
    '.СРБ': '.СРБ',
    'ИЗ.СРБ': 'ИЗ.СРБ',
    'ЊЊЊ.ИЗ.СРБ': 'ЊЊЊ.ИЗ.СРБ',
  };

  /// Method for converting from translit for the [source] value
  String unTranslit({String source}) {
    if (source == null || source.isEmpty) return source;

    var regExp = RegExp(
      r'([a-z]+)',
      caseSensitive: false,
      multiLine: true,
    );

    if (!regExp.hasMatch(source)) return source;

    var sourceSymbols = [];
    var unTranslit = [];
    var deTransliteratedSymbol = {};

    _complicatedSymbols.forEach((key, value) {
      source = source.replaceAll(value, key);
    });

    sourceSymbols = source.split('');

    _transliteratedSymbol.forEach((key, value) {
      deTransliteratedSymbol[value] = key;
    });

    for (final element in sourceSymbols) {
      unTranslit.add(deTransliteratedSymbol.containsKey(element)
          ? deTransliteratedSymbol[element]
          : element);
    }

    return unTranslit.join();
  }

  /// Method for converting to translit for the [source] value
  String toTranslit({String source}) {
    if (source == null || source.isEmpty) return source;

    var regExp = RegExp(
      r'([а-я]+)',
      caseSensitive: false,
      multiLine: true,
    );

    if (!regExp.hasMatch(source)) return source;

    var translit = [];
    var sourceSymbols = [];

    sourceSymbols = source.split('');

    _transliteratedSymbol.addAll(_complicatedSymbols);

    for (final element in sourceSymbols) {
      translit.add(_transliteratedSymbol.containsKey(element)
          ? _transliteratedSymbol[element]
          : element);
    }

    return translit.join();
  }
}
