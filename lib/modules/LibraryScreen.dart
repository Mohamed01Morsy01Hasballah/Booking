import 'package:booking_app/layout/Booking.dart';
import 'package:booking_app/layout/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout/states.dart';

class LibraryScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<BookingCubit, BookingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BookingCubit.get(context);
        return Scaffold(
          body:Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConditionalBuilder(
                condition: cubit.favorite.isNotEmpty,
                builder: (context)=>ListView.separated(
                  physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index)=>BuiltRowItem(cubit.favorite[index],context),
                    separatorBuilder: (context,index)=>Container(
                      height: 7,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[300]
                      ),
                    ),
                    itemCount: cubit.favorite.length
                ),
                fallback:(context)=> Center(child: CircularProgressIndicator()
        )
            )
          )
        );
      },
    );
  }
  Widget BuiltRowItem(Map<String,dynamic>model,context){
    return GestureDetector(
      onTap: (){
        BookingCubit.get(context).getDownloadList(model);
      },
      child: Container(
        height: 130,
        width: double.infinity,
        child: Row(

          children: [
            Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0)

              ),
              child: Image(image: NetworkImage(model['book_image']),
                fit:BoxFit.cover,
                height: 130,
                width: 110,


              ),
            ),
            SizedBox(width: 2,),
            Expanded(
                child:
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey,

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                    [
                      Text(
                        model['title'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1
                      ),
                      Text(
                        model['author'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline2
                      ),
                      Text(
                       model['price'] ,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:Theme.of(context).textTheme.headline3
                      ),


                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }


  }

