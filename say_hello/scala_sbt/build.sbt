scalaVersion := "2.13.10"
name := "say-hello-scala-sbt"
organization := "io.github.mstream"
version := "1.0.0"
libraryDependencies ++= Seq(
  "org.scalatest" %% "scalatest" % "3.2.14" % "test",
  "org.scalatest" %% "scalatest-funspec" % "3.2.14" % "test",
  "org.scalactic" %% "scalactic" % "3.2.14"
)
mainClass in assembly := Some("Main")
