abstract class HomeState {}

class GetNotesSuccessState extends HomeState {}
class InitHomeState extends HomeState {}

class GetNotesFailureState extends HomeState {
  GetNotesFailureState({required this.massages});
  final String massages;
}

class GetNotesLoadingState extends HomeState {}

class UpdateNotesSuccessState extends HomeState {}

class UpdateNotesFailureState extends HomeState {
  UpdateNotesFailureState({required this.massages});
  final String massages;
}

class UpdateNotesLoadingState extends HomeState {}

class DeleteNotesSuccessState extends HomeState {}

class DeleteNotesFailureState extends HomeState {
  DeleteNotesFailureState({required this.massages});
  final String massages;
}

class DeleteNotesLoadingState extends HomeState {}
