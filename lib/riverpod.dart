import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:free_api/src/feature/chat/vm/chat_vm.dart";
import "package:free_api/src/feature/double/view/pages/double_chat.dart";
import "package:free_api/src/feature/double/vm/double_chat_vm.dart";
import "package:free_api/src/feature/settings/locale_controller.dart";
import "package:free_api/src/feature/settings/theme_controller.dart";

final theme = ChangeNotifierProvider((ref) => ThemeController());
final locale = ChangeNotifierProvider((ref) => LocalController());


//   // splash onBoarding
// final entryController = ChangeNotifierProvider((ref) => EntryViewModel());
final chatController = ChangeNotifierProvider((ref) => ChatVm());
final doubleChatController = ChangeNotifierProvider((ref) => DoubleChatVm());


