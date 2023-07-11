import 'package:flutter/material.dart';

class CategoryGridView extends StatelessWidget {
  Category category;
  int index;
 Function onClick;
  CategoryGridView(this.category,this.index,this.onClick);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      onClick(category);
      },
      child: Container(
        decoration: BoxDecoration(
          color: category.categoryColor,
          borderRadius: BorderRadius.only(
            topLeft:const Radius.circular(15) ,
            topRight:const Radius.circular(15) ,
            bottomRight:Radius.circular(index % 2 ==0 ?0 : 15) ,
            bottomLeft: Radius.circular(index % 2 ==0 ?15 : 0),
          )
        ),
child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
      Image.asset('assets/images/${category.categoryImage}.png'),
      Text(category.categoryName
        ,style: Theme.of(context).textTheme.headline4,),
  ],
),
      ),
    );
  }
}

class Category{
  String categoryId;
  String categoryName;
  String categoryImage;
  Color categoryColor;
  Category({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryColor,
});
}
