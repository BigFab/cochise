import 'package:cochise/common/navigation/router/routes.dart';
import 'package:cochise/features/observation/controller/observations_list_controller.dart';
import 'package:cochise/features/observation/ui/observation_page/delete_observation_dialog.dart';
import 'package:cochise/models/Observation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cochise/common/utils/date_time_formatter.dart';

class SelectedObservationCard extends ConsumerWidget {
  const SelectedObservationCard({
    required this.observation,
    super.key,
  });

  final Observation observation;

  // Future<bool> uploadImage({
  //   required BuildContext context,
  //   required WidgetRef ref,
  //   required Observation observation,
  // }) async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile == null) {
  //     return false;
  //   }
  //   final file = File(pickedFile.path);
  //   if (context.mounted) {
  //     showDialog<String>(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         return const UploadProgressDialog();
  //       },
  //     );

  //     await ref
  //         .watch(observationControllerProvider(observation.id).notifier)
  //         .uploadFile(file, observation);
  //   }

  //   return true;
  // }

  Future<bool> deleteObservation(
    BuildContext context,
    WidgetRef ref,
    Observation observation,
  ) async {
    var value = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return const DeleteObservationDialog();
      },
    );
    value ??= false;

    if (value) {
      await ref.watch(observationsListControllerProvider.notifier).removeObservation(observation);
    }
    return value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              "Date: ${observation.date.getDateTime().format("dd-MM-yyyy")}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14
              ),
            ),
          Text(
              "Heure: ${observation.time.format()}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14
              ),
            ),
          Text(
              "Endroit du corps: ${observation.bodyLocation.name}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14
              ),
            ),
          Text(
              "Notes: ${observation.notes!}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14
              ),
            ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  context.goNamed(
                    AppRoute.editObservation.name,
                    pathParameters: {'id': observation.id},
                    extra: observation,
                  );
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  deleteObservation(context, ref, observation).then((value) {
                    if (value) {
                      context.goNamed(
                        AppRoute.home.name,
                      );
                    }
                  });
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }
}
