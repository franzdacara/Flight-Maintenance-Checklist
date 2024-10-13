import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flight_maintenance_app/models/checklist_item.dart';

part 'checklist_event.dart';
part 'checklist_state.dart';
class ChecklistBloc extends Bloc<ChecklistEvent, ChecklistState> {
  List<ChecklistItem> items = [];

  ChecklistBloc() : super(ChecklistInitial()) {
    on<LoadChecklist>((event, emit) {
      items = event.items;
      String status = getChecklistStatus();
      emit(ChecklistLoaded(items: items, status: status));
    });

    on<ToggleChecklistItem>((event, emit) {
      items[event.index].isChecked = !items[event.index].isChecked;
      String status = getChecklistStatus();
      emit(ChecklistLoaded(items: List.from(items), status: status));
    });

    on<ResetChecklist>((event, emit) {
      for (var item in items) {
        item.isChecked = false;
      }
      String status = getChecklistStatus();
      emit(ChecklistLoaded(items: List.from(items), status: status));
    });
  }

  String getChecklistStatus() {
    bool allChecked = items.every((item) => item.isChecked);
    return allChecked ? 'Complete' : 'Incomplete';
  }
}
