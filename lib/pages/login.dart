import 'package:chatapp/constants.dart';
import 'package:chatapp/helper/show_snack_bar.dart';
import 'package:chatapp/pages/caht-page.dart';
import 'package:chatapp/pages/regsiter.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class Login extends StatefulWidget {
    Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    GlobalKey<FormState>formkey=GlobalKey();

    String? email,password;
    bool isloading=false;

  @override
  Widget build(BuildContext context) {
    return  ModalProgressHUD(
      inAsyncCall: isloading,
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
              const  Row(
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
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,  
                      ),
                    ),
                 ],
               ),
                const SizedBox(height:20 ),
                CustomTextField(
                  hint: 'Email',
                    text: 'Email must be not empty',
                    onChanged:(data)
                    {
                      email=data;
                    },
                ),
                
               const SizedBox(height:10),
                CustomTextField(
                  hint: 'Password',
                  text: 'Pasword must be not empty',
                    onChanged: (data)
                    {
                      password=data;
                    },
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
                        await loginUser();
                        Navigator.pushNamed(context, ChatPage.id);
                        
                      showSnackBar(context, 'login sucess'); 
                      }on FirebaseAuthException catch(ex)
                      {
                        if (ex.code == 'user-not-found')
                        {
                           showSnackBar(context,'No user found for that email');
                        }
                        else if (ex.code == 'wrong-password')
                        {
                          showSnackBar(context, 'wrong password for that user');                    
                        }
              
                      }
        
                      }
                   isloading=false;
                    setState(() {
                      
                    });
                    },
                  text: 'LOGIN',
            
                ),
                const SizedBox(height: 10,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     const Text(
                      'don\'t have an account ?',
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
                        Navigator.pushNamed(context,RegsiterPage.id);
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder:(context)
                        //   {
                        //     return const RegsiterPage();
                        //   } 
                        
                      },
                      child:const Text(
                        'Resister',
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

   
   
   
   
   
  

  Future<void> loginUser() async {
                     UserCredential user=  await FirebaseAuth.instance.signInWithEmailAndPassword
                      (email: email!, password: password!);
                    
  }
}