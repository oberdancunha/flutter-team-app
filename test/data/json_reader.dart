import 'dart:convert';
import 'dart:io';

String jsonReaderToString(String file) =>
    File('test/data/$file').readAsStringSync();

Map<String, dynamic> jsonReader(String file) => json.decode(
      File('test/data/$file').readAsStringSync(),
    ) as Map<String, dynamic>;
