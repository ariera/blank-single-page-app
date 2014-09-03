requirejs.config
  urlArgs: "bust=" + (new Date()).getTime()
  baseUrl: "/"
  paths:
    angular: 'vendor/bower_components/angular/angular',
    underscore: "vendor/bower_components/underscore/underscore"
    bootstrap: "vendor/bower_components/bootstrap-sass-official/assets/javascripts/bootstrap"
    jquery: "vendor/bower_components/jquery/dist/jquery"

  shim:
    bootstrap:
      deps: ["jquery"]
    underscore:
      exports: ["_"]
    jquery:
      exports: ["$", "jQuery"]
    angular:
      exports: ["angular"]
