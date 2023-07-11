import 'package:flutter/material.dart';
import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/core/model/NewsResponse.dart';
import 'package:news_app/view/news/news_item.dart';

import '../../core/model/News.dart';
import '../../core/model/Source.dart';

class NewsList extends StatefulWidget {
Source source;
  NewsList(this.source);
  List<Articles> newsArticlesList=[];

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final _controller = ScrollController();
  List<Articles> originalNewsList=[];
  bool showedLoadNextPage=false;
  int pageNum=1;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (!isTop) {
          setState(() {
            showedLoadNextPage=true;
          });
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showedLoadNextPage){
      ApiManager.getNews(sourcesId: widget.source.id ?? '',page: ++pageNum).then((value) {
        // originalNewsList.addAll(value.articles??[]);
        // originalNewsList.reversed;
        originalNewsList.insertAll(0, value.articles??[]);
        showedLoadNextPage=false;
        setState(() {

        });
      });
    }
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(sourcesId: widget.source.id ?? ''),
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
          if(originalNewsList.isEmpty){
            originalNewsList.addAll(snapshot.data?.articles ?? []);

          }else if(originalNewsList[0].source != snapshot.data?.articles?[0].source) {
            originalNewsList=snapshot.data?.articles ?? [];
            // _controller.jumpTo(0);
          }

          return ListView.builder(
             controller:_controller,
            itemBuilder: (_,index){
            return NewsItem(originalNewsList[index]);
          }
            ,itemCount:originalNewsList.length,);

        },
      ),

    );
  }
}
