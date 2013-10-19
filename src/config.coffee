#Set the require.js configuration for your application.
require.config
  deps: ["backbone", "handlebars", "backbone_handlebars", "main"]

  paths:
    underscore: "../underscore/underscore-min"
    backbone: "../backbone/backbone-min"
    backbone_handlebars: "../backbone.handlebars/dist/backbone.handlebars.min"
    handlebars: "../handlebars/handlebars"
    
  hbs:
    templateExtension : 'hbs'
    disableI18n: true
              
  shim:
    underscore:
      exports: "_"
    backbone:
      deps: ["underscore"]
      exports: "Backbone"
    backbone_handlebars:
      deps: ["backbone"]