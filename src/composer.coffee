class Composer extends Backbone.View
  id: "composer"

  initialize: ->
    console.log "Loading composer"
    @repl = soundrepl.init(window.ac)

    @inputTemplate = """
      <h3>Composer</h3>
      <form id='repl'>
        <label for='title'>Name</label>
        <input name='title' type='text'/>
        <label for='repl'>Repl</label>
        <input type='text' name='repl'/>
        <input type='submit' value='Play' style='display: inline-block;'/>
        <a id='addToLibrary' href='#'>Save</a>
      </form>
    """

  events: ->
    "submit #repl": "submitReplEval"
    "click #addToLibrary": "addToLibrary"
    "keypress :input": "keyReplEval"

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

  replEval: (e) ->
    console.log "Eval repl"
    code = @$el.find('input[name=repl]').val()
    console.log code
    try
      `var input;`
      `input = new Function('sample', 'return ' + code)(this.repl.create);`
      # console.log input
    catch err
      window.alert(err)
    `if (typeof input === 'object' && 'play' in input && typeof input.play === 'function') 
          input.play(bpm);
        else //sound primative
          this.repl.create(input).play(bpm);`
    return 
      
  addToLibrary: (e) ->
    e.preventDefault()
    sample = new Function(@$('input[name=repl]').val())
    sample.name = @$('input[name=name]').val()    
    Exchange.trigger 'new sample', new Sample(sample: sample)

window.Composer = Composer
