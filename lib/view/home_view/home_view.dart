import 'package:flutter/material.dart';
import 'package:news_app/core/theme/my_theme.dart';
import 'package:news_app/view/home_view/search.dart';

import '../category/category_grid_view.dart';
import '../category/category_widget.dart';
class HomeView extends StatefulWidget {
  static const String routeName='HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Category>category=[
    Category(categoryId: 'sports',
        categoryName: 'Sports',
        categoryImage: 'ball',
        categoryColor: Colors.red
    ),  Category(categoryId: 'general',
        categoryName: 'General',
        categoryImage: 'Politics',
        categoryColor: const Color(0xff003E90)
    ),  Category(categoryId: 'health',
        categoryName: 'Health',
        categoryImage: 'health',
        categoryColor: const Color(0xffED1E79)
    ),  Category(categoryId: 'business',
        categoryName: 'Business',
        categoryImage: 'bussines',
        categoryColor: const Color(0xffCF7E48)
    ),  Category(categoryId: 'technology',
        categoryName: 'Technology',
        categoryImage: 'environment',
        categoryColor: const Color(0xff4882CF)
    ),  Category(categoryId: 'science',
        categoryName: 'Science',
        categoryImage: 'science',
        categoryColor: const Color(0xffF2D352)
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/pattern.png'),
          )
      ),
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                  color: Colors.green,
                  width: double.infinity,
                  height: 110,
                  child: const Center(
                    child: Text('News App!',
                      style:   TextStyle(fontSize: 24,
                          fontWeight: FontWeight.w500,
                      color: Colors.white
                      )
                      ,textAlign: TextAlign.center,),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      selectedCategory=null;
                      Navigator.pop(context);
                    });
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.menu,size: 30,),
                     const SizedBox(width: 4,),
                      Text('Categories',style: Theme.of(context).textTheme.headline6,)
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
        appBar:

        AppBar(title: Text(selectedCategory==null?
          'News App':selectedCategory!.categoryName,style:
          TextStyle(fontSize: 22,fontWeight: FontWeight.w400)
          ,),

        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: NewsSearch());
          },
              icon: const Icon(Icons.search,size: 32,),)
        ],

        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
          centerTitle: true,
        ),
        body: selectedCategory == null?
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text('Pick your category \n of interest',style:
              Theme.of(context).textTheme.headline6!.copyWith(
                color: const Color(0xff4F5A69),
              ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: GridView.builder(gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  childAspectRatio: 6/7,

                ),
                      itemBuilder:(buildContext,index) =>CategoryGridView(
                        category[index],index,onClick
                      ),
                    itemCount: category.length,
                  ),
                ),
              ),
            ],
          ),
        ):
        CategoryWidget(selectedCategory!)
        ,
      ),
    );
  }

  Category? selectedCategory=null;

  void onClick(category){

    setState(() {
      selectedCategory=category;
    });

  }
}
