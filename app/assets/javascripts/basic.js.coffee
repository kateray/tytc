stickyHeaders = ->
  $('.language-container').each ->
    $el = $(this)
    fromTop = $el.offset().top
    scrollTop = $(window).scrollTop() + $('.navbar').height()
    floatingHeader = $(".sticky", this)

    if (scrollTop > fromTop) and (scrollTop < fromTop + $el.height())
      floatingHeader.css visibility: "visible"
    else
      floatingHeader.css visibility: "hidden"

vote = (e) ->
  e.stopPropagation()
  $el = $(this).closest('.link')
  linkId = $el.data('id')

  $.post "/votes",
    vote: link_id: linkId
    , (data) ->
      $el.find('.user-votes').append(data)

ready = ->
  $('.link-container').click ->
    $(this).find('.link-expanded').collapse('toggle')

  $(".language-container").each ->
    $clonedHeaderRow = $(".heading", this)
    $clonedHeaderRow.before($clonedHeaderRow.clone()).addClass("sticky").css('top', $('.navbar').height())
    return

  $(window).scroll(stickyHeaders)

  $('.vote-button').click(vote)

$(document).ready(ready)
$(document).on('page:load', ready)
