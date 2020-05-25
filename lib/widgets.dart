import 'package:flutter/material.dart';

import 'colors.dart';

class MessageWidget extends StatelessWidget {
  final String messageContent;
  final bool sentByMe;

  const MessageWidget({
    Key key,
    @required this.messageContent,
    @required this.sentByMe,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment:
          sentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 30, top: 20, left: 24, right: 24),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(21),
                topRight: Radius.circular(21),
                bottomLeft: sentByMe ? Radius.circular(21) : Radius.circular(0),
                bottomRight:
                    !sentByMe ? Radius.circular(21) : Radius.circular(0),
              ),
              color: sentByMe ? CustomColors.deeperPurple : Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(blurRadius: 12, color: Colors.grey.withOpacity(0.4))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                messageContent,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: sentByMe ? Colors.white : CustomColors.mainColor),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: CustomColors.badgeColor,
                    child: sentByMe ? Icon(Icons.person) : null,
                  ),
                  SizedBox(width: 10),
                  Text(
                    sentByMe ? 'You' : 'Vintage Heights',
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          sentByMe ? CustomColors.grey : CustomColors.mainColor,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '5 January, 2020',
                      style: TextStyle(
                        fontSize: 12,
                        color: CustomColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: CustomColors.mainColor,
              size: 28,
            ),
            onPressed: () {},
          ),
          SizedBox(height: 24),
          Text(
            'PTA Meeting',
            style: TextStyle(
              fontSize: 24,
              color: CustomColors.mainColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 24,
                backgroundColor: CustomColors.badgeColor,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                      text: TextSpan(children: <InlineSpan>[
                    TextSpan(
                      text: 'Vintage Heights',
                      style: TextStyle(
                        fontSize: 14,
                        color: CustomColors.mainColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ' | 5 January, 2020',
                      style: TextStyle(
                        fontSize: 14,
                        color: CustomColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ])),
                  SizedBox(height: 10),
                  Text(
                    'To you (Tolulope Saba)',
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomColors.mainColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 24),
          Divider(
            height: 0,
            color: CustomColors.grey,
          ),
          SizedBox(height: 36),
          Text(
            '1. We now charge Bitcoin for deposits. We deduct a small fee from each Bitcoin amount you send to our app.',
            style: TextStyle(
              fontSize: 14,
              color: CustomColors.mainColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 24),
          Text(
            '2. We posted this notice in our community group a few days ago. But since many people missed it, we decided to write it in this email as well.',
            style: TextStyle(
              fontSize: 14,
              color: CustomColors.mainColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.calendar_today,
                size: 16,
                color: CustomColors.purple,
              ),
              SizedBox(width: 10),
              Text(
                'Add to calendar',
                style: TextStyle(
                  fontSize: 14,
                  color: CustomColors.purple,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
