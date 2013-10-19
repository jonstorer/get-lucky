define ["track"], (Track) ->
  class Track extends Backbone.View
    className: "track"
    initialize: ->
      console.log "Loading track"

    render: ->
      template = _.template """
        <% _.each(beats, function(name) { %>
          <div class='beat'>&nbsp</div>
        <% }); %>
        
      """
      @$el.html template({beats: _.range(200)})
      @