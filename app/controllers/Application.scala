package controllers

import play.api._
import play.api.mvc._
import play.api.Play._

object Application extends Controller {

  def index = Action {
    Ok(views.html.index("Your new application is ready."))
  }

  def testScripts = Action {
    if (Play.isProd) {
      BadRequest
    } else {
      Ok(views.html.jasmine())
    }
  }

}
