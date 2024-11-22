import 'package:cochise/features/observation/service/observations_api_service.dart';
import 'package:cochise/models/Observation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final observationsRepositoryProvider = Provider<ObservationsRepository>((ref) {
  final observationsAPIService = ref.read(observationsAPIServiceProvider);
  return ObservationsRepository(observationsAPIService);
});

class ObservationsRepository {
  ObservationsRepository(this.observationsAPIService);

  final ObservationsAPIService observationsAPIService;

  Future<List<Observation>> getObservations() {
    return observationsAPIService.getObservations();
  }

  Future<List<Observation>> getPastObservations() {
    return observationsAPIService.getPastObservations();
  }

  Future<void> add(Observation observation) async {
    return observationsAPIService.addObservation(observation);
  }

  Future<void> update(Observation updatedObservation) async {
    return observationsAPIService.updateObservation(updatedObservation);
  }

  Future<void> delete(Observation deletedObservation) async {
    return observationsAPIService.deleteObservation(deletedObservation);
  }

  Future<Observation> getObservation(String observationId) async {
    return observationsAPIService.getObservation(observationId);
  }
}
