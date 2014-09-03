# Blank single page app
A complete app that already has support for

* [jQuery - a fast, small, and feature-rich JavaScript library](http://jquery.com/)
* [Bootstrap - a sleek, intuitive, and powerful mobile first front-end framework for faster and easier web development](http://getbootstrap.com/)
* [Underscore - a JavaScript library that provides a whole mess of useful functional programming helpers without extending any built-in objects](http://underscorejs.org/)
* [Slim - A lightweight templating engine](http://slim-lang.com/)
* [RequireJS - A JavaScript file and module loader](http://requirejs.org/)
* [CoffeeScript is a little language that compiles into JavaScript](http://coffeescript.org/)
* [Sass - CSS with superpowers](http://sass-lang.com/)
* [Font Awesome - The iconic font and CSS toolkit](http://fortawesome.github.io/Font-Awesome/)

### How it works
We are using some components to guarantee a flawless development

* [npm - Node Packaged Modules](https://www.npmjs.org/)
* [Bower - A package manager for the web](http://bower.io/)
* [GRUNT - JavaScript Task Runner](http://gruntjs.com/)


### Quickstart
The quickstart requires that you have some basic packages installed on your mac.
If there are any erros take a look at the Dev-Setup Section.
```
npm install
bower install
grunt dev watch
http-server
```


### Dev-Setup

On Mac OSX you can easily use [homebrew](http://brew.sh/) to install that stuff needed.

### npm
We use the npm package manager to manage dependencies and tools needed.

```
brew install node
brew install npm
```

npm reads the [package.json]() file.
To install all the packacges just run

```
npm install
```


### Grunt
We use Grunt to automate less compiling. It is also needed for JavaScript concatenation and compressing. It will also copy relevant files to the public directory

To install Grunt's command line interface run:

```
sudo npm install -g grunt-cli
```

With the flag -g you installed it globally and now you can access it from anywhere on your system.


### Bower
Bower is a frontend package management system (e.g. Bootstrap, Jquery etc.).
Bower defines its dependencies in its [bower.json]() file.

Installing bower couldn't be simpler. Just install it with npm:

```
sudo npm install -g bower
```

Aferwars you must install the packages defined in [bower.json]().

```
bower install
```
This command will download the source-files to ```/bower_components```. This directory is ignored by git.


### Slim

We use Slim as the most minimalistic Templating-Engine ever.

_Run this task with the `grunt slim` command._

This task requires you to have [Ruby](http://www.ruby-lang.org/en/downloads/) and [Slim](http://slim-lang.com/). If you're on OS X or Linux you probably already have Ruby installed, try `ruby -v` in your terminal. When you've confirmed you have Ruby installed, run `gem install slim` to install Slim.

If you haven't it is recommended to install ruby via [rbenv](http://rbenv.org/)


### Compile less

We use Grunt to watch changes within our less- and js-files. Run the Tasks:

```
grunt dev
grunt dist
```
The dev-task won't uglify the assets. The dist-task will compress all files.

Whenever a file changes, Grunt will go ahead, compile the less-files into css and compresses it to our ```/public/```folder.

Start Developing:

```
grunt dev watch
```

Run a local http-server
```
http-server
```

### Copy Assets
When you have to add images or other assets to your project place them in ```/assets```.

You have to copy them into the public directory
```
grunt dev
```


### Workflow and contribution
All the development should happen in separated branches per feature. When a feature is ready please send a pull-request to merge your branch into the ```develop``` branch.
When everything is up and running we will merge the develop branch into ```master```.
