import 'package:chatapp/constants.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget 
{
  const ChatBubble({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        
        padding:const  EdgeInsets.only(left: 16,top: 32,bottom: 32,right: 32),
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: const BoxDecoration(
          color: KprimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32)
          )
        ),
        child:Text(
              'i am ibra',
              style: TextStyle(
                    color:Colors.white 
                  ),
              ),
                   
              
          
        
       ),
    );
  }
}