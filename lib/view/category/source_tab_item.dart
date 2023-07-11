import 'package:flutter/material.dart';
import 'package:news_app/core/model/Source.dart';

class SourceTab extends StatelessWidget {
Source source;
bool isSelected;
SourceTab(this.source,this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected?Theme.of(context).primaryColor:
            Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(width: 3,
          color: Theme.of(context).primaryColor
        )

      ),
      child: Text(source.name??"",
      style: TextStyle(color:
          isSelected? Colors.white:Theme.of(context).primaryColor
      ),
      ),
    );
  }
}
