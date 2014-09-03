module.exports = (grunt) ->
  grunt.initConfig
    ## COFFEE #############################################################################
    coffee:
      glob_to_multiple:
        expand: true
        flatten: true
        bare: true
        cwd: './app/assets/js'
        src: ['*.coffee']
        dest: './public/assets/js'
        ext: '.js'
    ## LESS ##############################################################################
    sass:
      dist:
        options:
          style: 'compressed' #minifying the result
        files:
          "./public/assets/css/app-frontend.css": "./app/assets/sass/app-frontend.scss"
      dev:
        files:
          "./public/assets/css/app-frontend.css": "./app/assets/sass/app-frontend.scss"

    ## UGLIFY #############################################################################
    uglify:
      options:
        mangle: false # Use if you want the names of your functions and variables unchanged
      js_frontend:
        files:
          "./public/assets/js/app-frontend.js": "./public/assets/js/app-frontend.js"

    ## SLIM ###############################################################################
    slim:
      dev:
        options: # Target options
          pretty: true
        files:
          "./public/index.html": "./app/views/index.slim"
      dist:
        options: # Target options
          pretty: false
        files:
          "./public/index.html": "./app/views/index.slim"

    ## WATCH ###############################################################################
    watch:
      js_frontend:
        files: ["./app/assets/js/*.coffee"] #watched files
        tasks: ["coffee:glob_to_multiple", "copy:dev"]
        options:
          livereload: true

      sass:
        files: ["./app/assets/sass/*.scss", "./app/assets/sass/*.sass"] # watched files
        tasks: ["sass:dev"]
        options:
          livereload: true # reloads the browser

      views:
        files: ["./app/views/*.slim"]
        tasks: ["slim:dev"]

    ## COPY ################################################################################
    copy:
      dev:
        files: [
          {
            expand: true
            src: [
              "./app/assets/img/**"
              "./app/assets/js/**"
            ]
            dest: "./public/"
          }
          {
            expand: true
            flatten: true
            src: ["./app/views/*.html"]
            filter: "isFile"
            dest: "./public/"
          }
        ]
      vendors:
        files: [
          {
            expand: true
            src: ["./bower_components/**"]
            dest: "./public/vendor/"
          }
          {
            expand: true
            flatten: true
            src: "./bower_components/r.js/require.js"
            dest: "./public"
          }
        ]

  ## PLUGIN LOADING ###########################################################################
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-slim"

  ## TASK DEFINITION ##########################################################################
  grunt.registerTask "default", ["watch"]
  grunt.registerTask "dev"    , ["coffee:glob_to_multiple", "slim:dev", "sass:dev", "copy:vendors", "copy:dev"]
  grunt.registerTask "dist"   , ["slim:dist", "sass:dist", "uglify", "copy"]
  return
