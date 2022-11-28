import 'package:flutter/material.dart';
import 'package:pokedex/model/news.dart';
import '../../widgets/titleWidget.dart';
import '../../widgets/searchBar.dart';
import '../../widgets/menuList.dart';
import '../../widgets/newsItem.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<News> newsList = [
      News(
          headline: "Pokemon Rumble Rush Arrives Soon",
          date: DateTime(2020, 5, 4),
          image: "assets/pokemon-rush.jpg"),
      News(
          headline: "Detective Pikachu Takes America by Storm",
          date: DateTime.now(),
          image: "assets/detective-pikachu.jpg"),
    ];

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
            child: AppBar()),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                  color: Theme.of(context).backgroundColor,
                ),
                child: Column(
                  children: [
                    TitleWidget(
                      title: "What Pokemon are you looking for?",
                    ),
                    SearchBar(
                      icon: Icon(
                        Icons.search_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                      placeholder: "Search Pokemon, Move, Ability etc",
                    ),
                    MenuList(),
                    //News
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pokemon News",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            "View all",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView.builder(
                          itemCount: newsList.length,
                          itemBuilder: (context, index) {
                            return NewsItem(newsItem: newsList[index]);
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
