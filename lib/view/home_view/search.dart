import 'package:flutter/material.dart';

import '../../core/api/api_manager.dart';
import '../../core/model/NewsResponse.dart';
import '../news/news_item.dart';

class NewsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
   return[
     IconButton(onPressed: (){
       showResults(context);
     },
         icon: const Icon(Icons.search,size: 25,))
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
 return IconButton(onPressed: (){
   Navigator.of(context).pop();
 },
     icon: const Icon(Icons.clear,size: 25,));
  }

  @override
  Widget buildResults(BuildContext context) {
   return Container(
     color: Colors.white,
     child: FutureBuilder<NewsResponse>(
       future: ApiManager.getNews(newsKeyword: query),
       builder: (buildContext,snapshot){
         if(snapshot.connectionState==
             ConnectionState.waiting){
           return const Center(child: CircularProgressIndicator(),);
         }
         if(snapshot.hasError){
           return Center(child:
           Text('Error loading..${snapshot.error.toString()}'),
           );
         } if(snapshot.data?.status=='error'){
           return Center(child:
           Text('Server Error${snapshot.data?.message}'),);
         }
         return ListView.builder(itemBuilder: (_,index){
           return NewsItem(snapshot.data!.articles![index]);
         }
           ,itemCount:snapshot.data?.articles?.length ??0,);
       },
     ),
   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   return Container(
       color: Colors.white,
   child: Column(
     crossAxisAlignment: CrossAxisAlignment.stretch,
       mainAxisAlignment: MainAxisAlignment.center,
       children:const [ Center(child: Text('NO Suggestions'))],
   ),
   );
  }
  
}