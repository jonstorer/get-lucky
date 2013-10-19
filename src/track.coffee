class Track extends Backbone.View
  className: "track-container"

  initialize: (options) ->
    for key, value of options
      @[key] = value

    @trackTemplate = _.template """
    <span> <%= title %> </span>
    <div class='track'>
      <div class='beat-path'>
      </div>
    </div>
    """
    @beatTemplate = _.template "<div class='beat'></div>"

  render: ->
    @$el.html @trackTemplate(@)
    _(200).times =>
      @$el.find('.beat-path').append @beatTemplate()

    @

window.Track = Track
