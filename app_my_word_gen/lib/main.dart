import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

//otra forma
//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    return MaterialApp(
      home: RandomWord(),
    );
  }
}

class RandomWord extends StatefulWidget {
  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  final List<WordPair> suggestions = <WordPair>[];
  //Set?
  final Set<WordPair> saved = Set<WordPair>();
  final TextStyle biggerFont = TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    //return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: Text("Name Generator"),
        actions: <Widget>[
          IconButton(onPressed: pushSaved, icon: Icon(Icons.format_list_bulleted))
        ],
      ),
      body: buildSuggestions(),
    );

  }

  Widget buildSuggestions(){
    return ListView.builder(
        padding: EdgeInsets.all(16 ),
        itemBuilder: (BuildContext context, int i){
          if (i.isOdd){
            return Divider();
    }
          final int index = i ~/ 2;
          
          if (index >= suggestions.length){
            suggestions.addAll(generateWordPairs().take(10));
    }
          return buildRow(suggestions[index]);
    }
    );
  }

  Widget buildRow(WordPair pair) {
    final bool alreadySaved = saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          alreadySaved ? saved.remove(pair) : saved.add(pair);
        });
      },
    );
  }

  void pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
          builder: (BuildContext context){
            final Iterable<ListTile> tiles = saved.map(
                    (WordPair pair){
                      return ListTile(
                        title: Text(
                          pair.asPascalCase,
                          style: biggerFont,
                        ),
                      );
                    },
            );
            final List<Widget> divided = ListTile.divideTiles(
              context: context,
              tiles: tiles,
            ).toList();
            return Scaffold(
              appBar: AppBar(
                title: Text("Saved words!!!"),
              ),
              body: ListView(
                children: divided,
              ),
            );
          })
    );
  }
}