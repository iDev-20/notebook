// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notebook/components/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _notebookTitleController = TextEditingController();
  final _notebookDataController = TextEditingController();
  final folderColors = [
    'assets/purple_folder.png',
    'assets/red_folder.png',
    'assets/yellow_folder.png',
    'assets/cyan_folder.png',
  ];
  final _notebookData = <Map<String, dynamic>>[];
  final _notebookFolder = <Map<String, String>>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 66,
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.only(left: 26),
          child: CircleAvatar(
            radius: 20,
          ),
        ),
        title: const Text('Marthina'),
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
        titleSpacing: 8,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/menu.svg',
              width: 24,
              height: 15,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/light_mode.svg',
              width: 24,
              height: 24,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: TextField(
              decoration: kinputDecorationTextField,
              onChanged: (value) {},
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        label: Text(
          'New note',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: const Color(0xFFD0BCFF)),
        ),
        icon: const Icon(
          Icons.edit_outlined,
          color: Color(0xFFD0BCFF),
        ),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog.adaptive(
                content: Material(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      TextField(
                        controller: _notebookTitleController,
                        decoration: InputDecoration(
                          hintText: 'Enter notebook title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _notebookDataController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Enter notebook data',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
          if (_notebookTitleController.text.isEmpty) return;
          if (_notebookDataController.text.isEmpty) return;
          setState(() {
            _notebookData.add({
              'title': _notebookTitleController.text,
              'data': _notebookDataController.text,
              'is_favourite': false
            });
          });
          _notebookTitleController.clear();
          _notebookDataController.clear();
        },
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 24, 0, 24),
        children: [
          Text(
            'Notebooks',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 164,
            child: ListView(
              scrollDirection: Axis.horizontal,
            ),
          )
          ],
      ),
    );
  }
}
