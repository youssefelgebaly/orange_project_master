import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_project_master/layout/bloc/cubit.dart';
import 'package:orange_project_master/layout/bloc/state.dart';
import 'package:orange_project_master/layout/layout_screen.dart';
import 'package:orange_project_master/modules/login_screen.dart';
import 'network/dio_helper.dart';

void main() {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)=>ShoppingAppCubit()..getCategories()..loadProducts(),
      child: BlocConsumer<ShoppingAppCubit,ShoppingAppStates>(
        listener: (context,state){},
        builder: (context,state){
          return  MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,


              home: LoginScreen(),

          ) ;
        },

      ),
    );
  }
}
