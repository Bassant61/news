import 'dart:math';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/news_app/core/cach_helper/blok_observer.dart';
import 'package:newsapp/news_app/core/cach_helper/cach_helper.dart';
import 'package:newsapp/news_app/core/cach_helper/localdbhelper.dart';
import 'package:newsapp/news_app/core/network/dio_helper.dart';
import 'package:newsapp/news_app/core/theme/app_theme.dart';
import 'package:newsapp/news_app/model_view/news_cubit/cubit/news_cubit.dart';
import 'package:newsapp/news_app/view/screens/app_layout.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.initSharedPref();
  DioHelper.initDio();
  runApp(my_App());
}

class my_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          // BlocProvider(
          //   create: (context) => TaskCubit()..initdb(),
          // ),
          BlocProvider(
            create: (context) => NewsCubit()..getTechnologyNews()..getBusinessNews()..getGeneralNews,
          ),
        ],
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return MaterialApp(
              home: AppLayout(),
              debugShowCheckedModeBanner: false,
              theme: AppTheme.getLightTheme(),
              darkTheme: AppTheme.getDarkTheme(),
              themeMode: cubit.isLightTheme?ThemeMode.light:ThemeMode.dark,
            );
          },
        ));
  }
}

class _tstlocalDatabasState extends StatefulWidget {
  const _tstlocalDatabasState({super.key});

  @override
  State<_tstlocalDatabasState> createState() => __tstlocalDatabasStateState();
}

class __tstlocalDatabasStateState extends State<_tstlocalDatabasState> {
  late Database database;
  LocalDatabaseHelper localDatabaseHelper = LocalDatabaseHelper();
  init() async {
    await localDatabaseHelper.initDatabase(databasePathName: "mydb");
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await localDatabaseHelper.insertToDatabase(
                    values: {"di": 1, "name": "Bassant"}, tableName: "task");
              },
              child: const Text('Add to database'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () async {},
              child: const Text('Update database'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () async {},
              child: const Text('Delete from database'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                print(await localDatabaseHelper.retrieveData(
                    tableName: "task", where: ''));
              },
              child: const Text('Get from the database then print'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await localDatabaseHelper.execute(
                    query:
                        "CREATE TABLE task(id INTEGER PRIMARY KEY,name TEXT)");
              },
              child: const Text('Add tasks table'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
