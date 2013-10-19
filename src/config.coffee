#Set the require.js configuration for your application.
require.config
  deps: ["main"]

  paths:
    # JavaScript folders.
    src: "../src"
    plugins: "../src/plugins"

    # Libraries.
    underscore: "../underscore/underscore-min"
    backbone: "../backbone/backbone-min"
    
  hbs:
    disableI18n: true
              
  shim:
    underscore:
      exports: "_"
    backbone:
      deps: ["underscore"]
      exports: "Backbone"