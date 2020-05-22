# media_store

[![Build Status](https://travis-ci.org/amondnet-z/media_store.svg?branch=master)](https://travis-ci.org/amondnet/media_store#)
[![pub package](https://img.shields.io/pub/v/media_store.svg)](https://pub.dartlang.org/packages/media_store)
[![license](https://badgen.net/github/license/amondnet/media_store)](https://choosealicense.com/licenses/mit/)

We use the `media_store` plugin to select images from the Android and iOS image library, but it can't save images to the gallery. This plugin can provide this feature.

## Usage

To use this plugin, add `media_store` as a dependency in your pubspec.yaml file. For example:
```yaml
dependencies:
  media_store: '^1.0.0'
```

## iOS
Your project need create with swift.
Add the following keys to your Info.plist file, located in <project root>/ios/Runner/Info.plist:
 * NSPhotoLibraryAddUsageDescription - describe why your app needs permission for the photo library. This is called Privacy - Photo Library Additions Usage Description in the visual editor
 
 ##  Android
 You need to ask for storage permission to save an image to the gallery. You can handle the storage permission using [flutter_permission_handler](https://github.com/BaseflowIT/flutter-permission-handler).

## Example
Saving an image from the internet
``` dart
_save() async {
    var response = await Dio().get("https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg", options: Options(responseType: ResponseType.bytes));
    final result = await MediaStore.saveImage(Uint8List.fromList(response.data));
    print(result);
  }
```

Saving a video from the internet
``` dart
_saveVideo() async {
    var appDocDir = await getTemporaryDirectory();
    String savePath = appDocDir.path + "/temp.mp4";
    await Dio().download("http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4", savePath);
    final result = await MediaStore.saveFile(savePath);
    print(result);
 }
```
