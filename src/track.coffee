class Track extends Backbone.View
  className: "track"
  initialize: ->
    console.log "Loading track"
    @trackTemplate = _.template """
    <div>
      <span> <%= name %> </span>
      <div class='track'>
        <% _(numBeats).times(function() { %>
          <div class='beat'></div>
        <% }); %>
      </div>
    </div>
    """

  render: ->
    @$el.html @trackTemplate({numBeats: 200})
    @

window.Track = Track
