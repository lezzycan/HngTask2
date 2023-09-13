import 'package:flutter/material.dart';
import 'package:hng_task2/src/constants/const.dart';
import 'package:hng_task2/src/views/editing_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name;
  String? sum;
  String? summary;
  String? pExp1;
  String? addSkills;
  String? activities;
  String? edu;
  void navigateToEditingPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditingPage(
          initialData: {
            'data1': name,
            'data2': sum,
            'data3': pExp1,
            'data4': addSkills,
            'data5': activities,
            'data6': edu,
          },
        ),
      ),
    );

    if (result != null) {
      setState(() {
        name = result['data1'] ?? name;
        summary = result['data2'] ?? sum;
        pExp1 = result['data3'] ?? pExp1;
        addSkills = result['data4'] ?? addSkills;
        activities = result['data5'] ?? activities;
        edu = result['data6'] ?? edu;
      });
    }
  }

  @override
  void initState() {
    //  HomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        //  automaticallyImplyLeading: false,
        backgroundColor: AppConstants.appBarTitleColor,
        title: Text(
          'Cv',
          style: AppConstants.getStyle(14, Colors.white),
        ),
        actions: [
          TextButton(
              onPressed: () {
                navigateToEditingPage();
              },
              child: Text(
                'Edit',
                style: AppConstants.getStyle(14, AppConstants.buttonColor),
              ))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          AppText(
            name: name,
            align: TextAlign.center,
            fontWeight: FontWeight.w600,
          ),
          const AppText(
            name: 'Lezzycan',
            align: TextAlign.center,
            fontWeight: FontWeight.w600,
          ),
          const AppText(
              name: 'Mobile Developer (Flutter/Dart)',
              align: TextAlign.center,
              fontWeight: FontWeight.w400),
          const SizedBox(
            height: 8,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Github:',
                style: AppConstants.getStyle(12, Colors.black),
                children: [
                  TextSpan(
                    text: 'https://github.com/lezzycan',
                    style: AppConstants.getStyle(12, Colors.black45),
                  )
                ]),
          ),
          const SizedBox(
            height: 15,
          ),
          const AppText(
            name: 'Summary',
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
          Text(
            summary == null
                ? ''' 
          Accomplished Flutter Mobile developer both for android and ios with 2 years of experience creating visually and user-friendly mobile applications. Expert-level proficiency with major development tools such as Android Studio, Visual Studio Code, Git, GitHub. Expert with the use of flutter bloc architecture, stacked architecture MVVM, with this I maintain stateless widget throughout. 
          Highly experienced in the integration of third parties such Firebase, RestApi, e-payment.
          '''
                : summary!,
            textAlign: TextAlign.justify,
            style:
                AppConstants.getStyle(12, Colors.black87).copyWith(height: 1.5),
          ),
          const SizedBox(
            height: 15,
          ),
          const AppText(
            name: 'Professional Experience',
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
          PExperience(
            title: 'Vesti Technologies (Lagos)',
            subTitle: pExp1 ??
                '''
  •	Design UI interfaces to improve user experience
	•	Integrating third-party libraries and APIs to the application	
	•	Troubleshoot and debug to optimize performance.
	•	Continuous integration test.
	•	Use RestApi for backend
	•	Skills used: Flutter, Dart, RestApi, Figma.
	•	Uploaded app on both Appstore and playstore.
    
 ''',
          ),
          const AppText(
            name: 'Additional Skills',
            color: Colors.red,
          ),
          Text(
            addSkills ??
                ''' 
  •	Programming: Dart, JS (NodeJS), 
	•	Concepts: Design Implementation, Clean Architecture, and Test-Driven Development using MVVM, Providers, Riverpod, Get.
	•	Collaboration: Organizing workshops, campaigns, events. Using Jira, SCRUM, Slack, Github, Git.
	•	Others:  Communication, Leadership,
	•	Language: English
          ''',
            textAlign: TextAlign.justify,
            style:
                AppConstants.getStyle(12, Colors.black87).copyWith(height: 1.6),
          ),
          const AppText(
            name: 'ACTIVITIES',
            color: Colors.red,
          ),
          Text(
            activities ??
                ''' 
  •	Member of flutter Lagos community
	•	Member of Developer’s Club FUTA group
	•	Member of Developer’s Club Lagos State Nigeria
          ''',
            textAlign: TextAlign.justify,
            style:
                AppConstants.getStyle(12, Colors.black87).copyWith(height: 1.6),
          ),
          const AppText(
            name: 'EDUCATION',
            color: Colors.red,
          ),
          const PExperience(
              title: 'FEDERAL UNIVERSITY OF TECHNOLOGY, Akure, Ondo State',
              subTitle: 'Bachelor of Technology in COMPUTER SCIENCE, 2020')
        ],
      ),
    );
  }
}

class AppText extends StatelessWidget {
  const AppText(
      {super.key, required this.name, this.align, this.fontWeight, this.color});

  final String? name;
  final TextAlign? align;
  final FontWeight? fontWeight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      name ?? 'Waheed Olalekan Toheeb',
      textAlign: align,
      style: AppConstants.getStyle(15, color ?? Colors.black)
          .copyWith(fontWeight: fontWeight),
    );
  }
}

class PExperience extends StatelessWidget {
  const PExperience({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppConstants.getStyle(15, Colors.black)
            .copyWith(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subTitle,
        textAlign: TextAlign.justify,
        style: AppConstants.getStyle(13, Colors.black87).copyWith(height: 1.6),
      ),
    );
  }
}
