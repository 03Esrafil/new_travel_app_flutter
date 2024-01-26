


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_travel_app_flutter/cubit/app_cubit_state.dart';

import '../Models/models.dart';
import '../services/app_services.dart';

class AppCubit extends Cubit<CubitState> {

  AppCubit({required this.data}): super(InitialState()){
    emit(WelcomeState());
  }
  final dataServices data;
  late final places;
  Future<void> getData() async {
    try{
     emit(LoadinState());
     places =await data.getRecipe();
     emit(LoadedState(places));
    }catch(e){

    }
  }
  detailsPage(Recipimodels data){
    emit(DetailState(data));

  }
  goHome(){
    emit(LoadedState(places));
  }

}