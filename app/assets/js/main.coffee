require ["config"], ->
  require ["jquery", "bootstrap", "assets/js/app"], ($, bootstrap, app) ->
    $(document).ready ->
      app.init()
