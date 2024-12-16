import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/news_app/model_view/news_cubit/cubit/news_cubit.dart';
import 'package:newsapp/news_app/view/widgets/news_item.dart';
import 'package:newsapp/news_app/view/widgets/news_shimmer_widget.dart';
import 'package:newsapp/news_app/view/widgets/theme_switch_botton.dart';

class BusinessNews extends StatefulWidget {
  const BusinessNews({super.key});

  @override
  State<BusinessNews> createState() => _BusinessNewsState();
}

class _BusinessNewsState extends State<BusinessNews> {
  void initState() {
    if(NewsCubit.get(context).businessNewsList.isEmpty){
      NewsCubit.get(context).getBusinessNews();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business News"),
        actions: [
          ThemeSwitchBotton()
        ],
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
            return state is GetBusinessNewsLoading? Center(child: NewsShimmerWidget()):ListView.separated(
              itemBuilder: (context, index) {
                return NewsItem(newsArticleModel: cubit.businessNewsList[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 16,
                );
              },
              itemCount: cubit.businessNewsList.length);
        },
      ),
    );
  }
}
