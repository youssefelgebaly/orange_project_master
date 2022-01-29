import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_project_master/models/products_model.dart';
import 'package:orange_project_master/modules/product_details/bloc/state.dart';
import 'package:orange_project_master/network/dio_helper.dart';
import 'package:orange_project_master/network/end_points.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super((InitialGetProductsDetailsState()));

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  ProductDetailsModel? product;


  void getProductDetails(String id) {
    emit(LoadingGetProductsDetailsData());
    DioHelper.getData(
      url: "${PRODUCTSDETAILS + id}",
    ).then((value) {
      product = ProductDetailsModel.fromJson(value.data);
      emit(SuccessGetProductsDetailsData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetProductsDetailsData());
    });
  }

  //
  // List <dynamic> productDetails = [];
  // void getProductDetails(String id) {
  //   emit(LoadingGetProductsDetailsData());
  //   if(productDetails.length==0)
  //   {
  //     DioHelper.getData(
  //       url: '${PRODUCTSDETAILS+id}',
  //
  //     ).then((value)
  //     {
  //       productDetails=value.data['product'];
  //       emit(SuccessGetProductsDetailsData());
  //       print(productDetails);
  //     }).catchError((error){
  //       print(error.toString());
  //       emit(ErrorGetProductsDetailsData());
  //     });
  //   }else
  //   {
  //     emit(SuccessGetProductsDetailsData());
  //   }
  // }
}