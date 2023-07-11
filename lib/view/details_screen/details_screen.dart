import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/model/News.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
static const String routName='NewsDetailsScreen';


  @override
  Widget build(BuildContext context) {
    var news=ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/pattern.png'),
            )
        ),
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

            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    Text(news.description ??''),
                    Spacer(),
                    TextButton.icon(onPressed:
                        (){
                      openUrl(news.url);
                        },
                        label:Icon(Icons.arrow_forward_ios),
                      icon:  Text('View Full Article'),

                    )
                  ],
                ),
              ),
            )


          ],
        ),

      ),
    );
  }

  Future<void> openUrl(String? url) async {
    if(url==null) return;
    var uri=Uri.parse(url);
  if( await canLaunchUrl(uri)){
     await launchUrl(uri);
  }
  }//function

}
