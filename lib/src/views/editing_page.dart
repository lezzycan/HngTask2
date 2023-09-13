import 'package:flutter/material.dart';
import 'package:hng_task2/src/widget/app_textfield.dart';

class EditingPage extends StatefulWidget {
  const EditingPage({super.key, required this.initialData});
  final Map<String, String?> initialData;

  @override
  State<EditingPage> createState() => _EditingPageState();
}

class _EditingPageState extends State<EditingPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController summaryController = TextEditingController();

  final TextEditingController pExController = TextEditingController();

  final TextEditingController addSkillsController = TextEditingController();

  final TextEditingController actController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    summaryController.dispose();
    pExController.dispose();
    addSkillsController.dispose();
    actController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> labelText = [
      'Name',
      'Summary',
      'Professional Experience',
      'Add Skills',
      'Activities'
    ];
    List<TextEditingController> controllers = [
      nameController,
      summaryController,
      pExController,
      addSkillsController,
      actController
    ];
    void saveEdited() {
      Map<String, String?> updatedData = {};

      if (nameController.text.isNotEmpty) {
        updatedData['data1'] = nameController.text;
      }

      if (summaryController.text.isNotEmpty) {
        updatedData['data2'] = summaryController.text;
      }
      if (pExController.text.isNotEmpty) {
        updatedData['data3'] = pExController.text;
      }
      if (addSkillsController.text.isNotEmpty) {
        updatedData['data4'] = addSkillsController.text;
      }
      if (actController.text.isNotEmpty) {
        updatedData['data5'] = actController.text;
      }

      Navigator.pop(context, updatedData);
    }

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context), child: const Icon(Icons.west)),
        title: const Text(
          'Edit your Cv',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        actions: [
          TextButton(
            onPressed: () {
              saveEdited();
            },
            child: const Text('Save'),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return AppTextField(
                  labelText: labelText[index],
                  controller: controllers[index],
                  maxLines: labelText[index] == 'Name' ? 1 : 6,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: labelText.length)),
    );
  }
}
