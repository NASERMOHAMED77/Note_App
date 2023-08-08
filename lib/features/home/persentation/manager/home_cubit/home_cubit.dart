import 'package:apinoteapp/constant.dart';
import 'package:apinoteapp/features/home/data/home_repo/home_repo.dart';
import 'package:apinoteapp/features/home/persentation/manager/home_cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(InitHomeState());
  HomeRepo homeRepo;
  List? x;
  getNotes(id) async {
    try {
      x = [];
      emit(GetNotesLoadingState());
      var data = await homeRepo.getNotes(id: id);
      for (var element in data) {
        x!.add(element);
      }
      emit(GetNotesSuccessState());
    } catch (e) {
      emit(GetNotesFailureState(massages: e.toString()));
    }
  }

  addNotes(id, title, content, color) async {
    try {
      emit(UpdateNotesLoadingState());
      homeRepo.addNotes(id: id, title: title, content: content, color: color);
      getNotes(token);
      emit(UpdateNotesSuccessState());
    } catch (e) {
      emit(UpdateNotesFailureState(massages: e.toString()));
    }
  }

  updateNotes(id, title, content) async {
    try {
      emit(UpdateNotesLoadingState());
      homeRepo.updateNotes(id: id, title: title, content: content);
      getNotes(token);
      emit(UpdateNotesSuccessState());
    } catch (e) {
      emit(UpdateNotesFailureState(massages: e.toString()));
    }
  }

  deleteNotes(id) async {
    try {
      emit(UpdateNotesLoadingState());
      homeRepo.deleteNotes(id: id);
      getNotes(token);
      emit(UpdateNotesSuccessState());
    } catch (e) {
      emit(UpdateNotesFailureState(massages: e.toString()));
    }
  }
}
