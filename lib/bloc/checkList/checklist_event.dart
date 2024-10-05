part of 'checklist_bloc.dart';

@immutable
abstract class ChecklistEvent {}

class LoadChecklist extends ChecklistEvent {
  final List<ChecklistItem> items;

  LoadChecklist(this.items);
}

class ToggleChecklistItem extends ChecklistEvent {
  final int index;

  ToggleChecklistItem(this.index);
}
