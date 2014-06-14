class PriceNotificationForm
  constructor: ->
    @bind_events()

  bind_events: =>

$ -> new PriceNotificationForm if $("#price-notification-form")