import 'package:cochise/common/ui/the_navigation_drawer.dart';
import 'package:cochise/features/observation/controller/observations_list_controller.dart';
import 'package:cochise/features/observation/ui/observations_list/observations_timeline.dart';
import 'package:cochise/common/utils/colors.dart' as constants;
import 'package:cochise/features/observation/ui/observations_list/add_observation_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObservationsListPage extends ConsumerWidget {
  const ObservationsListPage({
    super.key,
  });

  Future<void> showAddObservationDialog(BuildContext context) =>
      showModalBottomSheet<void>(
        isScrollControlled: true,
        elevation: 5,
        context: context,
        builder: (sheetContext) {
          return const AddObservationBottomSheet();
        },
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final observationsListValue = ref.watch(observationsListControllerProvider);
    switch (observationsListValue) {
      case AsyncData(:final value):
        return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text(
                    'Journal de Bord',
                  ),
                  backgroundColor: const Color(constants.primaryColorDark),
                ),
                drawer: const TheNavigationDrawer(),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    showAddObservationDialog(context);
                  },
                  backgroundColor: const Color(constants.primaryColorDark),
                  tooltip: "Ajouter un ressenti",
                  child: const Icon(Icons.add),
                ),
                body: value.isEmpty? const Center(
                  child: Text('Journal de bord vide. Cliquez sur <+>'),
                ) : ObservationsTimeline(observations: value)
              );

      case AsyncError():
        return const Center(
          child: Text('Error'),
        );
      case AsyncLoading():
        return const Center(
          child: CircularProgressIndicator(),
        );

      case _:
        return const Center(
          child: Text('Error'),
        );
    }
  }
}
