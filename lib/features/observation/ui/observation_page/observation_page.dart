import 'package:cochise/common/ui/the_navigation_drawer.dart';
import 'package:cochise/common/navigation/router/routes.dart';
import 'package:cochise/common/utils/colors.dart' as constants;
import 'package:cochise/features/observation/controller/observation_controller.dart';
import 'package:cochise/features/observation/ui/observation_page/observation_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ObservationPage extends ConsumerWidget {
  const ObservationPage({
    required this.observationId,
    super.key,
  });
  final String observationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final observationValue = ref.watch(observationControllerProvider(observationId));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cochise',
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(
                AppRoute.home.name,
              );
            },
            icon: const Icon(Icons.home),
          ),
        ],
        backgroundColor: const Color(constants.primaryColorDark),
      ),
      drawer: const TheNavigationDrawer(),
      body: ObservationDetails(
        observationId: observationId,
        observation: observationValue,
      ),

    );
  }
}
