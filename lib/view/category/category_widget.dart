
import 'package:flutter/material.dart';
import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/core/model/SourcesResponse.dart';

import 'category_grid_view.dart';
import 'category_tabs_widget.dart';
class CategoryWidget extends StatelessWidget {
Category category;
CategoryWidget(this.category);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future:ApiManager.getSources(category.categoryId) ,
      builder:(buildContext,snapshot){
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
          return CategoryTabsWidget((snapshot.data?.sources)!);


      } ,
    );
  }
}
