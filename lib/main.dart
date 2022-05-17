import 'package:flutter/material.dart';
import 'package:flutter_tutorial/quote.dart';
import 'package:flutter_tutorial/quote_card.dart';

void main() {
  runApp(const MaterialApp(
    home:Home(),
  ));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Quote> quotes = [
    Quote(text: "First quote first quote first quote", author: "Haithem") ,
    Quote(text: "Second quote second quote second quote", author: "Haithem") ,
    Quote(text: "Third quote third quote third quote", author: "Haithem") ,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        centerTitle: true,
        title: const Text("Awesome Quotes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: quotes.map( (quote) => QuoteCard(
              quote: quote,
              delete: () {
                setState(() {
                  quotes.remove(quote);
                });
              },
          )).toList(),
        ),
      ),
    );
  }
}


