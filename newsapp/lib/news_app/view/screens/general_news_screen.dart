import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/news_app/model_view/news_cubit/cubit/news_cubit.dart';
import 'package:newsapp/news_app/view/widgets/news_item.dart';
import 'package:newsapp/news_app/view/widgets/news_shimmer_widget.dart';
import 'package:newsapp/news_app/view/widgets/theme_switch_botton.dart';


class GeneralNewsScreen extends StatefulWidget {
  const GeneralNewsScreen({super.key});

  @override
  State<GeneralNewsScreen> createState() => _GeneralNewsScreenState();
}

class _GeneralNewsScreenState extends State<GeneralNewsScreen> {
  @override
  void initState() {
    if(NewsCubit.get(context).genealNewsList.isEmpty){
      NewsCubit.get(context).getGeneralNews();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("General News"),
        actions: [
          ThemeSwitchBotton()
        ],
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          var cubit = NewsCubit.get(context); 
          return state is GetGeneralNewsLoading? Center(child: NewsShimmerWidget()): ListView.separated(
              itemBuilder: (context, index) {
                return NewsItem(
                  newsArticleModel: cubit.genealNewsList[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 16,
                );
              },
              itemCount: cubit.genealNewsList.length);
        },
      ),
    );
  }
}
