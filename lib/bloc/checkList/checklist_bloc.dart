// lib/bloc/checkList/checklist_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flight_maintenance_app/models/checklist_item.dart';

part 'checklist_event.dart';
part 'checklist_state.dart';

class ChecklistBloc extends Bloc<ChecklistEvent, ChecklistState> {
  // Default empty list, can be overridden with specific checklist data
  List<ChecklistItem> items = [];

  ChecklistBloc() : super(ChecklistInitial()) {
    on<LoadChecklist>((event, emit) {
      items = event.items;
      emit(ChecklistLoaded(items: items));
    });

    on<ToggleChecklistItem>((event, emit) {
      items[event.index].isChecked = !items[event.index].isChecked;
      emit(ChecklistLoaded(items: List.from(items))); // Emit updated state
    });
  }
}
