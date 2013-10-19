class Composer extends Backbone.View
  id: "composer"

  initialize: ->
    console.log "Loading composer"
    @sampleTemplate = _.template """
      <div class='sample' data-id=''>
      </div>
    """

    @stage = soundrepl.create()
  events: ->
    "submit #repl": "replEval"

  render: ->
    @$el.html """
      <h3>Composer</h3>
      <form id='repl'>
        <input type='text'>
        </input>
        <textarea rows=10>
        </textarea>
        <input type='submit' value='Commit'/>
      </form>

      """
    @

  replEval: (e) ->
    e.preventDefault()
    console.log "Repl eval!"

window.Composer = Composer
