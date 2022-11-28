import 'package:flutter/material.dart';
import '../model/news.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key, required this.newsItem}) : super(key: key);

  final News newsItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 2),
                  child: Text(
                    newsItem.headline,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(16, 2, 16, 8),
                    child: Text(newsItem.date.toString()))
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(newsItem.image), fit: BoxFit.fitHeight),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          ],
        ),
        const Divider(height: 2, thickness: 2)
      ]),
    );
  }
}
