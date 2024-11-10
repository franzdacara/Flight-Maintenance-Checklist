import 'package:flight_maintenance_app/models/checklist_item.dart';
import 'package:flight_maintenance_app/utils/aircraftlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flight_maintenance_app/bloc/checkList/checklist_bloc.dart';

AppBar buildCommonAppBar(
    BuildContext context, String title, bool isNextEnabled) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.blueGrey[400],
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () {
        GoRouter.of(context).go('/propeller');
      },
    ),
    actions: [
      TextButton(
        onPressed: isNextEnabled
            ? () {
                GoRouter.of(context)
                    .go('/propeller'); // Navigate to next screen
              }
            : null,
        style: TextButton.styleFrom(
          foregroundColor: isNextEnabled ? Colors.white : Colors.grey,
        ),
        child: const Text(
          'Done',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

class Installation extends StatefulWidget {
  const Installation({super.key});

  @override
  State<Installation> createState() => _InstallationState();
}

class _InstallationState extends State<Installation> {
  bool isNextEnabled = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChecklistBloc>(context)
        .add(LoadChecklist(installationChecklistItems));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(context, 'Installation', isNextEnabled),
      body: BlocListener<ChecklistBloc, ChecklistState>(
        listener: (context, state) {
          if (state is ChecklistLoaded) {
            setState(() {
              // Update the `isNextEnabled` flag based on the checklist status
              if (state.status == 'Complete') {
                aircrafSteps[3].isComplete = true;
                isNextEnabled = true; // Enable Next button
              } else if (state.status == 'Incomplete') {
                aircrafSteps[3].isComplete = false;
                isNextEnabled = false; // Disable Next button
              }
            });
          }
        },
        child: BlocBuilder<ChecklistBloc, ChecklistState>(
          builder: (context, state) {
            if (state is ChecklistInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ChecklistLoaded) {
              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return _buildItemWithAnimation(item, index, state);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: Text('No checklist items available'));
          },
        ),
      ),
    );
  }

  Widget _buildItemWithAnimation(
      ChecklistItem item, int index, ChecklistLoaded state) {
    if (index <= state.lastCheckedIndex ||
        index == state.lastCheckedIndex + 1) {
      return _buildItemWithTransitions(item, index, state);
    }
    return const SizedBox.shrink();
  }

  Widget _buildItemWithTransitions(
      ChecklistItem item, int index, ChecklistLoaded state) {
    return FadeTransition(
      opacity: const AlwaysStoppedAnimation(1.0),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: const AlwaysStoppedAnimation(1.0),
          curve: Curves.easeInOut,
        )),
        child: GestureDetector(
          onTap: () async {
            // Show confirmation dialog before toggling
            bool? confirmed = await _showConfirmationDialog(
              context,
              uncheck: item.isChecked,
            );
            // Only proceed with the toggle if the user confirms
            if (confirmed ?? false) {
              BlocProvider.of<ChecklistBloc>(context)
                  .add(ToggleChecklistItem(index));
            }
          },
          child: ChecklistCard(item: item, index: index),
        ),
      ),
    );
  }

  Future<bool?> _showConfirmationDialog(BuildContext context,
      {bool uncheck = false}) {
    if (uncheck) {
      // Show SnackBar immediately when unchecking
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('The action cannot be done.'),
          duration: Duration(seconds: 2),
        ),
      );
      return Future.value(
          false); // Returning false since the action is not performed
    }

    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(uncheck ? 'Uncheck Item' : 'Check Item'),
          content: Row(
            children: [
              if (uncheck) ...[
                // Only show the warning icon when unchecking
                const Icon(
                  Icons.warning_amber_outlined, // Warning icon for unchecking
                  color: Colors.orange, // Amber color for warning
                ),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Text(
                  uncheck
                      ? 'The action cannot be done.' // Message for unchecking
                      : 'Are you sure you want to check this item?', // Normal message for checking
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel the action
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirm the action
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}

class ChecklistCard extends StatelessWidget {
  final ChecklistItem item;
  final int index;

  const ChecklistCard({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: CheckboxListTile(
          title: Text(
            item.title,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          value: item.isChecked,
          onChanged: (value) {
            // Show confirmation dialog before toggling
            if (value != item.isChecked) {
              _showConfirmationDialog(
                context,
                uncheck: item.isChecked,
              ).then((confirmed) {
                // Only proceed with the toggle if the user confirms
                if (confirmed ?? false) {
                  // ignore: use_build_context_synchronously
                  BlocProvider.of<ChecklistBloc>(context)
                      .add(ToggleChecklistItem(index));
                }
              });
            }
          },
        ),
      ),
    );
  }

  Future<bool?> _showConfirmationDialog(BuildContext context,
      {bool uncheck = false}) {
    if (uncheck) {
      // Show SnackBar immediately when unchecking
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('The action cannot be done.'),
          duration: Duration(seconds: 2),
        ),
      );
      return Future.value(
          false); // Returning false since the action is not performed
    }

    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(uncheck ? 'Uncheck Item' : 'Check Item'),
          content: Row(
            children: [
              if (uncheck) ...[
                // Only show the warning icon when unchecking
                const Icon(
                  Icons.warning_amber_outlined, // Warning icon for unchecking
                  color: Colors.orange, // Amber color for warning
                ),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Text(
                  uncheck
                      ? 'The action cannot be done.' // Message for unchecking
                      : 'Are you sure you want to check this item?', // Normal message for checking
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel the action
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirm the action
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}
