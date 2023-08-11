import 'dart:convert';

void main() {
  // print("ok");
  // there is a problem if the key len is less than the len of the email extracted
  print(generatePassword("SECOND","01156940929", "1"));
}

Map<String, String> char_mapping_1 = {};

List keys = [
  '!',
  '"',
  '#',
  '\$',
  '%',
  '&',
  "'",
  '(',
  ')',
  '*',
  '+',
  ',',
  '-',
  '.',
  '/',
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  ':',
  ';',
  '<',
  '=',
  '>',
  '?',
  '@',
  '[',
  '\\',
  ']',

  '^',
  '_',
  '`',
  '{',
  '|',
  '}',
  '~',
  'a',
  'b',
  'c',
  'd',
  '.',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z',
  '.',
];
List values = [
  '1',
  '@',
  '3',
  '7',
  '9',
  '4',
  '0',
  ')',
  '*',
  '+',
  'R',
  '-',
  'D',
  '/',
  '8',
  '5',
  '6',
  '2',
  '?',
  'Z',
  'A',
  'P',
  'E',
  ']',
  '[',
  '{',
  '}',
  '|',
  '^',
  'L',
  '~',
  '_',
  '=',
  '!',
  '#',
  '.',
  '\$',
  '&',
  '"',
  ':',
  ';',
  '<',
  'b',
  'c',
  'd',
  '.',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z',
  'a'
];

List valuesRandomed = [];
void changCharsEncrypter(String char) {
  // char = "4";
  int keyslen = keys.length;
  int placeOfChar = keys.indexOf(char.toLowerCase());

  // print(keyslen);
  // print(valuesRandomed.length);
  // print('this is the place of char $placeOfChar');
  // print('this is keys len $keyslen');
  // for random changes the charpath
  for (int i = placeOfChar; i < keyslen - 1; i++) {
    // print(values[i]);
    valuesRandomed.add(values[i]);
  }
  for (int i = 0; i < placeOfChar; i++) {
    // print(values[i]);
    valuesRandomed.add(values[i]);
  }


  // print(valuesRandomed.length);
  keys.remove('.');
  // print(keys.length);
  int counter = 0;
  for (var element in keys) {

    char_mapping_1[element] = valuesRandomed[counter];
    counter++;

  }
}

List keyIncrypted(Map map, userky, charForEncrypting) {
  changCharsEncrypter(charForEncrypting);
  List<String> charList = userky.split('');
  List keyIncrypted = [];

  for (String char in charList) {
    keyIncrypted.add(map[char.toLowerCase()]);
  }

  return keyIncrypted;
}

List emergeEncryptedKeyWithEmail(List EncryptedKey, String Email) {
  if (EncryptedKey.length < Email.length) {
    List lettersWillbeadded = [
      'Z',
      'X',
      'C',
      'V',
      'B',
      'N',
      'M',
      'Q',
      'W',
      'E',
      'R',
      'T',
      'Y',
      'U',
      'I'
    ];
    lettersWillbeadded.forEach(
      (element) {
        EncryptedKey.add(element);
      },
    );
    print(EncryptedKey);
    // print("is less than it");
    // print("this is the encrypted key after edeting$EncryptedKey");
  }

  int indexOfMark = Email.indexOf("@");
  int emailLen = Email.length;
  List emailCharList;
  int charsToConsider;
  if (indexOfMark != -1) {
    double percentage = 0.60; // 70%
    charsToConsider = (emailLen * percentage).round();
    emailCharList = Email.substring(0, indexOfMark).split('');
    // print(emailCharList);
  } else {
    double percentage = 0.60; // 70%
    charsToConsider = (emailLen * percentage).round();
    emailCharList = Email.substring(0, charsToConsider).split('');
    // print(emailCharList);
  }
  List passEmarged = [];

  int counter = 1;
  for (String char2 in emailCharList) {
    passEmarged.add(char2);
    passEmarged.add(EncryptedKey[counter]);
    counter++;
    if (counter > 9) {
      // will make the password never exceed the len of 9
      break;
    }
  }
  passEmarged.add("_$charsToConsider#\$"); //this will add the len for it

  // print(passEmarged);
  return passEmarged;
}

