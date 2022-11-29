import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(

        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 250,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(

                      child: Container(
                        height: 200,
                           width: double.infinity,
            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Image.asset('assets/images/common_book_2.jpg'),
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius:   50 ,
                        backgroundImage: AssetImage('assets/images/mm.jpg'),
                      ),
                    )
                  ],
                ),
              ),
              Text('Eng / Mohamed Morsy',
                  style: Theme.of(context).textTheme.bodyText1
              ),
              SizedBox(height: 10,),
              Text('Software Enginer & Junior Flutter Developer at google'
              ,  style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.grey[300]
                  )
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Followers',
                          style: Theme.of(context).textTheme.headline2
                      ),
                      SizedBox(height: 2,),
                      Text('1000',
                          style: Theme.of(context).textTheme.headline3
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Follow',
                          style: Theme.of(context).textTheme.headline2
                      ),
                      SizedBox(height: 2,),
                      Text('200'
                      , style: Theme.of(context).textTheme.headline3
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Posts',
                          style: Theme.of(context).textTheme.headline2
                      ),
                      SizedBox(height: 2),
                      Text('12',
                          style: Theme.of(context).textTheme.headline3
                      ),
                    ],
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}