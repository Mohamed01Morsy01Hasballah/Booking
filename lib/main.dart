import 'package:booking_app/layout/Booking.dart';
import 'package:booking_app/layout/cubit.dart';
import 'package:booking_app/layout/states.dart';
import 'package:booking_app/modules/OnBoarding.dart';
import 'package:booking_app/shared/DioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

 await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>BookingCubit()..getDataHardcoverFiction()..getDataManga()..getDataScience()..getDataSports()..getDataPictureBooks(),
      child: BlocConsumer<BookingCubit,BookingStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=BookingCubit.get(context);
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:ThemeData(
                backgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.black
                  ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20

                    )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: Colors.deepOrange,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.grey
                ),
                textTheme:TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54

                  ),
                  headline2: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange

                  ),
                  headline3: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54

                  ),


                )

            ),
            darkTheme: ThemeData(
              backgroundColor: Colors.black45,
              scaffoldBackgroundColor: Colors.black45,
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black,
                      statusBarIconBrightness: Brightness.light
                  ),
                  backgroundColor: Colors.black38,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20

                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(

                  backgroundColor: Colors.deepOrange,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey
              ),
              textTheme:TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white

                ),
                headline2: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange

                ),
                headline3: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white

                ),


              ),

            ),
            themeMode: cubit.isDark ? ThemeMode.dark: ThemeMode.light,
            home: OnBoardingScreen(),
          );
        },

      ),
    );
  }
}
