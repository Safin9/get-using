import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({Key? key}) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  String fileName = '';
  PlatformFile? selected_file;
  FilePickerResult? result;
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
              ),
            ),
            const SizedBox(height: 25),
            SelectableText('File: $fileName'),
            const SizedBox(height: 25),
            FloatingActionButton.extended(
              onPressed: () async {
                result = await FilePicker.platform.pickFiles();
                if (result == null) {
                  setState(() {
                    fileName = '';

                    return;
                  });
                }
                final file = result!.files.first;
                _openFile(file);

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
                  await uploadFile(File(file.path));
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

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    File file = File(result!.files.single.path!);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  uploadFile(File file) async {
    Reference storageRef = FirebaseStorage.instance.ref();
    final fileRef = storageRef.child('user_files');
    fileRef.putFile(file).snapshotEvents.listen((event) async {
      switch (event.state) {
        case TaskState.running:
          print('runing');
          break;
        case TaskState.canceled:
          print('canceled');
          break;
        case TaskState.error:
          print('eror');
          break;
        case TaskState.success:
          print('success');
          break;
        case TaskState.paused:
          print('paused');
          break;
      }
    });
  }
}
