import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_store/media_store.dart';

void main() {
  const MethodChannel channel = MethodChannel('net.amond/media_store');
  final List<MethodCall> log = <MethodCall>[];
  bool response;

  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    log.add(methodCall);
    return response;
  });

  tearDown(() {
    log.clear();
  });

  test('saveImageToGallery test', () async {
    response = true;
    Uint8List imageBytes = Uint8List(16);
    final bool result = await ImageGallerySaver.saveImage(imageBytes);
    expect(
      log,
      <Matcher>[isMethodCall('saveImageToGallery', arguments: imageBytes)],
    );
    expect(result, response);
  });
}
