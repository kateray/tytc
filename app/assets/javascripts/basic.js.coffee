stickyHeaders = ->
  $('.language-container').each ->
    console.log 'hrm'
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
  baseUrl = history.state.url

  $('.link').click ->
    $(this).find('.link-expanded').collapse('toggle')

  $(".link-expanded").on "shown.bs.collapse", ->
    history.pushState('', '', $(this).closest('.link').data('url'))

  $(".link-expanded").on "hidden.bs.collapse", ->
    history.pushState('', '', baseUrl)

  window.onpopstate = (event) ->
    if location.pathname.match(/\/links\/(.*)/)
      linkID = location.pathname.match(/\/links\/(.*)/)[1]
      $el = $('.link[data-id="'+linkID+'"]')
      $el.find('.link-expanded').addClass('in')
      $('body').scrollTop($el.position().top)

  if $('body').hasClass('home')
    $(".language-container").each ->
      $clonedHeaderRow = $(".heading", this)
      $clonedHeaderRow.before($clonedHeaderRow.clone()).addClass("sticky").css('top', $('.navbar').height())
      return

    $(window).scroll(stickyHeaders)

  $('.vote-button').click(vote)

  # $('a').click (e) ->
  #   if !@hash? || window.location.pathname != @pathname
  #     return
  #
  #   targetOffset = $(@hash).offset().top
  #
  #   $('body, html')
  #     .stop()
  #     .animate(
  #       { scrollTop: targetOffset },
  #       400,
  #       =>
  #         window.history.replaceState(null, null, this.href)
  #     )
  #
  #   return false

  $('.new-link').delay(2500).css('background-color', 'inherit')


$(document).ready(ready)
$(document).on('page:load', ready)
