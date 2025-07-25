
import 'dart:ui';

class PromptEffect {
  final Color? backgroundColor;
  final Color? appBarColor;
  final Color? welcomeMessageColor;
  final double? imageSize;
  final bool? showWelcome;
  final String? lastMessage;
  final bool reset;

  const PromptEffect({
    this.backgroundColor,
    this.appBarColor,
    this.welcomeMessageColor,
    this.imageSize,
    this.showWelcome,
    this.lastMessage,
    this.reset = false,
  });
}