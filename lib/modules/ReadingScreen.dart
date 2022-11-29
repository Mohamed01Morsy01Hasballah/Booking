import 'package:booking_app/layout/cubit.dart';
import 'package:booking_app/layout/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit,BookingStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=BookingCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.libraryData.isNotEmpty,
            builder: (context){
              return GridView.builder(
                gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 4.8/8

              ),
                itemBuilder: (context,index)=>BuiltGridItem(cubit.libraryData[index], context),

               itemCount: cubit.libraryData.length,

              );
            },
            fallback:(context)=>Center(child: CircularProgressIndicator()),
        );
      },


    );
  }
  Widget BuiltGridItem(Map<String,dynamic> model,context)=>
      GestureDetector(
        onTap: (){
          BookingCubit.get(context).getDownloadList(model);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage('${model['book_image']}'),
              fit: BoxFit.cover
            )
          ),
        ),
      );

}