init = ->
  $container = $('#container')
  $container.isotope {itemSelector: '.story', layoutMode: 'masonry'}
  window.story_creator = new StoryCreator if $('.stories-new-form')[0]

$(document).ready(init)
$(document).on('page:load', init)