import 'package:cochise/common/ui/the_navigation_drawer.dart';
import 'package:cochise/common/utils/colors.dart' as constants;
import 'package:cochise/features/profile/controller/profile_controller.dart';
import 'package:cochise/features/profile/ui/profile_page/profile_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileValue = ref.watch(profileControllerProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cochise',
        ),
        backgroundColor: const Color(constants.primaryColorDark),
      ),
      drawer: const TheNavigationDrawer(),
      body: ProfileListView(
        profile: profileValue,
      ),
    );
  }
}