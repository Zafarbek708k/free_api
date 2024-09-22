import "dart:async";
import "package:flutter/services.dart";
import "package:l/l.dart";
import "package:free_api/setup.dart";
import "package:free_api/src/app.dart";

void run()=> l.capture<void>(
    ()=> runZonedGuarded<void>(
        ()async{
          await setup();
          await SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp],
          ).then(
              (_)=> App.run(),
          );
        },
        (final error, final stackTree){
          l.e(
            "io_top_level_error: $error && $stackTree",
            stackTree,
          );
        },
    ),
  const LogOptions(
    printColors: true,
    handlePrint: true,
    outputInRelease: true,
  ),
);


