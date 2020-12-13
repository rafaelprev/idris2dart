import SimpleFFI

dartUI : Lib
dartUI = MkLib "dartUI" "dart:ui"

gestures : Lib
gestures = MkLib "gestures" "package:flutter/gestures.dart"

painting : Lib
painting = MkLib "gestures" "package:flutter/painting.dart"

widgets : Lib
widgets = MkLib "widgets" "package:flutter/widgets.dart"

material : Lib
material = MkLib "material" "package:flutter/material.dart"

foundation : Lib
foundation = MkLib "foundation" "package:flutter/foundation.dart"

flutter : Module
flutter = defModule "Flutter.FFI" [
  defLib foundation [
    defClass "Key" [
    ]
  ],
  defLib painting [
    defClass "TextStyle" [
      defConstructor "" [
          named "Color" "backgroundColor",
          named "Color" "color",
          named double "fontSize"
      ],
      final "TextAlign" "textAlign"
    ],
    defClass "AlignmentGeometry" [
    ],
    defClass "Alignment" [
      extends "AlignmentGeometry",
      defConst "Alignment" "centerLeft",
      defConst "Alignment" "centerRight"
    ],

 
    defClass "NetworkImage" [
      defConstructor "" [
        positional string "src"
      ]
    ]

  ],
  defLib material [
    defClass "MaterialColor" [
    ],
    defClass "Colors" [
      defConst "MaterialColor" "black",
      defConst "MaterialColor" "blue",
      defConst "MaterialColor" "brown",
      defConst "MaterialColor" "cyan",
      defConst "MaterialColor" "green",
      defConst "MaterialColor" "grey",
      defConst "MaterialColor" "purple",
      defConst "MaterialColor" "red",
      defConst "MaterialColor" "transparent",
      defConst "MaterialColor" "white",
      defConst "MaterialColor" "yellow"
    ],
    defClass "VisualDensity" [
      defConst "VisualDensity" "adaptivePlatformDensity"
    ],
    defClass "TextTheme" [
      final "TextStyle" "headline1",
      final "TextStyle" "headline2",
      final "TextStyle" "headline3",
      final "TextStyle" "headline4"
    ],
    defClass "Theme" [
      defStatic "of" [positional "BuildContext" "context"] "ThemeData"
    ],
    defClass "ThemeData" [
      defConstructor "" [
        named "MaterialColor" "primarySwatch",
        named "VisualDensity" "visualDensity"
      ],
      final "TextTheme" "textTheme"
    ],
    defClass "ButtonStyle" [
      defConstructor "" [
          named "Color" "backgroundColor"
      ],
      final "TextAlign" "textAlign"
    ],
    defClass "Scaffold" [
      extends "Widget",
      defConstructor "" [
        named "Widget" "appBar",
        named "Widget" "body",
        named "Widget" "floatingActionButton",
        named "Color" "backgroundColor",
        named bool "resizeToAvoidBottomPadding"
      ]
    ],
    defClass "AppBar" [
      extends "Widget",
      defConstructor "" [
        named "Widget" "title"
      ]
    ],
    defClass "Icons" [
      defConst "IconData" "add",
      defConst "IconData" "add_circle_outline",
      defConst "IconData" "remove",
      defConst "IconData" "remove_circle_outline",
      defConst "IconData" "play_arrow",
      defConst "IconData" "stop",
      defConst "IconData" "stop_circle",
      defConst "IconData" "stop_circle_outlined",
      defConst "IconData" "stop_circle_rounded",
      defConst "IconData" "stop_circle_sharp",
      defConst "IconData" "stop_outlined",
      defConst "IconData" "stop_rounded"
    ],
    defClass "IconButton" [
      extends "Widget",
      defConstructor "" [
        named (function [] void) "onPressed",
        named string "tooltip",
        named "Widget" "icon",
        named "AlignmentGeometry" "alignment"
      ]
    ],
    defClass "FloatingActionButton" [
      extends "Widget",
      defConstructor "" [
        named (function [] void) "onPressed",
        named string "tooltip",
        named "Widget" "child"
      ]
    ],

    defClass "TextButton" [
      extends "Widget",
      defConstructor "" [
        named (function [] void) "onPressed",
        named "ButtonStyle" "style",
        named "Widget" "child"
        ],
      defStatic "styleFrom" [ 
        named "Color" "primary",
        named "Color" "backgroundColor"
      ] "ButtonStyle"
    ],

    defClass "InputDecoration" [
      defConstructor "" [
        named string "labelText",
        named "TextStyle" "labelStyle",
        named "Color" "fillColor",
        named bool "filled"
      ]
    ],

    defClass "TextField" [
      extends "Widget",
      defConstructor "" [
        named "InputDecoration" "decoration",
        named "TextStyle" "style",        
        named bool "obscureText",        
        named (function [string] void) "onChanged"
      ]
    ],

    defClass "Slider" [
      extends "Widget",
      defConstructor "" [
        named double "value",
        named (function [double] void) "onChanged",
        named (function [double] void) "onChangeStart",
        named (function [double] void) "onChangeEnd",
        named double "min",
        named double "max",
        named int "divisions",
        named string "label"
      ]
    ],

    defClass "MaterialPageRoute" [
      extends "Widget",
      defConstructor "" [
        named (function ["WidgetBuilder"] "Widget") "builder" 
      ]
    ],

    defClass "MaterialApp" [
      extends "Widget",
      defConstructor "" [
        named string "title",
        named "Widget" "home",
        named "ThemeData" "theme"
      ]
    ]
  ],
  defLib widgets [
    defEnum "MainAxisAlignment" [
      "start", "end", "center", "spaceBetween", "spaceAround", "spaceEvenly"
    ],
    defClass "IconData" [
    ],
    defClass "Icon" [
      extends "Widget",
      defConstructor "" [
        positional "IconData" "icon",
        named "Key" "key"
      ]
    ],
    defClass "Widget" [
    ],
    defClass "BuildContext" [
    ],
    defClass "WidgetBuilder" [
      defConstructor "" [
        positional "BuildContext" "context"
      ]
    ],


    defClass "Container" [
      extends "Widget",
      defConstructor "" [
        named "Widget" "child"
      ]
    ],


    defClass "SizedBox" [
      extends "Widget",
      defConstructor "" [
        named double "width",
        named double "height"
      ]
    ],


    defClass "Center" [
      extends "Widget",
      defConstructor "" [
        named "Widget" "child"
      ]
    ],
    defClass "Column" [
      extends "Widget",
      defConstructor "" [
        named (listOf "Widget") "children",
        named "MainAxisAlignment" "mainAxisAlignment"
      ]
    ],
    defClass "Expanded" [
      extends "Widget",
      defConstructor "" [
        named "Widget" "child"
      ]
    ],
    defClass "Row" [
      extends "Widget",
      defConstructor "" [
        named (listOf "Widget") "children",
        named "MainAxisAlignment" "mainAxisAlignment"
      ]
    ],

    defClass "Route" [
      extends "Widget",
      defConstructor "" [
      ]
    ],


    defClass "Navigator" [
      extends "Widget",
      defStatic "push" [
        positional "BuildContext" "context",
        positional "MaterialPageRoute" "materialPageRoute"
      ] void
    ],

 
    defClass "Text" [
      extends "Widget",
      defConstructor "" [
        positional string "text",
        named double "textScaleFactor",
        named "TextStyle" "style",
        named "TextAlign" "textAlign"
      ]
    ],

    defClass "Image" [
      extends "Widget",
      defConstructor "" [
        named "NetworkImage" "image"
      ]
    ],


    defClass "GestureDetector" [
      extends "Widget",
      defConstructor "" [
        named "Key" "key",
        named "Widget" "child",
        named (function ["TapDownDetails"] void) "onTapDown",
        named (function ["TapUpDetails"] void) "onTapUp",
        named (function [] void) "onTap",
        named (function [] void) "onTapCancel",
        named (function [] void) "onSecondaryTap",
        named (function [] void) "onSecondaryTapCancel",
        named (function [] void) "onDoubleTap",
        named (function [] void) "onDoubleTapCancel",
        named (function ["TapDownDetails"] void) "onSecondaryTapDown",
        named (function ["TapUpDetails"] void) "onSecondaryTapUp",
        named (function [] void) "onLongPress",
        named (function ["LongPressStartDetails"] void) "onLongPressStart",
        named (function ["LongPressMoveUpdateDetails"] void) "onLongPressMoveUpdate",
        named (function ["LongPressEndDetails"] void) "onLongPressEnd"
      ]
    ],
    defClass "CustomPaint" [
      extends "Widget",
      defConstructor "" [
        named "Key" "key",
        named "Widget" "child",
        named "CustomPainter" "painter",
        named "CustomPainter" "foregroundPainter",
        named "Size" "size",
        named bool "isComplex",
        named bool "willChange"
      ]
    ],
    defClass "CustomPainter" [
    ]
  ],
  defLib dartUI [
    defEnum "AppLifecycleState" [
      "detached",
      "inactive",
      "paused",
      "resumed"
    ],
    defClass "Color" [
      defConstructor "" [
        positional int "value"
      ]
    ],
    defClass "Canvas" [
      defIO "drawPath" [
        positional "Path" "path",
        positional "Paint" "paint"
      ] void
    ],
    defEnum "PaintingStyle" [
      "stroke"
    ],
    defClass "Paint" [
      defConstructor "" [],
      var "PaintingStyle" "style",
      var double "strokeWidth"
    ],
    defClass "Offset" [
      defConstructor "" [positional double "dx", positional double "dy"],
      final double "dx",
      final double "dy"
    ],
    defClass "Size" [
      final double "width",
      final double "height"
    ],
    defClass "Path" [
      defConstructor "" [],
      defIO "moveTo" [positional double "x", positional double "y"] void,
      defIO "lineTo" [positional double "x", positional double "y"] void
    ],
    defClass "Velocity" [
      final "Offset" "pixelsPerSecond"
    ],
    defEnum "TextAlign" ["left", "right", "center", "start", "end", "justify"]
  ],
  defLib gestures [
    defClass "TapDownDetails" [
      final "Offset" "globalPosition",
      final "Offset" "localPosition"
    ],
    defClass "TapUpDetails" [
      final "Offset" "globalPosition",
      final "Offset" "localPosition"
    ],
    defClass "LongPressStartDetails" [
      final "Offset" "globalPosition",
      final "Offset" "localPosition"
    ],
    defClass "LongPressMoveUpdateDetails" [
      final "Offset" "localOffsetFromOrigin",
      final "Offset" "localPosition"
    ],
    defClass "LongPressEndDetails" [
      final "Offset" "globalPosition",
      final "Offset" "localPosition"
    ]
  ]
]

main : IO ()
main = renderModule flutter
