import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_project_master/layout/bloc/state.dart';
import 'package:orange_project_master/layout/menu_screen.dart';
import 'package:orange_project_master/modules/cart_screen.dart';
import 'package:orange_project_master/modules/categories_screen.dart';
import 'package:orange_project_master/modules/Home/home_screen.dart';
import 'package:orange_project_master/network/dio_helper.dart';

class ShoppingAppCubit extends Cubit<ShoppingAppStates> {
  ShoppingAppCubit() : super(AppInitialState());

  static ShoppingAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreen=
  [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    MenuScreen(),
  ];

  void changeBottom(int index)
  {
    currentIndex= index;
    emit(AppChangeBottomBarState());
  }
  // AutoGenerate? autoGenerate;
  // void getProducts() {
  //   emit(GetProductLoadingState());
  //     DioHelper.getData(
  //         url: 'products'
  //     ).then((value) {
  //       autoGenerate =AutoGenerate?.fromJson(value.data) ;
  //       autoGenerate!.products.map<AutoGenerate>((json) => AutoGenerate.fromJson(value.data)).toList();
  //       products=autoGenerate as List<AutoGenerate>;
  //       emit(GetProductSuccessState());
  //     }).catchError((error){
  //       print(error.toString());
  //       emit(GetProductErrorState());
  //     });
  //
  // }

  List <dynamic> products = [];
  void loadProducts() {
    emit(GetProductLoadingState());
    if(products.length==0)
    {
      DioHelper.getData(
        url: 'products',
      ).then((value)
      {
        products=value.data['products'];
        emit(GetProductSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(GetProductErrorState());
      });
    }else
    {
      emit(GetProductSuccessState());
    }
  }

  List <dynamic> categories = [];
  void getCategories() {
    emit(GetCategoriesLoadingState());
    if(categories.length==0)
    {
      DioHelper.getData(
        url: 'categories',
      ).then((value)
      {
        categories=value.data['categories'];
        emit(GetCategoriesLoadingState());
      }).catchError((error){
        print(error.toString());
        emit(GetCategoriesErrorState());
      });
    }else
    {
      emit(GetCategoriesSuccessState());
    }
}


}
