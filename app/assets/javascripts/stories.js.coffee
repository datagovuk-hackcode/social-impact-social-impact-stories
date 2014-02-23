class window.StoryCreator
  constructor: ->
    console.log 'in story creator'
    $('.add-more-story-text').on 'click', @add_story_block
    $('.add-story-video').on 'click', @add_video_block
    $('.add-story-photo').on 'click', @add_photo_block

  add_story_block: =>
    current_last_element = $('.story-element').last()
    story_container = $('.story-container')
    blank_story_block = $("<div class='story-element' />")
    text_area = $("<textarea class='stylised-textarea'/>")
    blank_story_block.append text_area
    story_container.append blank_story_block

  add_photo_block: =>
    current_last_element = $('.story-element').last()
    story_container = $('.story-container')
    blank_story_block = $("<div class='story-element' />")
    text_area = $("<form><input type='file'/></form>")
    blank_story_block.append text_area
    story_container.append blank_story_block

  add_video_block: =>
    current_last_element = $('.story-element').last()
    story_container = $('.story-container')
    blank_story_block = $("<div class='story-element' />")
    text_area = $("<form><input type='file'/></form>")
    blank_story_block.append text_area
    story_container.append blank_story_block