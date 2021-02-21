import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:m_welness/constants.dart';

class ChatBot extends StatefulWidget {
  ChatBot({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  void response(query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/service.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messsages.insert(
          0, {"data": 0, "message": aiResponse.getMessage().toString()});
    });
  }

  final messageInsert = TextEditingController();
  List<Map> messsages = List();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Text(
            'Wellness Bot',
            style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontFamily: 'LinotteBold',
                fontWeight: FontWeight.bold),
          ),
          Flexible(
              child: ListView.builder(
                  reverse: true,
                  itemCount: messsages.length,
                  itemBuilder: (context, index) => chat(
                      messsages[index]["message"].toString(),
                      messsages[index]["data"]))),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 5.0,
            color: Colors.white,
          ),
          Container(
            child: ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () {},
              ),
              title: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: kSecondaryColor,
                ),
                padding: EdgeInsets.only(left: 15),
                child: TextFormField(
                  controller: messageInsert,
                  decoration: InputDecoration(
                    hintText: "Enter a Message...",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'LinotteBold',
                        fontSize: 22),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  onChanged: (value) {},
                ),
              ),
              trailing: IconButton(
                  icon: Icon(
                    Icons.send,
                    size: 30.0,
                    color: kSecondaryColor,
                  ),
                  onPressed: () {
                    if (messageInsert.text.isEmpty) {
                      print("empty message");
                    } else {
                      setState(() {
                        messsages.insert(
                            0, {"data": 1, "message": messageInsert.text});
                      });
                      response(messageInsert.text.toUpperCase());
                      messageInsert.clear();
                    }
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  }),
            ),
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      ),
    );
  }

  Widget chat(String message, int data) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment:
            data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          data == 0
              ? Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://image.shutterstock.com/image-vector/cute-robot-character-chatbot-icon-600w-1223056801.jpg"),
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Bubble(
                radius: Radius.circular(15.0),
                color: data == 0 ? kSecondaryColor : Colors.orangeAccent,
                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                          child: Container(
                        constraints: BoxConstraints(maxWidth: 150),
                        child: Text(
                          message,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LinotteBold',
                          ),
                        ),
                      ))
                    ],
                  ),
                )),
          ),
          data == 1
              ? Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.vexels.com/media/users//3/145908/raw/52eabf633ca6414e60a7677b0b917d92.jpg"),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
