import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/states/home_states.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
   HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor: const Color(0xff000236),
          appBar: AppBar(
            title: Text(
              homeCubit.titleScreen[homeCubit.page],
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color(0xff000236),
            leading: Image.asset(
              'asset/images/logo-removebg.png',
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0xff000236),
              statusBarIconBrightness: Brightness.light,
            ),
          ),
          endDrawer: defaultDrawer(context: context, homeCubit: homeCubit),
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: homeCubit.page,
            height: 60.0,
            items:  <Widget>[
              Icon(
                Icons.inventory_sharp,
                size: 30,
                color: homeCubit.page==0 ? Colors.white : Colors.black,
              ),
              Icon(
                Icons.dataset_outlined,
                size: 30,
                color: homeCubit.page==1 ? Colors.white : Colors.black,
              ),
              Icon(
                Icons.dashboard,
                size: 30,
                color: homeCubit.page==2 ? Colors.white : Colors.black,
              ),
              Icon(
                Icons.storage,
                size: 30,
                color: homeCubit.page==3 ? Colors.white : Colors.black,
              ),
              Icon(
                Icons.warehouse,
                size: 30,
                color: homeCubit.page==4 ? Colors.white : Colors.black,
              ),
            ],
            color: Colors.white,
            buttonBackgroundColor: const Color(0xfff7921c),
            backgroundColor: const Color(0xff000236),
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
            onTap: (index) {
              homeCubit.changePageNumber(index);
            },
            letIndexChange: (index) => true,
          ),
          body: homeCubit.screen[homeCubit.page],
        );
      },
    );
  }
}
