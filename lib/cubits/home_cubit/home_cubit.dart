import 'package:bloc/bloc.dart';
import 'package:e_commerc/cubits/home_cubit/home_states.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates>{
  HomeScreenCubit() : super(InitialHomeScreenState());
int CurrentIndexFromButtomNav = 0 ;

ChangeIndex(index){
  CurrentIndexFromButtomNav= index;
  emit(IndexChangedState as HomeScreenStates);
}



}