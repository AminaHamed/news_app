import 'package:flutter/material.dart';
import 'package:news_app/core/model/News.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/view/details_screen/details_screen.dart';

class NewsItem extends StatelessWidget {
Articles news;
NewsItem(this.news);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          ()=>Navigator.of(context).
          pushNamed(NewsDetailsScreen.routName,arguments: news),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius:
              BorderRadius.circular(20),
                child:
                CachedNetworkImage(
                  imageUrl: news.urlToImage??'',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),

            ),  Text(news.title??'',style: const TextStyle(
                color: Colors.black,fontSize: 22
            ),),
            Text(news.author??'',style: const TextStyle(
              color: Colors.black,fontSize: 18
            ),),

            Text(news.publishedAt??'',textAlign: TextAlign.end,),


          ],
        ),

      ),
    );
  }
}
