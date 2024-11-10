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
    actions: const [
      // TextButton(
      //   onPressed: isNextEnabled
      //       ? () {
      //           GoRouter.of(context).go('/installation');
      //         }
      //       : null,
      //   style: TextButton.styleFrom(
      //     foregroundColor: isNextEnabled ? Colors.white : Colors.grey,
      //   ),
      //   child: const Text(
      //     'Next',
      //     style: TextStyle(
      //       fontSize: 15,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
    ],
  );
}

class RepairWork extends StatefulWidget {
  const RepairWork({super.key});

  @override
  State<RepairWork> createState() => _RepairWorkState();
}

class _RepairWorkState extends State<RepairWork> {
  String _repairType = 'Minor';
  bool isNextEnabled = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChecklistBloc>(context)
        .add(LoadChecklist(minorRepairChecklistItems));
  }

  void _loadChecklist(String repairType) {
    if (repairType == 'Minor') {
      BlocProvider.of<ChecklistBloc>(context)
          .add(LoadChecklist(minorRepairChecklistItems));
    } else if (repairType == 'Major') {
      BlocProvider.of<ChecklistBloc>(context)
          .add(LoadChecklist(majorRepairChecklistItems));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(context, 'Repair Work', isNextEnabled),
      body: Column(
        children: [
          // Repair Type Radio Selection
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Select Repair Type:'),
                Radio<String>(
                  value: 'Minor',
                  groupValue: _repairType,
                  onChanged: (value) {
                    setState(() {
                      _repairType = value!;
                      _loadChecklist(value);
                    });
                  },
                ),
                const Text('Minor'),
                Radio<String>(
                  value: 'Major',
                  groupValue: _repairType,
                  onChanged: (value) {
                    setState(() {
                      _repairType = value!;
                      _loadChecklist(value);
                    });
                  },
                ),
                const Text('Major'),
              ],
            ),
          ),
          // Display Checklist Status
          BlocListener<ChecklistBloc, ChecklistState>(
            listener: (context, state) {
              if (state is ChecklistLoaded) {
                setState(() {
                  if (state.status == 'Complete') {
                    aircrafSteps[2].isComplete = true;
                    isNextEnabled = true; // Enable Next button
                  } else if (state.status == 'Incomplete') {
                    aircrafSteps[2].isComplete = false;
                    isNextEnabled = false; // Disable Next button
                  }
                });
              }
            },
            child: Container(),
          ),
          Expanded(
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
                              return _buildItemWithAnimation(
                                  item, index, state);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(
                    child: Text('No checklist items available'));
              },
            ),
          ),
        ],
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
              // Only show the warning icon if unchecking
              if (uncheck)
                const Icon(
                  Icons.warning_amber_outlined, // Warning icon for unchecking
                  color: Colors.orange, // Amber color for warning
                ),
              const SizedBox(width: 10),
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

  const ChecklistCard({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: ListTile(
        title: Text(
          item.title,
          style: const TextStyle(fontSize: 14),
        ),
        trailing: Checkbox(
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
        tileColor: Colors.blueGrey[100],
        subtitle: Text(
          item.isChecked ? 'Complete' : 'Incomplete',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
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
              // Only show the warning icon if unchecking
              if (uncheck)
                const Icon(
                  Icons.warning_amber_outlined, // Warning icon for unchecking
                  color: Colors.orange, // Amber color for warning
                ),
              const SizedBox(width: 10),
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

