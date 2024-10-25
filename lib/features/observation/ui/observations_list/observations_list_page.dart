import 'package:flutter/material.dart';
import 'package:cochise/common/utils/colors.dart' as constants;

class ObservationsListPage extends StatelessWidget {
  const ObservationsListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cochise',
        ),
        backgroundColor: const Color(constants.primaryColorDark),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(constants.primaryColorDark),
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text('Observations List'),
      ),
    );
  }
}
