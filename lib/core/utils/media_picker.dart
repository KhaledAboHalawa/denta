import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

/// Thin wrapper around image_picker / file_picker.
///
/// Images use the system camera / gallery (best native quality) and are
/// downscaled to 2048px on the long side at JPEG 85: still sharp enough to
/// read a university ID, but far smaller to upload.
abstract final class MediaPicker {
  static final ImagePicker _picker = ImagePicker();
  static const double _maxSide = 2048;
  static const int _quality = 85;

  static Future<String?> pickImage(ImageSource source) async {
    try {
      final file = await _picker.pickImage(
        source: source,
        maxWidth: _maxSide,
        maxHeight: _maxSide,
        imageQuality: _quality,
      );
      return file?.path;
    } catch (_) {
      return null;
    }
  }

  static Future<List<String>> pickImages() async {
    try {
      final files = await _picker.pickMultiImage(
        maxWidth: _maxSide,
        maxHeight: _maxSide,
        imageQuality: _quality,
      );
      return files.map((f) => f.path).toList();
    } catch (_) {
      return [];
    }
  }

  static Future<List<String>> pickPdfs() async {
    try {
      final files = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: const ['pdf'],
      );
      return files.map((f) => f.path).whereType<String>().toList();
    } catch (_) {
      return [];
    }
  }
}
