// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:tuple/tuple.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:pocketmd/widgets/chat_message.dart';
import 'package:pocketmd/data/preferences.dart';


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

Future<List<Tuple3<bool,String,String>>> getData(Preferences model, String url) async {
  List<Tuple3<bool,String,String>> tlist = [];
  var response = await http.get(url + "/retriever?u=" + model.name);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    //print(jsonResponse);
    for (Map<String,dynamic> map in jsonResponse) {
      //print(map['open']);
      tlist.add(Tuple3<bool,String,String>(true, map['volume'].toString(), map['open'].toString()));
    }
  } else {
    print("Request failed with status.");
  }
  return tlist;
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[]; // new
  TextEditingController _textController = new TextEditingController();


  /*@override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'initial text');
  }*/

  void _handleSubmitted(String text) {
    final model = ScopedModel.of<Preferences>(context, rebuildOnChange: true);
    _textController.clear();
    if (text.length > 0) {
      ChatMessage message = ChatMessage(true, model.name, text);
      _newMessagePost(model.name, text);
      setState(() {
        _messages.insert(0, message);
      });
    }
  }
  Future<void> _newMessagePost(String name, String text) async {
    var url = 'http://35.196.65.157/appmessage';
    var response = await http.post(url, body: {'user': name, 'content': text, 'token': "2"});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
  void _buildChatText(bool patient, String name, String text) {
    if (text.length > 0) {
      ChatMessage message = ChatMessage(patient, name, text);
      setState(() {
        _messages.insert(0, message);
      });
    }
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: CupertinoTextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: CupertinoButton(
                child: Text("Send"),
                onPressed: () => _handleSubmitted(_textController.text)
            ),
          ),
        ],
      ),
    );
  }





  Future<void> buildWait(Future<List<Tuple3<bool,String,String>>> ftlist) async {
    List<Tuple3<bool,String,String>> tlist = await ftlist;
    _messages.clear();
    if (tlist != null) {
      for (Tuple3<bool,String,String> tup in tlist) {
        _buildChatText(tup.item1, tup.item2, tup.item3);
      }
    }
  }

  Widget build(BuildContext context) {
    print("##############################");
    final model = ScopedModel.of<Preferences>(context, rebuildOnChange: true);
    final String url = "http://35.196.65.157";
    if (_textController.text.length == 0) {
      buildWait(getData(model, url));
    }
    return CupertinoPageScaffold(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, int index) => _messages[index],
            ),
          ),
          Divider(height: 1.0),
          Container(
            padding: EdgeInsets.only(bottom: 50.0),
            decoration: new BoxDecoration(
                color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }
}
