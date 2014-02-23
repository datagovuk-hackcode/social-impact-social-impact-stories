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
    result_field = $("<div class='result'/>")
    upload_field.on 'change', @show_photo_preview
    uploader_form.append upload_field
    uploader_form.after result_field


  show_photo_preview: (event) =>
    console.log 'show photo preview'
    # console.log event
    # console.log $(event.currentTarget).val()
    # input_element = $(event.currentTarget)
    # console.log input_element
    # img = $('<img/>')
    # fr = new FileReader
    # console.log img
    # img.source = fr.readAsDataURL $(event.currentTarget)[0].files.item(0)
    # console.log img.source
    # input_element.after img

    files = event.target.files
    output = event.currentTarget

    i = 0

    while i < files.length
      file = files[i]
      
      #Only pics
      continue  unless file.type.match("image")
      picReader = new FileReader()
      picReader.addEventListener "load", (event) ->
        picFile = event.target
        div = document.createElement("div")
        div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" + "title='" + picFile.name + "'/>"
        $(output).after div, null
        return
      
      #Read the image
      picReader.readAsDataURL file
      i++
