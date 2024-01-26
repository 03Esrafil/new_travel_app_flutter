

import 'package:equatable/equatable.dart';

import '../Models/models.dart';

abstract class CubitState extends Equatable{

}
class InitialState extends CubitState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class WelcomeState extends CubitState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class LoadinState extends CubitState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class LoadedState extends CubitState{
  LoadedState(this.places);
  final List<Recipimodels> places;
  @override
  // TODO: implement props
  List<Object?> get props => [places];

}
class DetailState extends CubitState{
  DetailState(this.place);
  final Recipimodels place;
  @override
  // TODO: implement props
  List<Object?> get props => [place];

}