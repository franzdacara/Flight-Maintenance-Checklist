import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flight_maintenance_app/bloc/checkList/checklist_bloc.dart';
import 'package:go_router/go_router.dart';

AppBar buildCommonAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.blueGrey[400],
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        GoRouter.of(context).go('/');
      },
    ),
  );
}

class Wings extends StatefulWidget {
  const Wings({super.key});

  @override
  State<Wings> createState() => _WingsState();
}

class _WingsState extends State<Wings> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChecklistBloc>(context).add(LoadChecklist());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(context, 'Wings'),
      body: BlocBuilder<ChecklistBloc, ChecklistState>(
        builder: (context, state) {
          if (state is ChecklistInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ChecklistLoaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return CheckboxListTile(
                  title: Text(item.title),
                  value: item.isChecked,
                  onChanged: (value) {
                    BlocProvider.of<ChecklistBloc>(context)
                        .add(ToggleChecklistItem(index));
                  },
                );
              },
            );
          }
          return const Center(child: Text('No checklist items available'));
        },
      ),
    );
  }
}
