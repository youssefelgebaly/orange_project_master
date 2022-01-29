
import 'package:flutter/material.dart';
import 'package:orange_project_master/layout/layout_screen.dart';
import 'package:orange_project_master/layout/menu_screen.dart';
import 'package:orange_project_master/modules/singup_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool _isVisible = false;
  bool _isPasswordCharacters = false;
  bool _hasPasswordNumber = false;
  bool _hasEmailValid = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    setState(() {
      _isPasswordCharacters = false;
      if (password.length >= 8) {
        _isPasswordCharacters = true;
      }
      _hasPasswordNumber = false;
      if (numericRegex.hasMatch(password)) {
        _hasPasswordNumber = true;
      }
    });
  }

  onEmailChanged(String email)
  {
    final emailValid =RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    setState(() {
      _hasEmailValid =false;
      if(emailValid.hasMatch(email)){
        _hasEmailValid = true;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: 160,
                          child: Image.network(
                            'https://pbs.twimg.com/profile_images/1463964234744836099/yEJDQ4Eq_400x400.jpg',
                          )),
                      SizedBox(
                          width: 160,
                          child: Image.asset(
                            'assets/images/logo.png',
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onChanged: (email){onEmailChanged(email);},
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty || !_hasEmailValid) {
                        return 'Please enter a valid email! ';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.email),
                      hoverColor: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: !_isVisible,
                    validator: (value) {
                      if (value!.isEmpty || !_hasPasswordNumber || !_isPasswordCharacters) {
                        return 'Please enter a valid password! ';
                      }
                    },

                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (password){onPasswordChanged(password);},
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hoverColor: Colors.red,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: _isVisible
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              ),
                      ),
                    ),
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

                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    clipBehavior: Clip.none,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red),
                    child: MaterialButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Stack(
                                        children: [
                                          MenuScreen(),
                                          LayoutScreen(),
                                        ],
                                      )), (route) {
                            return false;
                          });
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have account?',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingUpScreen()));
                          },
                          child: const Text(
                            'SingUp Now !',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
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
