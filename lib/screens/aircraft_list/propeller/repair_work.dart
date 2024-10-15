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
                  return ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return ChecklistCard(item: item, index: index);
                    },
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
          activeColor: Colors.green,
          checkColor: Colors.white,
          onChanged: (bool? value) {
            BlocProvider.of<ChecklistBloc>(context)
                .add(ToggleChecklistItem(index));
          },
          tileColor: Colors.blueGrey[50],
          contentPadding: const EdgeInsets.all(12.0),
        ),
      ),
    );
  }
}
