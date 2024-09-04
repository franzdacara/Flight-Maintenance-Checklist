part of 'checklist_bloc.dart';

@immutable
abstract class ChecklistEvent {}

class LoadChecklist extends ChecklistEvent {}

class ToggleChecklistItem extends ChecklistEvent {
  final int index;

  ToggleChecklistItem(this.index);
}
