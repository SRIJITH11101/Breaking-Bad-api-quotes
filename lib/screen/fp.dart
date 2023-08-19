//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';

// ignore: camel_case_types
import 'package:Breaking_Bad_Quotes/screen/sp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Breaking_Bad_Quotes/screen/sp.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<homescreen> {
  String title = "Breaking Bad Quotes", quotes = "", authors = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // ignore: sort_child_properties_last
      child: Scaffold(
          backgroundColor: Color.fromARGB(215, 252, 228, 8),
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: Text(
                  //     quote,
                  //     style: TextStyle(fontSize: 25),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 12.0),
                  //   child: Align(
                  //       alignment: Alignment.bottomRight,
                  //       child: Text(
                  //         "-$author",
                  //         style: TextStyle(fontSize: 20),
                  //       )),
                  // ),
                  Center(
                    child: Image.network(
                        "https://ntvb.tmsimg.com/assets/p8696131_b_h10_aa.jpg?w=960&h=540"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        var url = Uri.parse(
                            'https://api.breakingbadquotes.xyz/v1/quotes/');
                        var response = await http.get(url);
                        print('respose status: ${response.statusCode}');
                        print('respose body: ${response.body}');
                        var data = jsonDecode(response.body);
                        quotes = data[0]["quote"];
                        authors = data[0]["author"];
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => secondscreen(
                                  quotetext: quotes,
                                  authorname: authors,
                                )));
                      },
                      child: const Text("Get Quote"),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
