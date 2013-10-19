$ ->
  window.app = new App
  window.app.render()

  setTimeout ->
    sample       = new Function('var x = 5; return 5 + 4')
    sample.title = 'return9'
    Exchange.trigger 'new sample', new Sample(sample: sample)

  , 100
