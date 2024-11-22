import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:cochise/models/ModelProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final observationsAPIServiceProvider = Provider<ObservationsAPIService>((ref) {
  final service = ObservationsAPIService();
  return service;
});

class ObservationsAPIService {
  ObservationsAPIService();

  Future<List<Observation>> getObservations() async {
    try {
      final request = ModelQueries.list(Observation.classType);
      final response = await Amplify.API.query(request: request).response;

      final observations = response.data?.items;
      if (observations == null) {
        safePrint('getObservations errors: ${response.errors}');
        return const [];
      }
      observations.sort((a, b) =>
              "${a!.date}${a!.time}".compareTo("${b!.date}${b!.time}"));
      return observations
          .map((e) => e as Observation)
          .toList();
    } on Exception catch (error) {
      safePrint('getObservations failed: $error');

      return const [];
    }
  }

  Future<List<Observation>> getPastObservations() async {
    try {
      final request = ModelQueries.list(Observation.classType);
      final response = await Amplify.API.query(request: request).response;

      final observations = response.data?.items;
      if (observations == null) {
        safePrint('getPastObservations errors: ${response.errors}');
        return const [];
      }
      observations.sort(
        (a, b) =>
            a!.date.compareTo(b!.date),
      );
      return observations
          .map((e) => e as Observation)
          .where(
            (element) => element.date.getDateTime().isBefore(DateTime.now()),
          )
          .toList();
    } on Exception catch (error) {
      safePrint('getPastObservations failed: $error');

      return const [];
    }
  }

  Future<void> addObservation(Observation observation) async {
    try {
      final request = ModelMutations.create(observation);
      final response = await Amplify.API.mutate(request: request).response;

      final createdObservation = response.data;
      if (createdObservation == null) {
        safePrint('addObservation errors: ${response.errors}');
        return;
      }
    } on Exception catch (error) {
      safePrint('addObservation failed: $error');
    }
  }

  Future<void> deleteObservation(Observation observation) async {
    try {
      await Amplify.API
          .mutate(
            request: ModelMutations.delete(observation),
          )
          .response;
    } on Exception catch (error) {
      safePrint('deleteObservation failed: $error');
    }
  }

  Future<void> updateObservation(Observation updatedObservation) async {
    try {
      await Amplify.API
          .mutate(
            request: ModelMutations.update(updatedObservation),
          )
          .response;
    } on Exception catch (error) {
      safePrint('updateObservation failed: $error');
    }
  }

  Future<Observation> getObservation(String observationId) async {
    try {
      final request = ModelQueries.get(
        Observation.classType,
        ObservationModelIdentifier(id: observationId),
      );
      final response = await Amplify.API.query(request: request).response;

      final observation = response.data!;
      return observation;
    } on Exception catch (error) {
      safePrint('getObservation failed: $error');
      rethrow;
    }
  }
}
