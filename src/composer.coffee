define [], () ->
  class Composer extends Backbone.View
    id: "composer"
    
    initialize: ->
      console.log "Loading composer"

    events: ->
      "submit #repl": "replEval"

    render: ->
      @$el.html _.template """
        <h3>Composer</h3>
        <form id='repl'>
          <textarea rows=10></textarea>
          <input type='submit' value='Eval'/>
        </form>

        """
      @

    replEval: (e) ->
      e.preventDefault()
      console.log "Repl eval!"
      