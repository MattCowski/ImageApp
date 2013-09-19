# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  new AvatarCropper()
  
class AvatarCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update
    
  update: (coords) =>
    $('#painting_crop_x').val(coords.x)
    $('#painting_crop_y').val(coords.y)
    $('#painting_crop_w').val(coords.w)
    $('#painting_crop_h').val(coords.h)
    @updatePreview(coords)
    
  updatePreview: (coords) =>
    $('#preview').css
      width: Math.round(100/coords.w * $('#cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#cropbox').height()) + 'px'  
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
# Below code is from failed jquery multi uploader
# jQuery ->
#   $('#new_painting').fileupload
#     dataType: "script"
#     add: (e, data) ->
#       types = /(\.|\/)(gif|jpe?g|png)$/i
#       file = data.files[0]
#       if types.test(file.type) || types.test(file.name)
#         data.context = $(tmpl("template-upload", file))
#         $('#new_painting').append(data.context)
#         data.submit()
#       else
#         alert("#{file.name} is not a gif, jpeg, or png image file")
#     progress: (e, data) ->
#       if data.context
#         progress = parseInt(data.loaded / data.total * 100, 10)
#         data.context.find('.bar').css('width', progress + '%')