class Sample extends Backbone.View
  className: 'sample'

  initialize: (options) ->
    for key, value of options
      @[key] = value

    @sampleTemplate = _.template """
      <div class='sample' data-id=''>
        <%= title %>
      </div>
    """

  render: ->
    view = @sampleTemplate(@sample)
    @$el.data('view', @)
    @$el.html view
    @

window.Sample = Sample
