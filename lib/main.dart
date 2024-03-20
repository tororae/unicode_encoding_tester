import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController getText = TextEditingController();
  TextEditingController getUtf = TextEditingController();
  TextEditingController getUtf16 = TextEditingController();
  List<int> utfList = [];
  List<int> utf16List = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Text -> UTF8",
                  style: TextStyle(fontSize: 25),
                ),
                TextField(
                  decoration: InputDecoration(isDense: true),
                  controller: getText,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text("😊utf8 결과"),
                SelectableText(utf8.encode(getText.text).toString()),
                Text("😊utf16 결과"),
                SelectableText(getText.text.codeUnits.toString()),
                Text("😊utf16 runes 결과"),
                SelectableText(getText.text.runes.toString()),
                Text("😊utf16 다시 글자로"),
                SelectableText(String.fromCharCodes(getText.text.codeUnits)),
                SelectableText(
                    "🧡변환 16진수 :${getText.text.runes.map((e) => "0x${e.toRadixString(16)}")}"),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  "UTF16 -> Text",
                  style: TextStyle(fontSize: 25),
                ),
                Text("utf16 배열 입력(,로 구분)"),
                TextField(
                  decoration: InputDecoration(isDense: true),
                  controller: getUtf16,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        List<String> getCode = getUtf16.text.split(",");

                        for (var code in getCode) {
                          utf16List.add(int.parse(code));
                        }
                        getUtf16.text = "";
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal),
                        child: const Text(
                          "변환 시작",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        utf16List = [];
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal),
                        child: const Text(
                          "리스트 초기화",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text("😊utf16 배열값\n$utf16List"),
                const SizedBox(height: 10),
                SelectableText(
                    "utf16 배열값 16진수로\n${utf16List.map((e) => "0x${e.toRadixString(16)}")}"),
                const SizedBox(height: 10),
                const Text("😊utf16  글자로"),
                SelectableText(String.fromCharCodes(utf16List)),
                const SizedBox(height: 20),
                const Text(
                  "UTF8 -> Text",
                  style: TextStyle(fontSize: 25),
                ),
                const Text("utf8 배열 입력(,로 구분)"),
                TextField(
                  decoration: const InputDecoration(isDense: true),
                  controller: getUtf,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {
                        List<String> getCode = getUtf.text.split(",");

                        for (var code in getCode) {
                          utfList.add(int.parse(code));
                        }
                        getUtf.text = "";
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal),
                        child: const Text(
                          "리스트 삽입",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        utfList = [];
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal),
                        child: const Text(
                          "리스트 초기화",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("😊utf8 배열값\n$utfList"),
                SizedBox(
                  height: 10,
                ),
                SelectableText("😊utf8 변환 결과값\n${utf8.decode(utfList)}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