String generatePassword(String userky, String email, String level) {
  // Combine the key and email

  List encryptedKey;
  if (level == "1") {
    int emailLen = email.length;
    int indexOfMark = email.indexOf("@");
    String lastChar;

    if (indexOfMark != -1) {
      lastChar = email[indexOfMark - 2]; // for extract the char to encrypt
    } else {
      lastChar = email[emailLen - 2];
    }

    encryptedKey = keyIncrypted(char_mapping_1, userky, lastChar);
  } else {
    encryptedKey = [];
  }
  // You can now use the modified char_mapping_1 map here
  List finalProduct = emergeEncryptedKeyWithEmail(encryptedKey, email);
  String pass = "";
  for (var char in finalProduct) {
    pass += char.toString();
  }
  // print(pass);
  return pass;
}

// unwanted right now
Map<String, String> char_mapping_2 = {
  '!': 'P',
  '"': '-',
  '#': '>',
  '\$': '5',
  '%': '}',
  '&': 'A',
  "'": '9',
  '(': 'c',
  ')': '=',
  '*': ']',
  '+': 'P',
  ',': '1',
  '-': 'K',
  '.': '~',
  '/': '{',
  '0': '3',
  '1': 'f',
  '2': 'j',
  '3': 'q', // Corrected value
  '4': '7', // Corrected value
  '5': 'z',
  '6': 'd',
  '7': 'b',
  '8': 'y',
  '9': '4',
  ':': '!',
  ';': 'E',
  '<': '#',
  '=': 'u',
  '>': 'l',
  '?': 'k',
  '@': '^',
  '[': 't',
  '\\': '8',
  ']': '2', // Corrected value
  '^': '6', // Corrected value
  '_': '*',
  '`': '-',
  '{': 'i',
  '|': 'g',
  '}': 'Q',
  '~': 'H',
  'a': 'W',
  'b': 'X',
  'c': 'v',
  'd': 'n',
  'e': 'L',
  'f': 'B',
  'g': 'S',
  'h': 'G',
  'i': 'M',
  'j': 'r',
  'k': 'i',
  'l': 'T',
  'm': '}',
  'n': '6',
  'o': 'F',
  'p': '7', // Corrected value
  'q': 'R',
  'r': 'U',
  's': 'Y',
  't': 'C',
  'u': 'V',
  'v': '|',
  'w': 'O',
  'x': '2',
  'y': '1',
  'z': 'z'
};

Map<String, String> char_mapping_3 = {
  '1': '!',
  '@': '"',
  '3': '#',
  '7': '\$',
  '9': '%',
  '4': '&',
  '0': "'",
  ')': '(',
  '*': ')',
  '+': '*',
  ',': '+',
  '-': ',',
  '.': '-',
  '/': 'S',
  '8': '/',
  '5': '0',
  '6': '1',
  '2': '2',
  '>': '3',
  '?': '4',
  'Z': '5',
  'A': '6',
  'P': '7',
  'E': '8',
  ']': '9',
  '[': ':',
  '{': ';',
  '}': '<',
  '|': '=',
  '^': '>',
  '`': '?',
  '~': '@',
  '_': '[',
  '=': '\\',
  '!': ']',
  '#': '^',
  '\$': '_',
  '&': '`',
  '"': '{',
  ':': '|',
  ';': '}',
  '<': '~',
  'b': 'a',
  'c': 'b',
  'd': 'c',
  '.': 'd',
  'e': 'G',
  'f': 'e',
  'g': 'f',
  'h': 'g',
  'i': 'h',
  'j': 'i',
  'k': 'j',
  'l': 'k',
  'm': 'l',
  'n': 'm',
  'o': 'n',
  'p': 'o',
  'q': 'p',
  'r': 'q',
  's': 'r',
  't': 's',
  'u': 't',
  'v': 'u',
  'w': 'v',
  'x': 'w',
  'y': 'x',
  'z': 'y',
  'a': 'z'
};
