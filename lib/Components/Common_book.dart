import 'package:booking_app/Components/Book_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../layout/cubit.dart';

Widget Common_Book(context)=>
    Container(
      margin: EdgeInsets.symmetric(
          horizontal: 2,
          vertical: 20
      ).copyWith(
          bottom: 0
      ),
      height: 180,
      child: Stack(
        children: [
          PageView(
            controller: BookingCubit.pageController,
            children: CommonBook.getCommonBooks()
                .map((e) => Stack(
              fit: StackFit.expand,

              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        '${e.image}',
                        fit: BoxFit.cover,
                        scale: 1,
                      )

                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient:LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.black,
                            Colors.black45,
                            Colors.black12,
                            Colors.black.withOpacity(0)
                          ]
                      )
                  ) ,
                ),
                Positioned(
                    top: 20,
                    left: 30,
                    child: Text('UpcomingBook',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white
                        )

                    )
                    ),

                Positioned(
                    right: 20.0,
                    bottom: 10.0,
                    child: Text(
                      '30+ new book coming with various \ngames are waiting for you',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.white
                      )

                ))

              ],

            )).toList(),
          ),
          Positioned(
            left: 30,
            bottom: 10,
            child: SmoothPageIndicator(
              controller: BookingCubit.pageController,
              count: CommonBook.getCommonBooks().length,
              effect:ExpandingDotsEffect(
                  expansionFactor: 4,
                  dotWidth: 10,
                  dotHeight: 5,
                  dotColor: Colors.white
              ) ,
              onDotClicked: (index){
                BookingCubit.pageController.animateToPage(index,
                    duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
              },
            ),
          )
        ],
      ),
    );