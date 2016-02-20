# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

update_disabled_players = ->
  if $('#all_players').length > 0
    $("option", '#all_players').attr('disabled', false)

    $('[name*="player_id"]', '.participants_table').each (i, item) ->
      $("option[value='#{$(item).val()}']", '#all_players').attr('disabled', true)

    $('#all_players').val('')
$(update_disabled_players)


$ ->
  $('.add_fields').on 'click', (event) ->
    event.preventDefault()

    if $('#all_players option:selected').text() == ''
      alert('No player selected')
    else
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')

      $('.participants_table').append($(this).data('fields').replace(regexp, time))

      # Update player name
      last_row = $('.participants_table tr').last()

      $('.playerName', last_row).text($('#all_players option:selected').text())
      $('[name*="player_id"]', last_row).val($('#all_players').val())

      update_disabled_players()
