class Composer extends Backbone.View
  id: "composer"

  initialize: ->
    @repl = soundrepl.init(window.ac)

    @inputTemplate = """
      <h3>Composer</h3>
      <form id='repl'>
        <label for='name'>Name</label>
        <input name='name' type='text'/>
        <label for='repl'>Repl</label>
        <input type='text' name='repl'/>
        <input type='submit' value='Play' style='display: inline-block;'/>
        <a id='addToLibrary' href='#'>Save</a>
      </form>
    """

  events: ->
    "submit #repl":        "submitReplEval"
    "click #addToLibrary": "addToLibrary"
    "keypress :input":     "keyReplEval"

  render: ->
    @$el.html @inputTemplate
    @

  keyReplEval: (e) ->
    if e.keyCode == 13
      e.preventDefault()
      @replEval()

  submitReplEval: (e) ->
    e.preventDefault()
    @replEval()

  replEval: ->
    console.log "Eval repl"
    code = @$el.find('input[name=repl]').val()
    try
      sample = new Function('sample', "return #{code}")(@repl.create)
      sample?.play?() || @repl.create(sample).play(bpm)
    catch err
      window.alert(err)

  addToLibrary: (e) ->
    e.preventDefault()
    code         = @$el.find('input[name=repl]').val()
    title        = @$el.find('input[name=name]').val()
    sample       = new Function('sample', "return #{code}")
    sample.title = title
    Exchange.trigger 'new.sample', new Sample(sample: sample)

window.Composer = Composer
