import 'package:bloc/bloc.dart';
import 'package:booking_app/layout/states.dart';
import 'package:booking_app/modules/HomeScreen.dart';
import 'package:booking_app/modules/LibraryScreen.dart';
import 'package:booking_app/modules/ProfileScreen.dart';
import 'package:booking_app/modules/ReadingScreen.dart';
import 'package:booking_app/modules/Setting.dart';
import 'package:booking_app/shared/DioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/api_constant.dart';


class BookingCubit extends Cubit<BookingStates>{
  BookingCubit():super(initialState());
  static BookingCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  static PageController pageController=PageController();
  void changeNav(int index){
    currentIndex=index;
    emit(ChangeNavState());
  }
  bool isDark=false;
  void changeMode(){
    isDark = !isDark;
    emit(ChangeModeState());
  }
  List<Widget> Screen=
  [
    HomeScreen(),
    LibraryScreen(),
    ReadingScreen(),
    ProfileScreen()
  ];
//ttztqJa96psTzSJTBfZGegDKk6PKat0D
  List<dynamic> libraryData = [];
  List<dynamic> downloadData = [];
  // list 1🚀
  // to get data from HardcoverFiction
  List<dynamic> dataHardcoverFiction = [];

  void getDataHardcoverFiction() {
    emit(LayoutGetCurrentHardcoverFictionDataLoadingState());
    DioHelper.GetData(
      url: ApiConstant.HEDER_COVER_FICTION
    ).then((value) {
      dataHardcoverFiction = value.data['results']['books'];
      getLibraryData(dataHardcoverFiction);
      emit(LayoutGetCurrentHardcoverFictionDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutGetCurrentHardcoverFictionDataErrorState());
    });
  }

  // list 2 🎳
  // to get data from HardcoverFiction
  List<dynamic> dataManga = [];
  void getDataManga() {
    emit(LayoutGetCurrentMangaDataLoadingState());
    DioHelper.GetData(
      url: ApiConstant.MANGA
    ).then((value) {
      dataManga = value.data['results']['books'];
      getLibraryData(dataManga);
      emit(LayoutGetCurrentMangaDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutGetCurrentMangaDataErrorState());
    });
  }

  // list 3 💎
  // to get data from HardcoverFiction
  List<dynamic> dataPictureBooks = [];
  void getDataPictureBooks() {
    emit(LayoutGetCurrentPictureBooksDataLoadingState());
    DioHelper.GetData(
      url:ApiConstant.PICKER_BOOK
    ).then((value) {
      dataPictureBooks = value.data['results']['books'];
      getLibraryData(dataPictureBooks);
      emit(LayoutGetCurrentPictureBooksDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutGetCurrentPictureBooksDataErrorState());
    });
  }

  // list 4 🔥
  // to get data from HardcoverFiction
  List<dynamic> dataScience = [];
  void getDataScience() {
    emit(LayoutGetCurrentScienceDataLoadingState());
    DioHelper.GetData(
      url:ApiConstant.SCIENCE
    ).then((value) {
      dataScience = value.data['results']['books'];
      getLibraryData(dataScience);
      emit(LayoutGetCurrentScienceDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutGetCurrentScienceDataErrorState());
    });
  }

  // list 5 🎿
  // to get data from HardcoverFiction
  List<dynamic> dataSports = [];
  void getDataSports() {
    emit(LayoutGetCurrentSportsDataLoadingState());
    DioHelper.GetData(
      url: ApiConstant.SPORT
    ).then((value) {
      dataSports = value.data['results']['books'];
      getLibraryData(dataSports);
      emit(LayoutGetCurrentSportsDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutGetCurrentSportsDataErrorState());
    });
  }

  // for getLibraryData
  void getLibraryData(List data) {
    emit(LayoutGetLibraryDataLoadingState());
    libraryData.insertAll(0, data);
    emit(LayoutGetLibraryDataSuccessState());
  }

  // for download list
  void getDownloadList(Map<String, dynamic> model) {
    emit(LayoutGetDownloadDataLoadingState());
    downloadData = model['buy_links'];
    emit(LayoutGetDownloadDataSuccessState());
  }

  List favorite=[];
  void GetFavorite(dynamic model){
    emit(FavoriteBookLoadingState());
    favorite.add(model);
    emit(FavoriteBookSuccessState());
  }

}