import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/states/home_states.dart';
import 'package:masmix/views/invoices_screen/invoices_screen.dart';
import 'package:masmix/views/my_packages_screen/my_packages_screen.dart';
import 'package:masmix/views/my_quotation_screen/my_quotation_screen.dart';
import 'package:masmix/views/my_storage_screen/my_storage_screen.dart';
import 'package:masmix/views/services_screen/services_screen.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  int page = 2;
  List<Widget> screen = [
    const InvoicesScreen(),
    const MyQuotationScreen(),
    const ServicesScreen(),
    const MyPackagesScreen(),
    const MyStorageScreen(),
  ];
  List<String> titleScreen = [
    'Invoices',
    'My Quotation',
    'Services',
    'My Packages',
    'My Storage',
  ];
  void changePageNumber(int index){
    page = index;
    emit(ChangePageNumberState());
  }
}
