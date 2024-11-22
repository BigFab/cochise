import 'package:cochise/features/observation/controller/observation_controller.dart';
import 'package:cochise/models/ModelProvider.dart';
import 'package:cochise/features/observation/ui/observation_page/selected_observation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObservationDetails extends ConsumerWidget {
  const ObservationDetails({
    required this.observation,
    required this.observationId,
    super.key,
  });

  final AsyncValue<Observation> observation;
  final String observationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (observation) {
      case AsyncData(:final value):
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 8,
            ),
            SelectedObservationCard(observation: value),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
          ]
        );

      case AsyncError():
        return Center(
          child: Column(
            children: [
              const Text('Error'),
              TextButton(
                onPressed: () async {
                  ref.invalidate(observationControllerProvider(observationId));
                },
                child: const Text('Try again'),
              ),
            ],
          ),
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
