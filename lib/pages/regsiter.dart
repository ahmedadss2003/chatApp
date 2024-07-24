import 'package:chatapp/constants.dart';
import 'package:chatapp/helper/show_snack_bar.dart';
import 'package:chatapp/pages/caht-page.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegsiterPage extends StatefulWidget {
   RegsiterPage({super.key});
  static String id='RegsiterPage';

  @override
  State<RegsiterPage> createState() => _RegsiterPageState();
}

class _RegsiterPageState extends State<RegsiterPage> {
  String ?email;

  String? password;

  bool isloading=false;

GlobalKey<FormState>formkey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:isloading ,
      child: Scaffold(
        backgroundColor:KprimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
              const  SizedBox(height: 75,), 
              Image.asset(
                'assets/images/scholar.png',
                height: 100,
                ),
                 const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                      'Scholar Chat',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: 'pacifico'
                      ),
                                 ),
                   ],
                 ),
                
            const  SizedBox(height: 75,), 
              const  Row(
                 children: [
                     Text(
                      'REGSITER',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,  
                      ),
                    ),
                 ],
               ),
                const SizedBox(height:20 ),
                CustomTextField(
                  text: 'Email must be not empty',
                  onChanged:(data)
                  {
                    email=data;
                  },
                  hint: 'Email',
                ),
               const SizedBox(height:10),
                CustomTextField(
                  text: 'Pasword must be not empty',
                  onChanged: (data)
                  {
                    password=data;
                  },
                  hint: 'Password',
                  
                ),
                 const SizedBox(height:20 ),
                 CustomButton(
                  onTap: ()async
                  {
                    
                    if(formkey.currentState!.validate())
                    isloading=true;
                    setState(() {

                    });
                    
                    {
                      try
                    {
                      await registerUser();
                       Navigator.pushNamed(context, ChatPage.id);
                      
                    showSnackBar(context, 'email created sucess');
                    
            

                    
                    }on FirebaseAuthException catch(ex)
                    {
                      if (ex.code == 'weak-password')
                      {
                         showSnackBar(context,'weak password');
                      }
                      else if (ex.code == 'email-already-in-use')
                      {
                        showSnackBar(context, 'email already exists');                    
                      }
            
                    }
      
                    }
                 isloading=false;
                  setState(() {
                    
                  });
                  },
                  text: 'REGSITER',
                 ),
                const SizedBox(height: 10,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     const Text(
                      'already have an account ?',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: ()
                      {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xffC7EDE6),
                        ),
                      ),
                    ),
                  ],
                ),
                
            
                
            
                
            
              ],
            ),
          ),
        ),
      
      ),
    );
  }


  Future<void> registerUser() async {
      var  auth = FirebaseAuth.instance;
                     UserCredential
                      user=  await auth.createUserWithEmailAndPassword(email: email!, password: password!);
                    
  }
}