# GlobeOne Flutter POC

## Getting Started

Flutter development can be done on macOS, Linux, or Windows. While you can use any editor with the Flutter toolchain, there are IDE plugins for *[IntelliJ IDEA](https://www.jetbrains.com/idea/)*, *[Android Studio](https://developer.android.com/studio/index.html)* and *[Visual Studio Code](https://code.visualstudio.com/)* that can ease the development cycle. We’ll use VS Code for this project.

### Setting up Your Development Environment

Instructions for setting up your development machine with the Flutter framework can be found [here](https://flutter.dev/docs/get-started/install). The basic steps vary by platform, but for the most part are:

1. Download the installation bundle for your development machine’s operating system to get the latest **stable release (at least v1.12)** of the Flutter SDK 
2. Extract the the installation bundle in the desired location
3. Add the flutter tool to your path
4. Run the `flutter doctor` command, which installs the Flutter framework including Dart and alerts you to any missing dependencies
5. Install missing dependencies
6. Set up your IDE with a Flutter plugin/extension
7. For your build machines - Xcode 11.3 or 11.4, Android SDK 29

### Project Tips

#### Code Quality

To make your development life easier make sure to turn on auto formatting on your IDE.

**For VSCode**

1. Go to Settings
2. Search for Format
3. Make sure the setting **Editor: Format on Save** is enabled

**For Android Studio and IntelliJ**

1. Edit -> Macros -> Start Macro Recording
2. (windows) Press `CTRL + ALT + L` then `CTRL + S`
2. (mac) Press `CMD + ALT + L` then `CMD + S`
3. Enter a name for your macro. I named mine **Format on Save**
4. Go to Settings → Keymap → Macros
5. Find your macro and add a keyboard shortcut for it. Mine is `CMD + S`. You can do which keys you want.

**For IntelliJ (optional)**

1. Install the [save actions plugin](https://plugins.jetbrains.com/plugin/7642-save-actions) 
2. Search then active the plugin
3. Configure the plugin
4. Make sure the setting **Reformat code** and **Reformat only changed code (only if VCS configured)** is enabled

#### App Name

To rename the application, edit the value of the `name` key on the [pubspec.yaml](pubspec.yaml)

```yaml
flutter_launcher_name:
  name: "GlobeOne POC"
```

Then run the following commands

```shell
flutter pub get
flutter pub run flutter_launcher_name:main
```

#### App Icon

To change the app icon, change the icon on the directory **/assets/icon.png**`** and make sure the correct value for the `image_path` is set on the [pubspec.yaml](pubspec.yaml)

```yaml
flutter_icons:
  image_path: "assets/icon.png"
  android: true
  ios: true
```

Then run the following commands

```shell
flutter pub get
flutter pub run flutter_launcher_icons:main
```

#### Assets

Adding assets is as easy as adding files to the **/assets** directory. To easily access these assets, please run the [Flutter Image Sync](https://marketplace.visualstudio.com/items?itemName=Lihaha.flutter-img-sync&ssr=false#overview) plugin.

This plugin will generate a file called `R.dart` inside your **/lib** folder.

You may now access your assets like this

```dart
Image.asset(R.assetsIcSampleName)
```

## Documentation

### Project Standards

The documentation can be found on this [document])(STANDARDS.md)

### Coding Standards

We will be using the standard Dart Formatter provided by the Dart SDK.

The documentaion on effective Dart design can be found on this [link](https://dart.dev/guides/language/effective-dart)
