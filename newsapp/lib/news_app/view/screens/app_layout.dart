import 'package:flutter/material.dart';
import 'package:newsapp/news_app/view/screens/business_news.dart';
import 'package:newsapp/news_app/view/screens/general_news_screen.dart';
import 'package:newsapp/news_app/view/screens/technology_news_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  List<Widget>screens = [
    const GeneralNewsScreen(),
    const BusinessNews(),
    const TechnologyNewsScreen()
  ];
  int curr = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screens[curr] ,
      bottomNavigationBar:BottomNavigationBar(
        selectedLabelStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
        unselectedLabelStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
        currentIndex: curr,
        onTap: (index){
          curr = index;
          setState(() {
          });
        },
        items:[
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: "Category",
          
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: "Business"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_tree),
          label: "Technology"
        )
      ]
      ) ,
    );
  }
}
