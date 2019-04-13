// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:veggieseasons/widgets/chat_message.dart';


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
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
    _textController.clear();
    if (text.length > 0) {
      ChatMessage message = ChatMessage(
        text: text,
      );
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

  Widget build(BuildContext context) {
    for (int i = 0; i < _messages.length; i++) {
      print(_messages[i].text);
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



  /*@override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<AppState>(context, rebuildOnChange: true);

    return CupertinoTabView(
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Styles.scaffoldBackground,
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                _createSearchBox(),
                Expanded(
                  child: _buildSearchResults(model.searchPrescriptions(terms)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }*/
}
