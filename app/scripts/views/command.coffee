define [
  "underscore"
  "views/base"
  "text!../../templates/command.hbs"
], (
  _
  BaseView
  template
) ->
  class CommandView extends BaseView
    rawTemplate: template
    tagName: "li"
    className: "command"

    events:
      "click": "onClick"

    render: ->
      @$el.html @template(_.extend({}, @model.getTemplateData()))
      this

    onClick: (e) =>
      $target = $ e.target
      return window.location = $target.attr("href") if $target.hasClass "link"
      @model.execute()

