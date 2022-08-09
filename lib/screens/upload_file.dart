import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:in_class_asssignment/services/file_services.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({Key? key}) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String fileName = '';
  PlatformFile? selected_file;
  FilePickerResult? result;
  final FileServices _fileServices = FileServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload File'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.amber,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: _firebaseFirestore.collection("images").snapshots(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        // return Text(snapshot.data!.toString());
                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: ((context, index) {
                              return Text(
                                  snapshot.data!.docs[index].get("url"));
                            }));
                      } else {
                        return const CircularProgressIndicator();
                      }
                    })),
              ),
            ),
            const SizedBox(height: 25),
            SelectableText('File: $fileName'),
            const SizedBox(height: 25),
            FloatingActionButton.extended(
              onPressed: () async {
                result =
                    await FilePicker.platform.pickFiles(type: FileType.image);
                if (result == null) {
                  setState(() {
                    fileName = '';
                    return;
                  });
                }
                final file = result!.files.first;
                _fileServices.openFile(file);

                setState(() {
                  fileName = result!.files.first.toString();
                  selected_file = result!.files.first;
                });
              },
              label: const Text('Select file'),
            ),
            const SizedBox(height: 25),
            FloatingActionButton.extended(
              onPressed: () async {
                if (selected_file != null) {
                  File file = File(result!.files.first.path.toString());
                  await _fileServices.uploadFile(File(file.path));
                  print('result:  ${result!.files.first.path}');
                }
              },
              label: const Text('Upload file'),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
