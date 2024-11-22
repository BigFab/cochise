import 'package:cochise/common/ui/bottomsheet_text_form_field.dart';
import 'package:cochise/common/utils/date_time_formatter.dart';
import 'package:cochise/features/observation/controller/observations_list_controller.dart';
import 'package:cochise/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddObservationBottomSheet extends ConsumerStatefulWidget {
  const AddObservationBottomSheet({
    super.key,
  });

  @override
  AddObservationBottomSheetState createState() => AddObservationBottomSheetState();
}

class AddObservationBottomSheetState extends ConsumerState<AddObservationBottomSheet> {
  final formGlobalKey = GlobalKey<FormState>();
  final observationDateController = TextEditingController();
  final notesController = TextEditingController();

  var observationTime = TimeOfDay.now();
  final observationTimeController = TextEditingController();

  var observationLocation = BodyLocation.Intestins;
  final observationLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formGlobalKey,
      child: Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 15,
        ),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("J'ajoute un ressenti"),
            const SizedBox(
              height: 20,
            ),
            BottomSheetTextFormField(
              labelText: 'Date du ressenti',
              controller: observationDateController,
              keyboardType: TextInputType.datetime,
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );

                if (pickedDate != null) {
                  observationDateController.text = pickedDate.format('dd-MM-yyyy');
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BottomSheetTextFormField(
              labelText: 'Heure du ressenti',
              controller: observationTimeController,
              keyboardType: TextInputType.datetime,
              onTap: () async {
                await showTimePicker(
                  context: context,
                  initialTime: observationTime,
                  initialEntryMode: TimePickerEntryMode.dial,
                ).then((timeOfDay) {
                  if (timeOfDay != null) {
                    final localizations =
                        MaterialLocalizations.of(context);
                    final formattedTimeOfDay =
                        localizations.formatTimeOfDay(timeOfDay);

                    observationTimeController.text = formattedTimeOfDay;
                    observationTime = timeOfDay;
                  }
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField<BodyLocation>(
              onChanged: (value) {
                observationLocationController.text = value!.name;
                observationLocation = value;
              },
              value: observationLocation,
              decoration: const InputDecoration(
                labelText: 'Location',
              ),
              items: [
                for (var location in BodyLocation.values)
                  DropdownMenuItem(
                    value: location,
                    child: Text(location.name),
                  ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: notesController,
              maxLines: 3,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Notes"
              )
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () async {
                final currentState = formGlobalKey.currentState;
                if (currentState == null) {
                  return;
                }
                if (currentState.validate()) {
                  await ref.watch(observationsListControllerProvider.notifier).addObservation(
                        date: observationDateController.text,
                        time: observationTime,
                        location: observationLocation,
                        notes: notesController.text,
                      );
                  if (context.mounted) {
                    context.pop();
                  }
                }
              }, //,
            ),
          ],
        ),
      ),
    );
  }
}