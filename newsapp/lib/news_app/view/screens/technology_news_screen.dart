import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/news_app/model_view/news_cubit/cubit/news_cubit.dart';
import 'package:newsapp/news_app/view/widgets/news_item.dart';
import 'package:newsapp/news_app/view/widgets/news_shimmer_widget.dart';
import 'package:newsapp/news_app/view/widgets/theme_switch_botton.dart';

class TechnologyNewsScreen extends StatefulWidget {
  const TechnologyNewsScreen({super.key});

  @override
  State<TechnologyNewsScreen> createState() => _TechnologyNewsScreenState();
}

class _TechnologyNewsScreenState extends State<TechnologyNewsScreen> {
  void initState() {
    if(NewsCubit.get(context).technologyNewsList.isEmpty){
      NewsCubit.get(context).getTechnologyNews();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Technology News"),
        actions: [
          ThemeSwitchBotton()
        ],
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return state is GetTechnologyNewsLoading? Center(child: NewsShimmerWidget()): ListView.separated(
              itemBuilder: (context, index) {
                return NewsItem(newsArticleModel: cubit.technologyNewsList[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 16,
                );
              },
              itemCount: cubit.technologyNewsList.length);
        },
      ),
    );
  }
}
