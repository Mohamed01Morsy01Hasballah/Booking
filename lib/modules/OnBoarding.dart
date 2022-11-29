import 'package:booking_app/layout/Booking.dart';
import 'package:booking_app/modules/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class BoardModel{
  final String image;
  final String title;
  final String des;
  BoardModel({
    required this.image,
    required this.title,
    required this.des
});
}
class OnBoardingScreen extends StatefulWidget{
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var controllerr=PageController();

  bool page=false;

  List<BoardModel>boarding=[
    BoardModel(
        image: 'assets/images/onBoarding_1.png',
        title: 'Very Important Books ',
        des: 'Definition of book noun a handwritten or printed work of'
            ' fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'
            ' a work of fiction or nonfiction in an electronic forma'
            't: Your child can listen to or read the book online'
    ),
    BoardModel(
        image: 'assets/images/onBoarding_2.png',
        title: ' Books have a lot of knowledge ',
        des: 'Definition of book noun a handwritten or printed work of'
            ' fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'
            ' a work of fiction or nonfiction in an electronic forma'
            't: Your child can listen to or read the book online'
    ),
    BoardModel(
        image: 'assets/images/onBoarding_3.png',
        title: 'Books increase human power in study ',
        des: 'Definition of book noun a handwritten or printed work of'
            ' fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'
            ' a work of fiction or nonfiction in an electronic forma'
            't: Your child can listen to or read the book online'
    ),


  ];

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                controller: controllerr,
                  itemBuilder: (context,index)=>BuiltItem(context,boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (index){
                  if(index==boarding.length-1){
                    setState(() {
                      page=true;
                    });
                  }else{
                    setState(() {
                      page=false;

                    });
                  }
                },
              ),
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: controllerr,
                    effect: ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 4,
                      dotColor:Colors.grey,
                      activeDotColor: Colors.deepOrange,
                      spacing: 5
                    ),
                    count: boarding.length
                ),
                Spacer(),
                FloatingActionButton(
                    onPressed: (){
                      if(page) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Booking()),
                                (route) => false
                        );
                      }else{
                        controllerr.nextPage(duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);

                      }
                    },
                  child: Icon(Icons.arrow_forward_ios,color: Colors.deepOrange,),
                )
              ],

            )
          ],
        ),
      )
    );
  }

  Widget BuiltItem(context,BoardModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
            image: AssetImage('${model.image}')
        ),
      ),
      Text('${model.title} ',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: Colors.black
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Text('${model.des}',
        style: Theme.of(context).textTheme.headline2!.copyWith(
            color: Colors.grey
        ),
      )
    ],
  ) ;
}