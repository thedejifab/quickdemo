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
      mainAxisAlignment: sentByMe? MainAxisAlignment.end:MainAxisAlignment.start,
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
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    '5 January, 2020',
                    style: TextStyle(
                      fontSize: 12,
                      color: CustomColors.grey,
                      fontWeight: FontWeight.w500,
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

// class MessageReceived extends StatelessWidget {
//   final String messageContent;

//   const MessageReceived({
//     Key key,
//     @required this.messageContent,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         Container(
//           margin: EdgeInsets.only(bottom: 30, top: 20, left: 24, right: 24),
//           constraints: BoxConstraints(
//             maxWidth: MediaQuery.of(context).size.width * 0.7,
//           ),
//           padding: EdgeInsets.all(20),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(21),
//                 topRight: Radius.circular(21),
//                 bottomRight: Radius.circular(21),
//               ),
//               color: Colors.white,
//               boxShadow: <BoxShadow>[
//                 BoxShadow(blurRadius: 12, color: Colors.grey.withOpacity(0.4))
//               ]),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 messageContent,
//                 textDirection: TextDirection.ltr,
//               ),
//               SizedBox(height: 20),
//               Row(
//                 children: <Widget>[
//                   CircleAvatar(
//                     radius: 16,
//                     backgroundColor: CustomColors.badgeColor,
//                   ),
//                   SizedBox(width: 10),
//                   Text(
//                     'Vintage Heights',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: CustomColors.mainColor,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Expanded(child: SizedBox()),
//                   Text(
//                     '5 January, 2020',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: CustomColors.grey,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
