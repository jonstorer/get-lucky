class Composer extends Backbone.View
  id: "composer"

  initialize: ->
    console.log "Loading composer"

    @inputTemplate = """
      <h3>Composer</h3>
      <form id='repl'>
        <input name='title' type='text'>
        <textarea rows='10 name='sample' id='sample''></textarea>
        <input type='submit' value='Play'/>
        <a href="#">Save</a>
      </form>
    """

  events: ->
    "submit #repl": "replEval"

  render: ->
    @$el.html @inputTemplate
    @

  replEval: (e) ->
    e.preventDefault()
    sample = new Function(@$('textarea').val())
    sample.name = @$('input[type=text]').val()

    Exchange.trigger 'new sample', new Sample(sample: sample)

window.Composer = Composer
