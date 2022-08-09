import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:open_file/open_file.dart';

class FileServices {
  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    File file = File(result!.files.single.path!);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  uploadFile(File file) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference storageRef = FirebaseStorage.instance.ref();
    final name = DateTime.now();
    final fileRef = storageRef.child('files/user_files$name');
    firebaseFirestore.collection("images").add({'url': file.path});
    fileRef.putFile(file).snapshotEvents.listen(
      (event) async {
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
            // Get.showSnackbar(const GetSnackBar(
            //   title: 'success',
            // ));
            break;
          case TaskState.paused:
            print('paused');
            break;
        }
      },
    );
  }
}
