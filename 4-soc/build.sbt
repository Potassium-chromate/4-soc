// build.sbt

// 1. 設定全域版本資訊
ThisBuild / scalaVersion     := "2.13.10"
ThisBuild / version          := "0.1.0"
ThisBuild / organization     := "tw.edu.ncku"

// 2. 定義 Chisel 版本
val chiselVersion = "3.6.1"

// 3. 定義單一 Root 專案 (對應你目前的 src/ 資料夾)
lazy val root = (project in file("."))
  .settings(
    name := "4-soc",
    
    // 加入 Chisel 函式庫依賴
    libraryDependencies ++= Seq(
      "edu.berkeley.cs" %% "chisel3" % chiselVersion,
      "edu.berkeley.cs" %% "chiseltest" % "0.6.0" % "test",
      "edu.berkeley.cs" %% "firrtl" % "1.6.0" // 根據你的範本保留此項
    ),
    
    // Scala 編譯器選項
    scalacOptions ++= Seq(
      "-language:reflectiveCalls",
      "-feature",
      "-Xcheckinit",
      "-deprecation",
      "-Wconf:cat=deprecation:s" // 忽略部分過時語法的警告
    ),
    
    // *** 非常重要：加入 Chisel 編譯器外掛 ***
    addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % chiselVersion cross CrossVersion.full)
  )
