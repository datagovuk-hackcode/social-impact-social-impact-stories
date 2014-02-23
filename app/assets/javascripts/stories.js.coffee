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
    text_area = @create_photo_upload_field()
    blank_story_block.append text_area
    story_container.append blank_story_block

  add_video_block: =>
    current_last_element = $('.story-element').last()
    story_container = $('.story-container')
    blank_story_block = $("<div class='story-element' />")
    text_area = $("<form><input type='file'/></form>")
    blank_story_block.append text_area
    story_container.append blank_story_block

  create_photo_upload_field: =>
    uploader_form = $("<form class='photo-upload-form' id='photo-upload-form'></form>")
    upload_field = $("<input type='file' class='photo-upload-input' id='fileupload' />")
    upload_field.on 'change', @show_photo_preview
    uploader_form.append upload_field


  show_photo_preview: (event) =>
    console.log 'show photo preview'
    console.log event
    console.log $(event.currentTarget).val()
    # img = document.createElement("IMG")
    # img.source document.getElementById('submit').files.item(0).getAsDataURL();
