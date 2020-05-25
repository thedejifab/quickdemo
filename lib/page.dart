import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'package:schoolable/colors.dart';

import 'models.dart';
import 'widgets.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ValueNotifier<List<Message>> _messagesNotifier;
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    _messagesNotifier = ValueNotifier<List<Message>>(<Message>[]);
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                      expandedHeight: 450 + AppBar().preferredSize.height,
                      pinned: true,
                      floating: true,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      stretch: true,
                      titleSpacing: 0,
                      centerTitle: false,
                      bottom: AppBar(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        centerTitle: false,
                        title: ValueListenableBuilder<List<Message>>(
                            valueListenable: _messagesNotifier,
                            builder: (context, messages, _) {
                              return Text(
                                'Comments (${messages.length})',
                                style: TextStyle(
                                  fontSize: 18,
                                  // fontSize: _onlyShowingComments ? 18 : 12,
                                  color: CustomColors.mainColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            }),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: TopWidget(),
                      )),
                  ValueListenableBuilder<List<Message>>(
                      valueListenable: _messagesNotifier,
                      builder: (context, messages, _) {
                        return Builder(builder: (context) {
                          if (messages.isEmpty) {
                            return SliverFillRemaining(
                              hasScrollBody: false,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 120.0),
                                child: Center(
                                  child: Text('There are no messages'),
                                ),
                              ),
                            );
                          }
                          return SliverPadding(
                            padding: EdgeInsets.only(bottom: 120),
                            sliver: SliverList(
                                delegate: SliverChildListDelegate(
                              messages.map((message) {
                                return MessageWidget(
                                  messageContent: message.content,
                                  sentByMe: message.sentByMe,
                                );
                              }).toList(),
                            )),
                          );
                        });
                      }),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 120,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  color: CustomColors.grey3,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            border: Border.all(
                              color: CustomColors.grey.withOpacity(0.4),
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              TextField(
                                key: Key('messageField'),
                                style: TextStyle(
                                  color: CustomColors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                                controller: _controller,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 24),
                                  hintText: 'Leave a comment',
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      InkWell(
                        key: Key('sendButton'),
                        onTap: () {
                          if (_controller.text.isNotEmpty) {
                            _messagesNotifier.value
                                .add(generateMessageType(_controller.text));
                            _controller.clear();
                            _messagesNotifier.notifyListeners();
                          }
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: CustomColors.deepPurple,
                          child: Transform.rotate(
                            angle: 100,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 4.0, left: 8),
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

Message generateMessageType(String content) {
  Random random = Random();
  final bool byMe = random.nextBool();
  return Message(content, byMe);
}
