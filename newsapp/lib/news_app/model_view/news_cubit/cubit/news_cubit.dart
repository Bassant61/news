import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/news_app/model/data_source/remote_data_source/news_remote_data_source.dart';
import 'package:newsapp/news_app/model/models/news_artical_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  final NewsRemoteDataSource newsRemoteDataSource = NewsRemoteDataSource();
  static NewsCubit get(context)=>BlocProvider.of(context);
  List<NewsArticalModel>genealNewsList = [];
  List<NewsArticalModel>businessNewsList = [];
  List<NewsArticalModel>technologyNewsList = [];
  bool isLightTheme = true;
  void getGeneralNews()async{
    emit(GetGeneralNewsLoading());
    try{
      final response = await newsRemoteDataSource.getNews(category: "general");
      genealNewsList = response;
      emit(GetGeneralNewsSuccess());
    }
    catch(error){
      emit(GetGeneralNewsError());
    }
  }

  void getBusinessNews()async{
    emit(GetBusinessNewsLoading());
    try{
      final response = await newsRemoteDataSource.getNews(category: "business");
      businessNewsList = response;
      emit(GetBusinessNewsSuccess());
    }
    catch(error){
      emit(GetBusinessNewsError());
    }
  }

  void getTechnologyNews()async{
    emit(GetTechnologyNewsLoading());
    try{
      final response = await newsRemoteDataSource.getNews(category: "technology");
      technologyNewsList = response;
      emit(GetTechnologyNewsSuccess());
    }
    catch(error){
      emit(GetTechnologyNewsError());
    }
  }
  void changeAppTheme() {
    isLightTheme = !isLightTheme;
    emit(AppThemeChanged(isLightTheme: isLightTheme));
  }
}
