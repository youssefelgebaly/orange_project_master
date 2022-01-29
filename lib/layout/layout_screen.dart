
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_project_master/Style/colors.dart';
import 'package:orange_project_master/layout/bloc/cubit.dart';
import 'package:orange_project_master/layout/bloc/state.dart';
import 'package:orange_project_master/modules/categories_screen.dart';
import 'package:orange_project_master/modules/Home/home_screen.dart';
class LayoutScreen extends StatefulWidget {
   const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {


  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingAppCubit,ShoppingAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=ShoppingAppCubit.get(context);

        return AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(isDrawerOpen ? 0.85:1.00)..rotateZ(isDrawerOpen ? -50:0),
          duration:const Duration(milliseconds: 200) ,
          decoration:BoxDecoration(
            color: defaultColor,
            borderRadius: isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
          ) ,

          child: Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              backgroundColor: Colors.grey[300],
              elevation: 0,
              iconTheme:const IconThemeData(
                color: defaultColor,
              ) ,
              leading: isDrawerOpen
                  ? GestureDetector(
                child: Icon(Icons.arrow_back_ios),
                onTap: () {
                  setState(() {
                    xOffset = 0;
                    yOffset = 0;
                    isDrawerOpen = false;
                  });
                },
              )
                  : GestureDetector(
                child: Icon(Icons.menu),
                onTap: () {
                  setState(() {
                    xOffset = 290;
                    yOffset = 80;
                    isDrawerOpen = true;
                  });
                },
              ),

            ),

            body:cubit.bottomScreen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottom(index);
            },
            selectedItemColor: defaultColor,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                activeIcon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.widgets_sharp),
                label: 'Categories',
                activeIcon: Icon(Icons.widgets_sharp),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Cart',
                activeIcon: Icon(Icons.shopping_cart),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_outlined),
                label: 'Menu',
                activeIcon: Icon(Icons.menu),
              ),

            ],
          ),
        ),
        );
      },

    );
  }
}
