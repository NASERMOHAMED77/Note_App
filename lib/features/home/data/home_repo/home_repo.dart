abstract class HomeRepo {
  void addNotes(
      {required String id,
      required String title,
      required String color,
      required String content});
  void updateNotes(
      {required String id, required String title, required String content});
  void deleteNotes({required String id});
  getNotes({required String id});
}
