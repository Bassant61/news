import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/news_app/model_view/news_cubit/cubit/news_cubit.dart';

class ThemeSwitchBotton extends StatelessWidget {
  const ThemeSwitchBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context); 
        return Switch(value: !cubit.isLightTheme, onChanged: (value) {
          cubit.changeAppTheme();
        });
      },
    );
  }
}
