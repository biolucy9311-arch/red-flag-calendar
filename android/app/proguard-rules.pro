###########################################
# FLUTTER ENGINE + PLUGINS
###########################################
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugins.** { *; }

###########################################
# FLUTTER PLAY STORE SPLIT / DEFERRED COMPONENTS
###########################################
-keep class io.flutter.embedding.engine.deferredcomponents.** { *; }
-dontwarn io.flutter.embedding.engine.deferredcomponents.**

-keep class com.google.android.play.core.splitcompat.** { *; }
-dontwarn com.google.android.play.core.splitcompat.**

-keep class com.google.android.play.core.splitinstall.** { *; }
-dontwarn com.google.android.play.core.splitinstall.**

-keep class com.google.android.play.core.tasks.** { *; }
-dontwarn com.google.android.play.core.tasks.**

###########################################
# KOTLIN
###########################################
-dontwarn kotlin.**
-dontwarn kotlinx.**
-keep class kotlin.** { *; }
-keep class kotlinx.** { *; }

###########################################
# ANDROIDX
###########################################
-dontwarn androidx.**
-keep class androidx.** { *; }

###########################################
# FIREBASE
###########################################
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# Firestore annotation model protection
-keepclassmembers class * {
    @com.google.firebase.firestore.PropertyName <fields>;
}

###########################################
# GOOGLE MOBILE ADS (AdMob)
###########################################
-keep class com.google.android.gms.ads.** { *; }
-dontwarn com.google.android.gms.ads.**

###########################################
# ML KIT (OCR – all languages)
###########################################
-keep class com.google.mlkit.** { *; }
-dontwarn com.google.mlkit.**

-keep class com.google.mlkit.vision.text.** { *; }
-dontwarn com.google.mlkit.vision.text.**

###########################################
# STRIPE (PaymentSheet + Wallet / NFC)
###########################################
-keep class com.stripe.android.** { *; }
-dontwarn com.stripe.android.**

-keep class com.stripe.android.pushProvisioning.** { *; }
-dontwarn com.stripe.android.pushProvisioning.**

###########################################
# TINK (Ed25519 / X25519 cryptography)
###########################################
-keep class com.google.crypto.tink.** { *; }
-dontwarn com.google.crypto.tink.**

###########################################
# NIMBUS JOSE (Token signing)
###########################################
-keep class com.nimbusds.jose.** { *; }
-dontwarn com.nimbusds.jose.**

###########################################
# GSON
###########################################
-keep class com.google.gson.** { *; }
-dontwarn com.google.gson.**

-keepclassmembers class * {
  @com.google.gson.annotations.SerializedName <fields>;
}

###########################################
# OKHTTP / RETROFIT
###########################################
-dontwarn okhttp3.**
-dontwarn okio.**
-keep class okhttp3.** { *; }
-keep class okio.** { *; }

-dontwarn retrofit2.**
-keep class retrofit2.** { *; }
-keepattributes Signature
-keepattributes Exceptions

###########################################
# COHERE (REST)
###########################################
-keep class com.cohere.** { *; }
-dontwarn com.cohere.**

###########################################
# GENERAL JSON MODELS
###########################################
-keepclasseswithmembers class * {
  public <init>(...);
}

###########################################
# SUPPRESS REFLECTION FAILURES
###########################################
-keepattributes *Annotation*
-keepattributes InnerClasses
-keepattributes EnclosingMethod
