import 'package:booking_app/layout/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget BulitItemList(List model,context,String title)=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
    '${title}',
  style: Theme.of(context).textTheme.bodyText1
),
    SizedBox(height: 5,),
    Container(
    width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(9),
          bottomLeft: Radius.circular(9)
        ),
        color: Colors.grey,

      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder : (context,index)=>BuiltItem(model[index], context),
            separatorBuilder : (context,index)=>SizedBox(width: 10,),
            itemCount : model.length
        ),
      ),
    )
  ],
);
Widget BuiltItem(Map<String,dynamic> model,context)=>GestureDetector(
  onTap: (){},
  child:   Container(
    height: 700,
    width: 150,
    child:   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image(
            image: NetworkImage('${model['book_image']}'),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '${model['title']}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:Theme.of(context).textTheme.headline2
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '${model['publisher']}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline3

        ),
        SizedBox(
          height: 5,
        ),

        GestureDetector(
          onTap: (){
            BookingCubit.get(context).GetFavorite(model);
          },
          child: Container(
            height: 20,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:Colors.white
              ),
              child:Icon(Icons.favorite_border,size: 20,)

          ),
        ),
        Spacer(),
        Row(
          children: [
            Icon(
              Icons.star_rate_rounded,
              color: Colors.amber.shade800,
              size: 20.0,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: Colors.amber.shade800,
              size: 20.0,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: Colors.amber.shade800,
              size: 20.0,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: Colors.amber.shade800,
              size: 20.0,
            ),
          ],
        )
      ],
    ),
  ),
);