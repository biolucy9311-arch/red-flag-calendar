plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") // ✅ Necesario para Google Sign-In
}

android {
    namespace = "com.example.redflag_calendar"
    compileSdk = 35
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.redflag_calendar"
        minSdk = 23
        targetSdk = 35
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        // ML Kit – evita errores con R8 y multidex
        multiDexEnabled = true
    }

    // 🔥 Necesario si usas ML Kit, Stripe y ProGuard
    packagingOptions {
        resources {
            excludes += "META-INF/*"
        }
    }

    buildTypes {
        release {
            // ❗ Usa tu keystore real aquí
            signingConfig = signingConfigs.getByName("debug")

            // Activar R8 + ProGuard
            isMinifyEnabled = true
            isShrinkResources = true

            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }

        debug {
            isMinifyEnabled = false
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("com.google.android.gms:play-services-auth:20.7.0") // Autenticación con Google
    implementation("com.google.firebase:firebase-firestore:25.0.0")   // Firestore
    implementation("com.google.firebase:firebase-storage:21.0.0")     // Firebase Storage
    implementation("com.google.android.gms:play-services-ads:22.2.0") // Google Mobile Ads
}
