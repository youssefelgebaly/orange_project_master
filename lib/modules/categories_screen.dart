import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_project_master/layout/bloc/cubit.dart';
import 'package:orange_project_master/layout/bloc/state.dart';
import 'package:orange_project_master/models/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingAppCubit,ShoppingAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var list =ShoppingAppCubit.get(context).categories;
        return SafeArea(
          child: GridView.count(
            primary: false,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            padding: const EdgeInsets.all(10),
            crossAxisCount: 2,
            children: List.generate(
              list.length,
                  (index) => GestureDetector(child: buildCategory(list[index],context)),
            ),
          ),
        ) ;
      },

    );
  }
}

Widget buildCategory(categories , context,) => Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            categories['avatar'],
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.black.withOpacity(
            0.6,
          ),
          width: 140,
          child: Text(
            categories['name'],
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    );
