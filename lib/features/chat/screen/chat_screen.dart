import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  const ChatScreen({
    super.key,
    required this.name,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final Uri wsUrl = Uri.parse('ws://localhost:8000/ws/chat/testroom/');
  WebSocketChannel? _channel;
  List<String> data = [];

  @override
  void initState() {
    super.initState();
    _initialAsyncEvenv();
  }

  Future<void> _initialAsyncEvenv() async {
    try {
      _channel = WebSocketChannel.connect(wsUrl);
      if (_channel != null) {
        await _channel?.ready;
      }
    } on SocketException catch (e) {
      log(e.toString());
    } on WebSocketChannelException catch (e) {
      log(e.toString());
    }
  }

  void onSendData() {
    try {
      if (_channel != null) {
        _channel!.sink.add(widget.name);
      } else {
        _channel = WebSocketChannel.connect(wsUrl);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: StreamBuilder<dynamic>(
        stream: _channel?.stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            data.add(snapshot.data.toString());
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(snapshot.data.toString()),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: onSendData,
                  child: const Text(
                    'Send Data',
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      String newData = data[index];
                      return Text(newData);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
