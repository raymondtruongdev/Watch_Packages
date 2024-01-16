part of watchface_manager;

void readWatchDesingAsset2(BuildContext context) async {
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

  // Write text file Json and Pretty XML
  // const filename1 = 'assets/watchfaces/mijo/res/raw/watchface_pretty.xml';
  // var file2 = await File(filename1).writeAsString(xmlString);

  // const filename2 = 'assets/watchfaces/mijo/res/raw/myjson_raymond.txt';
  // var file3 = await File(filename2).writeAsString(jsonString);

  return;
}

Future<void> copyAssetToFile(String assetPath, String filePath) async {
  // Get the byte data from the asset
  ByteData data = await rootBundle.load(assetPath);
  List<int> bytes = data.buffer.asUint8List();

  // Get the application directory
  String appDocDir = (await getApplicationDocumentsDirectory()).path;

  // Extract the directory path from the file path
  String directoryPath =
      '$appDocDir/${filePath.split('/').take(filePath.split('/').length - 1).join('/')}';

  // Create the directories if they don't exist
  await Directory(directoryPath).create(recursive: true);

  // Create the file in the application directory
  File file = File('$appDocDir/$filePath');

  // Write the bytes to the file
  await file.writeAsBytes(bytes);
}

void loadAsset(BuildContext context) async {
  // Copy a watchface from Assets to folder application
  await copyAssetToFile('assets/watchfaces/mijo/res/raw/watchface.xml',
      'watchfaces/mijo/res/raw/watchface.xml');

  // Get the path of watchface.xml at folder application
  final Directory directory = await getApplicationDocumentsDirectory();
  String pathFileXml =
      ('${directory.path}/watchfaces/mijo/res/raw/watchface.xml');

  // Read watchface.xml
  final file = File(pathFileXml);
  final document = XmlDocument.parse(file.readAsStringSync());
  // Code to read watchface.xml in Assets folder (debug mode)
  // String strXml = await rootBundle.loadString('assets/watchface.xml');
  // final document = XmlDocument.parse(strXml);

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

  // Write text file Json and Pretty XML
  // const filename1 = 'assets/watchfaces/mijo/res/raw/watchface_pretty.xml';
  // var file2 = await File(filename1).writeAsString(xmlString);

  // const filename2 = 'assets/watchfaces/mijo/res/raw/myjson_raymond.txt';
  // var file3 = await File(filename2).writeAsString(jsonString);

  return;
}
