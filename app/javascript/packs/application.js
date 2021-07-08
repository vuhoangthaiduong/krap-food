// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "bootstrap"
import "select2"
require("jquery-ui")
import "../stylesheets/application.css"
import "./customer/custom.js"
import "./customer/order_online"
import "./custom.js"

const images = require.context('../images', true)

window.$ = window.jQuery = require("jquery");

Rails.start()
ActiveStorage.start()
