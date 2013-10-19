class Composer extends Backbone.View
  id: "composer"

  initialize: ->
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
    sample = new Function(@$el.find('textarea').val())
    sample.title = @$el.find('input[name="title"]').val()
    window.currentSample = sample

    Exchange.trigger 'new sample', new Sample(sample: sample)

window.Composer = Composer
