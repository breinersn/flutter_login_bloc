import 'package:flutter/material.dart';
import 'package:flutter_login_bloc/widgets/my_appbar.dart';

class ChatPage extends StatefulWidget {
  final String username;

  const ChatPage({super.key, required this.username})
      : assert(username != null);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              MyAppbar(
                leftIcon: 'assets/icons/back.svg',
                rightIcon: 'assets/icons/chat.svg',
                onRightClick: () {},
                onLeftClick: () => Navigator.pop(context),
              ),
              Expanded(child: Center(child: Text(widget.username)))
            ],
          ),
        ),
      ),
    );
  }
}
