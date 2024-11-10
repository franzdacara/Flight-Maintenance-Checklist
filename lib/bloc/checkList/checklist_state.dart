part of 'checklist_bloc.dart';

@immutable
abstract class ChecklistState {}

class ChecklistInitial extends ChecklistState {}

class ChecklistLoaded extends ChecklistState {
  final List<ChecklistItem> items;
  final String status;
  final int lastCheckedIndex;

  ChecklistLoaded({
    required this.items,
    required this.status,
    required this.lastCheckedIndex,
  });
}



