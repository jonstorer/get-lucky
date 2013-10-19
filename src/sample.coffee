class Sample extends Backbone.View
  className: 'sample'

  initialize: (options) ->
    for key, value of options
      @[key] = value

    @sampleTemplate = _.template """
      <div class='sample' data-id=''>
        <%= name %>
      </div>
    """

  render: ->
    view = @sampleTemplate(@sample)
    $(view).data('view', @)
    @$el.html view
    @

window.Sample = Sample
