class Library extends Backbone.View
  id: 'library'

  initialize: ->
    @samples = []

    Exchange.on 'new.sample', (sample) =>
      console.log 'called'
      @$el.append sample.render().$el
      $(sample.render().el).draggable
        snap: '.beat',
        snapTolerance: 10

  render: ->
    @$el.html '<h3>Library</h3>'
    @

window.Library = Library
