import sbt._
import Keys._
import PlayProject._
import org.ensime.sbt.Plugin.Settings.ensimeConfig
import org.ensime.sbt.util.SExp._

object ApplicationBuild extends Build {

    val appName         = "funding-facilitator"
    val appVersion      = "1.0-SNAPSHOT"

    val appDependencies = Seq(
	  "com.novus" % "salat-core_2.9.1" % "0.0.8-SNAPSHOT",
	  "org.mockito" % "mockito-all" % "1.9.0"
    )

    val main = PlayProject(appName, appVersion, appDependencies, mainLang = SCALA).settings(
	  // ensime config
      ensimeConfig := sexp(
		// formatter, make sure to keep in sync settings with eclipse settings
		key(":formatting-prefs"), sexp(
          key(":alignSingleLineCaseStatements"), true)))

}
