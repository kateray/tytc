stickyHeaders = ->
  $('.language-container').each ->
    $el = $(this)
    fromTop = $el.offset().top
    scrollTop = $(window).scrollTop() + $('.navbar').height()
    $header = $(".heading", this)
    $floatingHeader = $(".sticky", this)

    if (scrollTop > fromTop) and (scrollTop < fromTop + $el.height())
      $floatingHeader.css visibility: "visible"
      $header.css("z-index", 8)

    else
      $floatingHeader.css visibility: "hidden"
      $header.css("z-index", 10)


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

  if $('body').hasClass('index')
    $(".language-container").each ->
      $clonedHeaderRow = $(".heading", this)
      $clonedHeaderRow.before($clonedHeaderRow.clone()).addClass("sticky").css('top', $('.navbar').height())
      return

    $(window).scroll(stickyHeaders)

  $('.vote-button').click(vote)

$(document).ready(ready)
$(document).on('page:load', ready)
