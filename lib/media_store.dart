import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class MediaStore {
  static const MethodChannel _channel =
      const MethodChannel('net.amond/media_store');

  /// save image to Gallery
  /// imageBytes can't null
  static Future? saveImage(Uint8List imageBytes) async {
    assert(imageBytes != null);
    if (imageBytes != null) {
      final result =
          await _channel.invokeMethod('saveImageToGallery', imageBytes);
      return result;
    }
  }

  /// Save the PNG，JPG，JPEG image or video located at [file] to the local device media gallery.
  static Future? saveFile(String file) async {
    assert(file != null);
    if (file != null) {
      final result = await _channel.invokeMethod('saveFileToGallery', file);
      return result;
    }
  }
}
