import 'package:flutter/material.dart';

import 'login_screen.dart';
class SingUpScreen extends StatefulWidget {
   SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  var formKey=GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController=TextEditingController();
  var nameController=TextEditingController();

  bool _isVisible = false;
  bool _isPasswordCharacters = false;
  bool _hasPasswordNumber = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordCharacters = false;
      if(password.length >= 8) {
        _isPasswordCharacters = true;
      }
      _hasPasswordNumber = false;
      if(numericRegex.hasMatch(password)) {
        _hasPasswordNumber = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme:const IconThemeData(
          color: Colors.red
        ) ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                      width: 180,
                      child: Image.asset('assets/images/logo.png',)),
                  const SizedBox(
                    height: 70,
                  ),
                  TextFormField(
                    validator: (value)
                    {
                      if(value!.isEmpty){
                        return 'Please enter a valid name! ';
                      }
                    },
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.person),
                      hoverColor: Colors.red,

                    ),


                    style:TextStyle(
                        color: Colors.red[600]
                    ) ,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value)
                    {
                      if(value!.isEmpty){
                        return 'Please enter a valid email! ';
                      }
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.email),
                      hoverColor: Colors.red,

                    ),


                    style:TextStyle(
                        color: Colors.red[600]
                    ) ,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(

                    validator: (value)
                    {
                      if(value!.isEmpty || !_hasPasswordNumber || !_isPasswordCharacters ){
                        return 'Please enter a valid password! ';
                      }
                    },
                    onChanged: (password) => onPasswordChanged(password),
                    obscureText: !_isVisible,
                    controller: passwordController,
                    keyboardType:TextInputType.visiblePassword ,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hoverColor: Colors.red,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon:  IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: _isVisible ? const Icon(Icons.visibility, color: Colors.red,) :
                        const Icon(Icons.visibility_off, color: Colors.grey,),
                      ),),
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: _isPasswordCharacters ?  Colors.red : Colors.transparent,
                            border: _isPasswordCharacters ? Border.all(color: Colors.transparent) :
                            Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: const Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                      ),
                      SizedBox(width: 10,),
                      const Text("Contains at least 8 characters")
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: _hasPasswordNumber ?  Colors.red : Colors.transparent,
                            border: _hasPasswordNumber ? Border.all(color: Colors.transparent) :
                            Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: const Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                      ),
                      const SizedBox(width: 10,),
                      const Text("Contains at least 1 number")
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width:double.infinity,
                    height: 50,
                    clipBehavior: Clip.none,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red
                    ),
                    child: MaterialButton(onPressed: ()
                    {
                    if(formKey.currentState!.validate()){
                      print("test");
                    }
                    },


                      child: const Text('Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Have an account?',
                        style: Theme.of(context).textTheme.caption,

                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(onPressed: (){
                        Navigator.pop(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                      }, child: const Text('Login Now !',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ),
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
