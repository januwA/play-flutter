[Flutter中文网](https://flutterchina.club/) [Flutter 官网](https://flutter.io/)

# ajanuw_flutter_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

---

> pubspec文件管理Flutter应用程序的assets(资源，如图片、package等)。 在pubspec.yaml中，将english_words（3.1.0或更高版本）添加到依赖项列表, 保存后vs code自动安装依赖

我的运行环境：
- windows10
- intel


## 安装Flutter环境
1. 安装 javaSE 1.8以上 [下载地址](https://www.oracle.com/technetwork/java/javase/archive-139210.html)
  - 下载完jdk和jre后配置环境变量
  - JAVA_HOME JDK安装路径 D:\my-tools\Java\jdk-10.0.2_windows-x64_bin
  - 在PATH里面添加D:\my-tools\Java\jdk-10.0.2_windows-x64_bin\bin路径
  - CLASSPATH .:D:\my-tools\Java\jdk-10.0.2_windows-x64_bin\lib 路径 记得最前面加上 .:
  - 查看是否安装成功
  
    ```
    java --version
    javac --version
    ```

2. 安装 androidStudio [下载地址](https://www.techspot.com/downloads/6831-android-studio.html)
  - 安装时都能勾的都勾上
  - 安装完成后，开始配置环境变量
  - ANDROID_HOME  D:\my-tools\Android\Sdk
  - 添加PATH  %ANDROID_HOME%\tools;%ANDROID_HOME%\platform-tools;
  - 运行AndroidStudio后，安装Dart Plugin，和Flutter Plugin

3. windows下Flutter安装 [官方文档](https://flutter.io/docs/get-started/install/windows)
  -  cmd中执行 flutter doctor 命令以查看是否需要安装任何依赖项来完成安装

4. 编辑器使用的是 VS Code
  - 安装 Dart插件
  - 安装 Flutter插件


  ### [ThemeData 配置app主题颜色](https://docs.flutter.io/flutter/material/ThemeData-class.html) 
  ### [colors 色卡](https://docs.flutter.io/flutter/material/Colors-class.html)

资源：
  - [在Flutter中构建布局](https://flutterchina.club/tutorials/layout/)
  - [为您的Flutter应用程序添加交互](https://flutterchina.club/tutorials/interactive/)
  - [Flutter Widget框架概述](https://flutterchina.club/widgets-intro/)
  - [Flutter for Web开发者](https://flutterchina.club/web-analogs/)
  - [发布Android版APP](https://flutterchina.club/android-release/)
  - [developer.android.com 无法访问](https://www.jianshu.com/p/ed7da9412ac3)
  - [vs code 初始化一个项目](https://flutterchina.club/get-started/test-drive/#vscode)

---

生成app签名：
> keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key

生成的key.jks文件拷贝到项目下的 /andrroid/app/key.jks 这里。

key.properties ：
```
storePassword=<password from previous step>
keyPassword=<password from previous step>
keyAlias=key
storeFile=key.jks
```