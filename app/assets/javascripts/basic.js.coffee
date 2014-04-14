stickyHeaders = ->
  $('.block-container').each ->
    $el = $(this)
    fromTop = $el.offset().top
    scrollTop = $(window).scrollTop()
    $header = $(".language-heading-name", this)
    $floatingHeader = $(".sticky", this)

    if ($el.hasClass('special-footer')) and (scrollTop > fromTop - 150) and (scrollTop < fromTop + $el.height())
      if $('body').hasClass('home')
        $('.sticky').css visibility: "hidden"
        $floatingHeader.css visibility: "visible"
    else
      if (scrollTop > fromTop) and (scrollTop < fromTop + $el.height())
        $floatingHeader.css visibility: "visible"
        $header.css("z-index", 5)

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

  $(window).scroll(stickyHeaders)

  $('.vote-button').click(vote)

  $('a').click (e) ->
    if !@hash? || window.location.pathname != @pathname
      return

    targetOffset = $(@hash).offset().top

    $('body, html')
      .stop()
      .animate(
        { scrollTop: targetOffset },
        400,
        =>
          window.history.replaceState(null, null, this.href)
      )
    return false

  $('.new-link').delay(2500).css('background-color', 'inherit')


$(document).ready(ready)
$(document).on('page:load', ready)
