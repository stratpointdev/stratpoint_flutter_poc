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

**_IMPORTANT NOTE_**

The `secrets.json`; which contains sensitive information would normally not be checked in to the repository and distributed only to the necessary members of the development team in order to ensure a higher level of security around development.

The values are also stored currently in the application inside keychain and keystore secure storage.

However for the purpose of demonstration and easy access to running the Proof of Concept application, we included the sensitive keys already into the repository.

The ideal setup would be the use of an Authentication Server which would provide an access key based on login and two-factor authentication, and not storing the key on the device at all.

#### Coding Standards

We will be using the standard Dart Formatter provided by the Dart SDK.

The documentaion on effective Dart design can be found on this [link](https://dart.dev/guides/language/effective-dart)

## Domain-Driven Design

*Original source:  [https://resocoder.com/2020/03/09/flutter-firebase-ddd-course-1-domain-driven-design-principles/](https://resocoder.com/2020/03/09/flutter-firebase-ddd-course-1-domain-driven-design-principles/)*


We will go over everything in more detail later but for now just know that the diagram below outlines the  **key architectural layers**  present in a DDD Flutter app. We're going to use  **BLoC** in this series but, as usual, I didn't forget about all of you who have declared BLoC a sworn enemy. If you don't want to use it in your apps, feel free to use a  **view model**  of your choice, whether it be  `ChangeNotifier`, MobX  `Store`, or even the new  `StateNotifier`. More on that later.

![](https://resocoder.com/wp-content/uploads/2020/03/DDD-Flutter-Diagram-v3.svg "DDD Flutter Diagram v3")

There are a few things that I couldn't fit on the diagram. Namely:

-   Arrows represent the flow of data. This can be either uni-directional or bi-directional.
-   The domain layer is  **completely independent**  of all the other layers. Just pure business logic & data.

If you're familiar with my Clean Architecture course, the above diagram feels somewhat familiar. If you aren't, no worries. It's not a prerequisite for this tutorial series. Note that classes such as  `Firestore`  or  `FirebaseAuth`  are ready-made  **data sources**, so we will write code from  **repositories**  upwards.

Notice that in addition to holding and carrying around data,  `Entities`  and  _validated_ `ValueObjects`  also contain logic. This ranges from data validation and helpers to complex computations.

Also take note of how  `Exception`s are put into the regular flow of data as  `Failure`s. The only place for  `try`  and  `catch`  statements are  `Repositories`. This will make it  **impossible**  _not_ to handle exceptions, which is a very good thing.

Before we go ahead and take a closer look at what are the roles of all the layers and their classes, let's first tackle the age old question of folder structure.

![](https://i0.wp.com/resocoder.com/wp-content/uploads/2020/03/folder-structure.png?ssl=1 "folder structure")

## Folder structure

I'm the first to admit that the folder structure outlined in the  [Clean Architecture course](https://resocoder.com/flutter-clean-architecture-tdd/)  is a pain to deal with. With DDD, we're going to take a different approach.

**Layers will hold features**, not the other way around. This will still keep the code readable but, most importantly, it will ensure that adding more features and sub-features is going to be a pure bliss!

Let's take a look at the  **notes** feature. While the main  **notes** folder is present inside every layer (application, domain, infrastructure, presentation), its subfolders are different!

What does this mean? Well, we can have both a  **good folder structure**  and a separation into  **architectural layers**  at the same time 🎉🥳

It's also worth noting that some features don't even have to necessarily be represented in all layers. Notice that  **splash** folder in the **presentation**  layer? There is no inherent "splash screen logic", so it doesn't make sense to put it into other layers.

All in all, we can mix and match the dependencies in between features as long as we keep true to the dependency flow outlined in the diagram above (**domain**  layer has to have ZERO dependencies on other layers).



## Architectural Layers

Unlike with the spaghetti architecture 🍝, you will **always know where to put a certain class** when you're following the Domain-Driven Design principles. Each one of the layers has a clear-cut responsibility. As you can see on the folder structure picture above, every architectural layer contains **features** and possibly a **core**  folder which holds classes common to all the features in that layer (helpers, abstract classes, ...).

### Presentation

This layer _is all Widgets_ 💙 and also the state of the  `Widget`s. I already mentioned that we're going to use  **BLoC** in this series. If you're not familiar with this state management pattern, I'd recommend you to check out  [this tutorial](https://resocoder.com/2019/10/26/flutter-bloc-library-tutorial-1-0-0-stable-reactive-state-management/). The main difference from something like a  `ChangeNotifier`  is that BLoCs are separated into 3 core components:

-   **States**  - Their sole purpose is to deliver values (variables) to the widgets.
-   **Events**  - Equivalent to methods inside a  `ChangeNotifier`. These trigger logic inside the BLoC and can optionally carry some raw data (e.g.  `String`  from a  `TextField`) to the BLoC.
-   **BLoC** - NOT A PART OF THE PRESENTATION LAYER!!! But it executes logic based on the incoming events and then it outputs states.

So, if you're not using BLoC, just replace the  `State`  and  `Event`  classes with a single View Model class of your choice.

[![](https://resocoder.com/wp-content/uploads/2020/03/DDD-Presentation-Layer-with-User.svg "DDD Presentation Layer with User")](https://resocoder.com/wp-content/uploads/2020/03/DDD-Presentation-Layer-with-User.svg)

With Domain-Driven Design,  **UI is dumbest part of the app**. That's because it's at the boundary of our code and it's totally dependent on the Flutter framework. Its logic is limited to creating "eye candy" for the user. So while animation code does belong into this layer, even things like  **form validation**  are NOT done inside the presentation layer.

A rule of thumb is that whenever some logic operates with data that is later on  **sent to a server**  or  **persisted in a local database**, that logic has nothing to do in the presentation layer.

### Application

This layer is away from all of the outside interfaces of an app. **You _aren't_ going to find any UI code, network code, or database code here.** Application layer has only one job - orchestrating all of the other layers. No matter where the data originates (user input, real-time Firestore `Stream`, device location), its **first destination**  is going to be the application layer.

![](https://resocoder.com/wp-content/uploads/2020/03/DDD-Application-Layer.svg "DDD Application Layer")

The arrow are Events which are sent from the presentation layer

The role of the application layer is to decide "what to do next" with the data. It doesn't perform any complex business logic, instead, it mostly just makes sure that the  _user input is validated_  (by calling things in the  **domain layer)** or it manages subscriptions to **infrastructure**  data  `Stream`s (not directly, but by utilizing the  [**dependency inversion**](https://en.wikipedia.org/wiki/Dependency_inversion_principle)  principle, more on that later).

If you're not using BLoC, do yourself a favor, and don't put the application logic into View Models. I'd recommend creating reusable, one-purpose  `UseCase`  classes. Learn more from the  **[mysterious uncle](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html#use-cases)**.

### Domain

The domain layer is the **pristine center** of an app. It is fully self contained and it _doesn't_ depend on any other layers. Domain is not concerned with anything but doing its own job well.

This is the part of an app which doesn't care if you switch from Firebase to a REST API or if you change your mind and you migrate from the  [Hive](https://resocoder.com/2019/09/30/hive-flutter-tutorial-lightweight-fast-database/)  database to  [Moor](https://moor.simonbinder.eu/). Because domain doesn't depend on anything external, changes to such implementation details don't affect it. On the other hand,  **all the other layers  _do_ depend on domain**.

![](https://resocoder.com/wp-content/uploads/2020/03/DDD-Domain-Layer.svg "DDD Domain Layer")

So, what exactly goes on inside the domain layer? This is where your business logic lives. We are going to get to everything in detail in the next parts of this series, but everything which is not Flutter/server/device dependent goes into domain. This includes:

-   **Validating data**  and  **keeping it valid**  with  `ValueObject`s. For example, instead of using a plain  `String`  for the body of a  `Note`, we're going to have a separate class called  `NoteBody`. It will encapsulate a  `String`  value and make sure that it's no more than 1000 characters long and that it's not empty.

This kind of validation is usually reserved for the UI. We're, however, going to take advantage of the Dart type system to its full extent. For example, although both  `EmailAddress`  and  `Password`  encapsulate a  `String`, it will be impossible to pass an  `EmailAddress`  to a method expecting a  `Password`  argument and vice versa.

-   **Transforming data**  _(e.g. make any color fully opaque)_.
-   **Grouping** and  **uniquely identifying data**  that belongs together through  `Entity`  classes  _(e.g.  `User`  or  `Note`  entities)_
-   **Performing complex business logic**  - this is not necessarily always the case in client Flutter apps, since you should  _leave complex logic to the server_. Although, if you're building a  _**truly serverless**_ 😉 app, this is where you'd put that logic.

The domain layer is the core of you app. Changes in the other layers don't affect it. However, changes to the domain affect every other layer. This makes sense - you're probably not changing the business logic on a daily basis.

In addition to all this, the domain layer is also the home of  `Failure`s. Handling exceptions is a 💩 experience. They're flying left and right across multiple layers of code. You have to check documentation (even your own one) a million times to know which method throws which exception. Even then, if you come back to your code in a few months, you're going to be again unsure if you handled all exceptional cases.

We want to mitigate this pain with union types! Instead of using the  `return`  keyword for "correct" data and the  `throw`  keyword when something goes wrong, we're going to have  `Failure`  unions. This will also ensure that we'll know about a method's possible failures without checking the documentation. Again, we're going to get to the details in the next parts.

### Infrastructure

Much like **presentation**, this layer is also at the boundary of our app. Although, of course, it's at the "opposite end" and instead of dealing with the user input and visual output, it deals with APIs, Firebase libraries, databases and device sensors.

![](https://resocoder.com/wp-content/uploads/2020/03/DDD-Infrastructure-Layer.svg "DDD Infrastructure Layer")

The infrastructure layer is composed of two parts - low-level  **data sources**  and high level  **repositories**. Additionally, this layer holds  **data transfer objects**  (DTOs). Let's break it down!

**DTOs**  are classes whose sole purpose is to convert data between  **entities** and  **value objects**  from the domain layer and the plain data of the outside world. As you know, only dumb data like  `String`  or  `int`  can be stored inside Firestore but we don't want this kind of unvalidated data throughout our app. That's precisely why we'll use  `ValueObject`s described above everywhere, except for the infractructure layer. DTOs can also be serialized and deserialized.

**Data sources**  operate at the lowest level.  _Remote_ data sources fit JSON response strings gotten from a server into DTOs, and also perform server requests with DTOs converted to JSON. Similarly, _local_ data sources fetch data from a local database or from the device sensors.

Firebase client libraries like **cloud_firestore** and **firebase_auth** do the heavy lifting of data sources for us. That's why we won't create any data sources in this course.

**Repositories** perform an important task of being the boundary between the **domain** and **application**  layers and the ugly outside world. It's their job to take  **DTOs** and unruly  `Exception`s from data sources as their input, and return nice  `Either<Failure, Entity>`  as their output.

If this is the first time you hear about  `Either`, you'll find out more about it in the next parts. Another option is to  [read this Kotlin documentation](https://arrow-kt.io/docs/apidocs/arrow-core-data/arrow.core/-either/)  if you are impatient 😄

If you don't use Firebase Firestore, you'll probably need to cache data locally yourself. In that case, it's the job of the **repository** to perform the  **caching logic**  and orchestrate putting data from the remote data source to the local one.