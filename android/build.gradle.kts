// 👇 Este bloque va primero, antes de todo lo demás
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.google.gms:google-services:4.4.2") // Plugin de Google Services para autenticación
    }
}

// 👇 Este bloque puedes dejarlo igual
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// 👇 Tu configuración de directorios personalizados
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
