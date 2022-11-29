import 'package:booking_app/layout/cubit.dart';
import 'package:booking_app/layout/states.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Booking extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<BookingCubit,BookingStates>(
     listener: (context,state){},
     builder: (context,state){
       var cubit=BookingCubit.get(context);
       return  Scaffold(
         appBar: AppBar(
           title: Text('Booking'),
           actions: [
             IconButton(onPressed: (){
               cubit.changeMode();
             }, icon: Icon(Icons.settings))
           ],
         ),
         bottomNavigationBar:CurvedNavigationBar(
           index: cubit.currentIndex,
             onTap: (index){
             cubit.changeNav(index);
             },
             color: Colors.grey,
             buttonBackgroundColor: Colors.yellow,
             backgroundColor: Colors.orange,
             animationDuration: Duration(milliseconds: 700),
             items: [
               Icon(
                 Icons.home,
                 color: Colors.white,
               ),
               Icon(
                 Icons.favorite,
                 color: Colors.white,
               ),
               Icon(
                 Icons.chrome_reader_mode_outlined,
                 color: Colors.white,
               ),


               Icon(
                 Icons.person,
                 color: Colors.white,
               ),


             ]
         ) ,
         body: cubit.Screen[cubit.currentIndex],
       );
     },

   );
  }

}