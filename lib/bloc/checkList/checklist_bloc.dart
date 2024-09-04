import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'checklist_event.dart';
part 'checklist_state.dart';

class ChecklistBloc extends Bloc<ChecklistEvent, ChecklistState> {
  List<ChecklistItem> items = [
    ChecklistItem(title: 'Pre-Flight Inspection', isChecked: false),
    ChecklistItem(title: 'Engine Start', isChecked: false),
    ChecklistItem(title: 'Taxi', isChecked: false),
    ChecklistItem(title: 'Takeoff', isChecked: false),
    // Add more checklist items as needed
  ];

  ChecklistBloc() : super(ChecklistInitial()) {
    on<LoadChecklist>((event, emit) {
      emit(ChecklistLoaded(items: items));
    });

    on<ToggleChecklistItem>((event, emit) {
      items[event.index].isChecked = !items[event.index].isChecked;
      emit(ChecklistLoaded(items: List.from(items))); // Emit updated state
    });
  }
}

class ChecklistItem {
  final String title;
  bool isChecked;

  ChecklistItem({required this.title, this.isChecked = false});
}
