import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flight_maintenance_app/models/checklist_item.dart';

part 'checklist_event.dart';
part 'checklist_state.dart';

class ChecklistBloc extends Bloc<ChecklistEvent, ChecklistState> {
  List<ChecklistItem> items = [];
  int lastCheckedIndex = -1; // Track the last checked index
  Set<int> checkedItems = {}; // Track checked items that cannot be unchecked

  ChecklistBloc() : super(ChecklistInitial()) {
    on<LoadChecklist>((event, emit) {
      items = event.items;
      String status = getChecklistStatus();
      emit(ChecklistLoaded(
          items: items, status: status, lastCheckedIndex: lastCheckedIndex));
    });

    on<ToggleChecklistItem>((event, emit) {
      // Prevent unchecking if the item was previously checked
      if (checkedItems.contains(event.index) && items[event.index].isChecked) {
        // Display a message or update state to inform the user
        return;
      }

      items[event.index].isChecked = !items[event.index].isChecked;
      if (items[event.index].isChecked) {
        lastCheckedIndex =
            event.index; // Update last checked index when the item is checked
        checkedItems.add(event.index); // Mark this item as checked
      } else {
        checkedItems
            .remove(event.index); // Allow unchecking if not previously checked
      }
      String status = getChecklistStatus();
      emit(ChecklistLoaded(
          items: List.from(items),
          status: status,
          lastCheckedIndex: lastCheckedIndex));
    });

    on<ResetChecklist>((event, emit) {
      for (var item in items) {
        item.isChecked = false;
      }
      checkedItems.clear();
      lastCheckedIndex = -1; // Reset the last checked index
      String status = getChecklistStatus();
      emit(ChecklistLoaded(
          items: List.from(items),
          status: status,
          lastCheckedIndex: lastCheckedIndex));
    });
  }

  String getChecklistStatus() {
    bool allChecked = items.every((item) => item.isChecked);
    return allChecked ? 'Complete' : 'Incomplete';
  }
}




