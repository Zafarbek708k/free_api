import 'dart:io';
import 'package:flutter/material.dart';
import 'package:free_api/src/core/constants/context_extension.dart';
import 'package:free_api/src/core/widgets/text_widget.dart';
import 'package:image_picker/image_picker.dart';

class ImageToTextPage extends StatefulWidget {
  const ImageToTextPage({super.key});

  @override
  State<ImageToTextPage> createState() => _ImageToTextPageState();
}

class _ImageToTextPageState extends State<ImageToTextPage> {
  final ImagePicker _picker = ImagePicker();
  File? _image; // Make this nullable

  Future<void> _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      // Handle the case when no image is selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No image selected")),
      );
    }
  }

  Future<void> _getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No image captured")),
      );
    }
  }

  void _showImageSourceSelector() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Select from Gallery"),
              onTap: () {
                Navigator.pop(context);
                _getImageFromGallery();
              },
            ),

            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Capture from Camera"),
              onTap: () {
                Navigator.pop(context);
                _getImageFromCamera();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        title: CustomTextWidget(
          "Image to Text",
          textColor: context.appTheme.secondary,
        ),
        centerTitle: true,
        backgroundColor: context.appTheme.primary,
      ),
      body: Center(
        child: _image == null
            ? CustomTextWidget(
          "No image selected",
          textColor: context.appTheme.secondary,
        )
            : Image.file(
          _image!,
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showImageSourceSelector,
        child: const Icon(Icons.photo_camera),
      ),
    );
  }
}

class ImageToTextController extends ChangeNotifier{}