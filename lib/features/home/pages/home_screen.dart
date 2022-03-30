import 'package:app_noticias/features/home/bloc/home_bloc.dart';
import 'package:app_noticias/features/home/bloc/home_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../news_screens/allnews_screen.dart';
import '../../news_screens/business_screen.dart';
import '../../news_screens/health_screen.dart';
import '../../news_screens/sports_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late final HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeBloc>();
    _bloc.getNews();
  }

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 60,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'All news',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Text(
                'Business',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'Sports',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'Health',
                style: TextStyle(color: Colors.black),
              ),
            ],
            onTap: _onTappedItem,
          ),
          title: Image.asset(
            'assets/images/GDK.png',
            height: 55,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: BlocConsumer<HomeBloc, HomeBlocState>(
          bloc: _bloc,
          listener: (_, state) {},
          builder: (context, state) {
            if (state is HomeBlocLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is HomeBlocSuccess) {
              final screens = <Widget>[
                AllNewsScreen(articleList: state.articleList),
                const BusinessScreen(),
                const SportsScreen(),
                const HealthScreen()
              ];
              return screens[_selectedIndex];
            }
            return Container(color: Colors.red);
          },
        ),
      ),
    );
  }
}
