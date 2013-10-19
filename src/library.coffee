class Library extends Backbone.View
  id: 'library'

  initialize: ->
    console.log 'library loading'
    @samples = []

    Exchange.on 'new sample', (sample) =>
      console.log 'hit'
      @$el.append sample.render().el
      $(sample.render().el).draggable
        snap: '.beat',
        snapTolerance: 10
        stop: -> console.log arguments

  render: ->
    @$el.html '<h3>Library</h3>'
    @

window.Library = Library
