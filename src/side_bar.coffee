class Sidebar extends Backbone.View
  id: "sidebar"

  initialize: ->
    console.log "Loading side bar"

  events: ->
    "click .tab": "changeTabs"

  render: ->
    @$el.html """
      <div class='tab_container'>
        <div class='tab_cover'>
          <a href='#' class='tab active'>Composer</a>
         	<a href='#' class='tab'>Library</a>
        </div>
      </div>
    """
    library = new Library
    @$el.find(".tab_container").append library.render().el
    library.$el.hide()
    composer = new Composer
    @$el.find(".tab_container").append composer.render().el    
    @

  changeTabs: (e) ->
    e.preventDefault()
    @$el.find(".tab_cover>a").toggleClass 'active'
    if e.currentTarget.innerHTML == 'Composer'
      @$el.find("#composer").show()
      @$el.find("#library").hide()
    else
      @$el.find("#library").show()
      @$el.find("#composer").hide()   

   
window.Sidebar = Sidebar