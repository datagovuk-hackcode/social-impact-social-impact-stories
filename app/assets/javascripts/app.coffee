init = ->
  $container = $('#container')
  $container.isotope {itemSelector: '.story', layoutMode: 'fit-columns'}
  window.story_creator = new StoryCreator if $('.stories-new-form')[0]

  $('.interactions input[type=checkbox]').tzCheckbox({labels:['Enable','Disable']})

$(document).ready(init)
$(document).on('page:load', init)