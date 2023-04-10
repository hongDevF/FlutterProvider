import 'package:flutter/material.dart';
import 'package:flutterprovider/view_models/university_provider.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:provider/provider.dart';

class UniversityScreen extends StatefulWidget {
  const UniversityScreen({super.key});

  @override
  State<UniversityScreen> createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UniversityProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("University List"),
      ),
      body: FutureBuilder(
        future: provider.getUniversityData(),
        builder: (context, snapshot) {
          final data = provider.university;
          if (data.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: CustomText(text: item.country.toString()),
                        subtitle: CustomText(
                          text: item.name!,
                          textSize: 16,
                        ),
                      ),
                      ListTile(
                        title: CustomText(text: item.alphaTwoCode.toString()),
                        subtitle: CustomText(text: item.webPages.toString()),
                      ),
                    ],
                  ),
                ));
              });
        },
      ),
    );
  }
}
