import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/profile_view_model.dart';

class AddProfileView extends ConsumerStatefulWidget {
  const AddProfileView({super.key});

  @override
  ConsumerState<AddProfileView> createState() => _AddProfileViewState();
}

class _AddProfileViewState extends ConsumerState<AddProfileView> {
  final gap = const SizedBox(height: 8);
  final profileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var profileState = ref.watch(profileViewModelProvider);

    print("ADD JOB VIEW:- ");
    print(profileState.profiles);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            gap,
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Add Profile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            TextFormField(
              controller: profileController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Profile Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter profile';
                }
                return null;
              },
            ),
            gap,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add Profile'),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'List of Profiles',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (profileState.isLoading) ...{
              const Center(child: CircularProgressIndicator()),
            } else if (profileState.error != null) ...{
              Text(profileState.error.toString()),
            } else if (profileState.profiles.isEmpty) ...{
              const Center(child: Text('No Profiles')),
            } else ...{
              const Flexible(child: Text("Profile")),
            }
          ],
        ),
      ),
    );
  }
}
