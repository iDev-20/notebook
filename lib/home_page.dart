// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notebook/components/app_constants.dart';
import 'package:notebook/widgets/custom_grid_tile.dart';
import 'package:notebook/widgets/notebook_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _notebookController = TextEditingController();
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
  List<Map<String, String>> get notebookFolder =>
      _notebookFolder.reversed.toList();
  List<Map<String, dynamic>> get notebookData =>
      _notebookData.reversed.toList();

  void createNotebook(String notebookName) {
    setState(() {
      _notebookFolder.add({
        'label': notebookName.trim().replaceAll(' ', '\n'),
        'color': folderColors[Random().nextInt(folderColors.length)],
      });
    });
  }

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
            // backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/profile_image.png'),
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
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/light_mode.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: SizedBox(
              height: 40,
              child: TextField(
                decoration: kinputDecorationTextField,
                onChanged: (value) {},
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF4F378B),
        // backgroundColor: Theme.of(context).primaryColor,
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
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Enter notebook title',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.black),
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
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.black),
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Enter notebook data',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.black),
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
        padding: const EdgeInsets.fromLTRB(14, 24, 14, 24),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Notebooks',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 164,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                NoteBookWidget(
                  onPressed: () async {
                    final result = await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog.adaptive(
                            content: Material(
                              elevation: 0,
                              color: Colors.transparent,
                              child: TextField(
                                controller: _notebookController,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: 'Enter notebook name',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(
                                    context, _notebookController.text),
                                child: const Text('Create'),
                              ),
                            ],
                          );
                        });
                    if (result == null) return;
                    createNotebook(result);
                    _notebookController.clear();
                  },
                  label: 'Add \nNotebook',
                  color: folderColors[Random().nextInt(folderColors.length)],
                  icon: Icons.add,
                ),
                ...List.generate(notebookFolder.length, (index) {
                  return NoteBookWidget(
                    onPressed: () {},
                    label: notebookFolder[index]['label']!,
                    color: notebookFolder[index]['color']!,
                  );
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'See all',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFBC85FC)),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Notes',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 24),
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(notebookData.length, (index) {
                return StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: () {
                    if (notebookData[index]['data']!.length > 119) {
                      return 2;
                    }
                    return 1;
                  }(),
                  child: CustomGridTile(
                    title: notebookData[index]['title']!,
                    isFavorite: notebookData[index]['is_favourite'],
                    data: notebookData[index]['data']!,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
