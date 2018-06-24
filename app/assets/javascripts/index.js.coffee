class Notifications
    constructor: ->
      @notifications = $("[data-behavior='notifications']")
      @setup() if @notifications.length > 0

    setup: ->
      $.ajax(
        url: '/notifications.json'
        dataType: 'JSON'
        method: 'GET'
        success: @handleSuccess
      )

    handleSuccess: (data) =>
      console.log(data)
      items = $.map data, (notification) ->
        "<a href='#{notification.path}'>#{notification.actor} #{notification.action} #{notification.notifiable.type}</a></br>"
      $("[data-behavior='notification-items']").html(items)

$(window).on "turbolinks:load", ->
  new Notifications

