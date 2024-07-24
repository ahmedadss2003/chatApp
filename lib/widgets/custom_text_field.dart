import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key,this.onChanged,this.hint,this.text});

String? hint;
String? text;
Function(String)? onChanged;


  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (value) 
      {
        if(value!.isEmpty)
        {
          return(text);
        }
      },
      onChanged:onChanged,
            decoration: InputDecoration(
            
            label: Text(
              '$hint',
              style:const  TextStyle(
                color: Colors.white
              ),
              ),
              // border: const OutlineInputBorder(
              //   Colors.amber,
              //   borderSide: BorderSide(
              //     color: Colors.white
              //     ),
              // ),

            
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                  ),
              ),
            ),
          );
  }
}