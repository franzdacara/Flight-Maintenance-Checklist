part of 'checklist_bloc.dart';

@immutable
abstract class ChecklistState {}

class ChecklistInitial extends ChecklistState {}

class ChecklistLoaded extends ChecklistState {
  final List<ChecklistItem> items;

  ChecklistLoaded({required this.items});
}
