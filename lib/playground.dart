import 'package:dynamo/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Playground extends StatefulWidget {
  const Playground({super.key});

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  // UI State
  Color backgroundColor = Colors.white;
  double imageSize = 150.w;
  bool showWelcome = true;
  Color appBarColor = themeColor;
  final TextEditingController _controller = TextEditingController();

  // Initial state for reset
  void resetUI() {
    setState(() {
      backgroundColor = Colors.white;
      imageSize = 150.w;
      showWelcome = true;
      appBarColor = themeColor;
      lastMessage = null;
      welcomeMessageColor = themeColor;
    });
  }

  Color welcomeMessageColor = themeColor;
  String? lastMessage;

  void handlePrompt(String prompt) {
    final normalizedPrompt = prompt.toLowerCase();
    final update = normalizedPrompt == 'surprise me'
        ? getRandomSurpriseEffect()
        : promptMap[normalizedPrompt];
    if (update == null) {
      setState(() {
        lastMessage = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Prompt not recognized. Try one from the list.',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          backgroundColor: themeColor,
        ),
      );
      return;
    }
    setState(() {
      if (update.reset) {
        resetUI();
      }
      if (update.backgroundColor != null) {
        backgroundColor = update.backgroundColor!;
      }
      if (update.appBarColor != null) {
        appBarColor = update.appBarColor!;
      }
      if (update.welcomeMessageColor != null) {
        welcomeMessageColor = update.welcomeMessageColor!;
      }
      if (update.imageSize != null) {
        imageSize = update.imageSize!;
      }
      if (update.showWelcome != null) {
        showWelcome = update.showWelcome!;
      }
      if (update.lastMessage != null) {
        lastMessage = normalizedPrompt == 'surprise me'
            ? '🎲 Surprise: ${update.lastMessage!}'
            : update.lastMessage;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Dynamo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 24.sp,
          ),
        ),
        backgroundColor: appBarColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'images/dynamo.png',
                  width: imageSize,
                  height: imageSize,
                ),
              ),
              SizedBox(height: 24.h),
              if (showWelcome) ...[
                Center(
                  child: Text(
                    'Welcome to the Dynamo Playground!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: welcomeMessageColor,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Center(
                  child: Text(
                    'Generate UI dynamically with human-like prompts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: welcomeMessageColor,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Enter a prompt...',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: themeColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10.w)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: themeColor, width: 2),
                            borderRadius: BorderRadius.circular(10.w)),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  SizedBox(
                    height: 48.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () {
                        handlePrompt(_controller.text.trim());
                        _controller.clear();
                      },
                      child: Text(
                        'Go',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (lastMessage != null) ...[
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    lastMessage!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: themeColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
              SizedBox(height: 32.h),
              Text(
                'Choose any of the following prompts:',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              ...promptMap.keys.map(
                (prompt) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• ', style: TextStyle(fontSize: 16.sp)),
                    Expanded(
                      child: Text(
                        prompt,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
