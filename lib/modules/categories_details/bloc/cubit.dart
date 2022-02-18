// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:orange_project_master/models/products_model.dart';
// import 'package:orange_project_master/modules/categories_details/bloc/state.dart';
// import 'package:orange_project_master/modules/product_details/bloc/state.dart';
// import 'package:orange_project_master/network/dio_helper.dart';
// import 'package:orange_project_master/network/end_points.dart';
//
// class CategoriesDetailsCubit extends Cubit<CategoriesDetailsStates> {
//   CategoriesDetailsCubit() : super((InitialGetCategoriesDetailsState()));
//
//   static CategoriesDetailsCubit get(context) => BlocProvider.of(context);
//
//   CategoriesDetailsModel? product;
//
//
//   void getCategoriesDetails(String id) {
//     emit(LoadingGetCategoriesDetailsData());
//     DioHelper.getData(
//       url: "${CATEGORIESDETAILS + id}",
//     ).then((value) {
//       product = CategoriesDetailsModel.fromJson(value.data);
//       emit(SuccessGetCategoriesDetailsData());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ErrorGetCategoriesDetailsData());
//     });
//   }
// }