import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// StatelessWidgetはプロパティを変更できない
// Statefulは動的に値が変更できる
class MyApp extends StatelessWidget {
  @override
  // build()メソッドでUIを作成
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'StudyOnFlutter',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        // Scaffoldウィジットはアプリバーやタイトルウィジットツリーを保持
        home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  // リストを宣言
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) { return Scaffold(
    appBar: AppBar(
      title: Text('Startup'),
    ),
    body: _buildSuggestions(),
  );
    // テストなんかに使う英単語をランダムに生成するパッケージ
    // final wordPair = WordPair.random();
    // return Text(wordPair.asUpperCase);

  }

  // ListViewを作成する
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      // 1行ごとに処理を呼ぶ
      itemBuilder: (context, i) {
        // 1ピクセルの高さの仕切りをListViewに追加している
        if (i.isOdd) return Divider();
        // 行数を2で割ったときの整数値を求める
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          // 利用可能な英文リスト数を肥えた場合は、さらに十個の英文を生成
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asUpperCase,
        style: _biggerFont,
      ),
    );
  }
}

// StatefulWidgetを使う！
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
