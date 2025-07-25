import 'package:dynamo/prompt_effect_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';

const themeColor = Color(0xfff44c30);

// Supported prompts and their effects
// All keys must be lowercase for case-insensitive matching in promptMap.
const List<String> surprisePrompts = [
  'change the background color to blue',
  'change app bar color to yellow',
  'make the dynamo image bigger',
  'hide the welcome message',
  'reset',
];

// Returns a random PromptEffect from the surprisePrompts list.
// This is used for the 'surprise me' feature in the UI.
PromptEffect getRandomSurpriseEffect() {
  final random = Random();
  // Pick a random prompt from the list and fetch its effect from promptMap.
  final prompt = surprisePrompts[random.nextInt(surprisePrompts.length)];
  // The prompt must exist in promptMap, otherwise this will throw.
  return promptMap[prompt]!;
}

// Map of supported prompts to their effects.
// All keys must be lowercase for case-insensitive matching.
const Map<String, PromptEffect> promptMap = {
  'change the background color to blue': PromptEffect(
    backgroundColor: Colors.blue,
    lastMessage: 'Background color changed to blue!',
  ),
  'change app bar color to yellow': PromptEffect(
    appBarColor: Colors.yellow,
    lastMessage: 'App bar color changed to yellow!',
  ),
  'make the dynamo image bigger': PromptEffect(
    imageSize: 300.0,
    lastMessage: 'Dynamo image is now bigger!',
  ),
  'hide the welcome message': PromptEffect(
    showWelcome: false,
    lastMessage: 'Welcome message hidden!',
  ),
  'reset': PromptEffect(
    reset: true,
  ),
  // This entry is a placeholder; actual effect is handled in code
  'surprise me': PromptEffect(
    lastMessage: 'Surprise coming up! 🎲',
  ),
};
