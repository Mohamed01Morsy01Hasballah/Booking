import 'package:booking_app/layout/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Components/Book_data.dart';
import '../Components/Common_book.dart';
import '../Components/components.dart';
import '../layout/states.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit,BookingStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit =BookingCubit.get(context);
        return Scaffold(
          body:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10) ,
                  color: Colors.grey[300]
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search'
                        ),
                      ),
                    )
                  ],

                ),
              ),
            ),
            Expanded(
              child: ConditionalBuilder(
                  condition: state is! LayoutGetCurrentMangaDataLoadingState,
                  builder: (context)=>
                      ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: [
                          Common_Book(context),
                          SizedBox(height: 15,),
                          BulitItemList(
                              cubit.dataHardcoverFiction,
                            context,
                            'suggestions',

                          ),
                          SizedBox(height: 35,),
                          BulitItemList(
                            cubit.dataPictureBooks,
                            context,
                            'bestSeller',

                          ),
                          SizedBox(height: 35,),
                          BulitItemList(
                            cubit.dataScience,
                            context,
                            'offers',

                          ),
                          SizedBox(height: 35,),
                          BulitItemList(
                            cubit.dataSports,
                            context,
                            'newRelease',

                          ),
                          SizedBox(height: 35,),
                          BulitItemList(
                            cubit.dataManga,
                            context,
                            'whatFriendsRead',

                          ),
                          SizedBox(height: 35,),

                        ],
                      ),
                  fallback:(context)=> Center(child: LinearProgressIndicator())
              ),
            )
            ],
          ),
        )
        );
      },

    );

  }

}