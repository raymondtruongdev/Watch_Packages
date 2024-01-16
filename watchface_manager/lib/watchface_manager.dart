library watchface_manager;

import 'dart:convert';
import 'dart:io';

// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

part 'src/read_design_xml.dart';

void readWatchDesingAsset({bool isSave = false}) async {
  // Read data from file 'watchface.xml' at  Assets folder
  String pathFileXml = ('assets/watchfaces/mijo/res/raw/watchface.xml');
  // Read watchface.xml
  String strXml = await rootBundle.loadString(pathFileXml);
  final document = XmlDocument.parse(strXml);

// Convert the Pretty XML string
  var xmlString = document.toXmlString(pretty: true, indent: '\t');
  print('xmlString = $xmlString');

// Convert the Pretty XML string to JSON
  final Xml2Json xml2Json = Xml2Json();
  xml2Json.parse(xmlString);
  // Transform to JSON using ParkerWithAttrs
  var jsonString = xml2Json.toParkerWithAttrs();
  print('jsonString = $jsonString');

  var data = jsonDecode(jsonString);
  print('data = $data');

  if (isSave == true) {
    // Write text file Json and Pretty XML
    const filename1 = 'assets/watchfaces/mijo/res/raw/watchface_pretty.xml';
    var file2 = await File(filename1).writeAsString(xmlString);

    const filename2 = 'assets/watchfaces/mijo/res/raw/myjson_raymond.txt';
    var file3 = await File(filename2).writeAsString(jsonString);
  }
  return;
}
