import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:Breaking_Bad_Quotes/screen/fp.dart';
import 'package:http/http.dart' as http;

class secondscreen extends StatefulWidget {
  final String quotetext;
  final String authorname;
  secondscreen({Key? key, required this.quotetext, required this.authorname})
      : super(key: key);

  @override
  State<secondscreen> createState() => _secondscreenState();
}

class _secondscreenState extends State<secondscreen> {
  String quotes = "", authors = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Color.fromARGB(255, 239, 243, 0),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                ("\"${widget.quotetext}\""),
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "-${widget.authorname}",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                onPressed: () async {
                  var url =
                      Uri.parse('https://api.breakingbadquotes.xyz/v1/quotes/');
                  var response = await http.get(url);
                  print('respose status: ${response.statusCode}');
                  print('respose body: ${response.body}');
                  var data = jsonDecode(response.body);
                  quotes = data[0]["quote"];
                  authors = data[0]["author"];
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => secondscreen(
                                quotetext: quotes,
                                authorname: authors,
                              )));
                },
                child: const Text("Refresh Quote"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
