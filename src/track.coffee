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
    template = _.template """
      <% _.each(beats, function(name) { %>
        <div class='beat'>&nbsp</div>
      <% }); %>
    """
    @$el.html template({beats: _.range(200)})
    @

window.Track = Track
