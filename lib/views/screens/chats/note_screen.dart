// ignore_for_file: unused_field, unused_element, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutterprovider/models/database/note_sql_helper.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NoteListSCreen(),
    ),
  );
}

class NoteListSCreen extends StatefulWidget {
  const NoteListSCreen({super.key});

  @override
  State<NoteListSCreen> createState() => _NoteListSCreenState();
}

class _NoteListSCreenState extends State<NoteListSCreen> {
  TextEditingController titleTextController = TextEditingController();
  TextEditingController descTextController = TextEditingController();
  List<Map<String, dynamic>> _mydata = [];

  bool _isLoading = false;

  void _refreshData() async {
    // await SqlHelper
    final data = await SqlHelper.getItems();
    setState(() {
      _mydata = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _refreshData();
  }

  Future<void> _addItem() async {
    await SqlHelper.createItem(
      titleTextController.text,
      descTextController.text,
    );
    Navigator.pop(context);
    _refreshData();
  }

  Future<void> _updateItem(int id) async {
    await SqlHelper.updateItem(
        id, titleTextController.text, descTextController.text);
    _refreshData();
    Navigator.pop(context);
  }

  void _showForm(int? id) async {
    if (id != null) {
      final existingData = _mydata.firstWhere((element) => element['id'] == id);
      titleTextController.text = existingData['title'];
      descTextController.text = existingData['description'];
    }

    showModalBottomSheet(
        context: context,
        // isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom * 120,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: titleTextController,
                      decoration: const InputDecoration(hintText: 'title'),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: descTextController,
                      decoration:
                          const InputDecoration(hintText: 'description'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () async {
                          if (id == null) {
                            await _addItem();
                          }
                          if (id != null) {
                            await _updateItem(id);
                          }
                          titleTextController.clear();
                          descTextController.clear();
                        },
                        child:
                            CustomText(text: id != null ? 'update' : 'Create')),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CO_WHITE,
      appBar: AppBar(
        title: CustomText(text: 'Chat List'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _mydata.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {},
              title: CustomText(
                text: _mydata[index]['title'],
                color: CO_BLUEVIOLET,
                textSize: 16,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: _mydata[index]['description'],
                    color: Colors.black,
                    textSize: 14,
                  ),
                  const SizedBox(height: 5),
                  CustomText(
                    text: DateFormat('dd MMM,  hh:mm a').format(
                      DateTime.parse(_mydata[index]['createdAt']),
                    ),
                    textSize: 12,
                  ),
                ],
              ),
              leading: const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: CircleAvatar(
                  // backgroundColor: CO_BLUE,
                  backgroundImage: AssetImage('lib/assets/images/Notes.png'),
                  radius: 30,
                ),
              ),
              trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () => _showForm(_mydata[index]['id']),
                          icon: const Icon(
                            Icons.edit,
                            size: 20,
                            color: CO_PRIMARY,
                          )),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: CustomText(
                                      text: "Do you want to delete?"),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: CustomText(
                                              text: 'Cancel',
                                              color: CO_GRAY,
                                            )),
                                        TextButton(
                                          onPressed: () => _delete(
                                            _mydata[index]['id'],
                                          ),
                                          child: CustomText(text: 'OK'),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: CO_RED,
                          size: 20,
                        ),
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(null),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _delete(id) async {
    SqlHelper.deleteItem(id);
    _refreshData();
  }
}
