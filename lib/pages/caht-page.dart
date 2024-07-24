import 'package:chatapp/constants.dart';
import 'package:chatapp/widgets/chat-bubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {

static String id='ChatPage';
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:KprimaryColor,
          //this for arrow to return back to pervious page 
          automaticallyImplyLeading: true,
          title:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset(
                KLogo,
                height: 50,
              ),
              const Text(
                'Chat',
                style: TextStyle(
                  color:Colors.white 
                ),
                ),
            ],
          ) ,
          centerTitle: true,
        ),
        body: Column(
          children: [
         Expanded(
            child: ListView.builder(
              itemBuilder:(context,index)
              {
                return ChatBubble();
              },
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: Icon(Icons.send,color: KprimaryColor,),
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: KprimaryColor)
                  ),
                                  enabledBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: KprimaryColor)
                  ),
                ),

              ),
            ),
          
          ],

        ),
      
      
    );
  }
}


