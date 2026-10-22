# Flutter
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# shared_preferences
-keep class io.flutter.plugins.sharedpreferences.** { *; }

# Kotlin (كلها)
-keep class kotlin.** { *; }
-keep interface kotlin.** { *; }
-keep class kotlinx.coroutines.** { *; }
-dontwarn kotlin.**
-dontwarn kotlinx.coroutines.**

# Play Core (Deferred Components)
-dontwarn com.google.android.play.core.**