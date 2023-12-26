import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadWidget extends StatefulWidget {
  const UploadWidget({super.key});

  @override
  State<UploadWidget> createState() => _UploadWidgetState();
}

class _UploadWidgetState extends State<UploadWidget> {
  String? geturl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                withData: true,
                type: FileType.image,
              );
              var refrence = FirebaseStorage.instance
                  .ref('products/${result?.files.first.name}');

              if (result?.files.first.bytes != null) {
                var uploadResult = await refrence.putData(
                    result!.files.first.bytes!,
                    SettableMetadata(contentType: 'image/png'));

                if (uploadResult.state == TaskState.success) {
                  geturl = await refrence.getDownloadURL();
                }
              }
            },
            child: const Text('upload image')),
      ],
    );
  }
}
