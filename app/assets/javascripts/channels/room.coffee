$(document).on 'turbolinks:load', ->
  room = $('#messages').data('room')
  room_id = $('#messages').data('room-id')
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: room },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $("#messages[data-room=#{room}").append data['message']

    speak: (message) ->
      @perform 'speak', message: message, room_id: room_id


$(document).on 'keypress', '[data-behavior=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
