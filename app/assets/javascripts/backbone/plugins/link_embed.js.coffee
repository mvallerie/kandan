class Kandan.Plugins.LinkEmbed

  @options:
    regexSimpleLink: /(http?\S*)/g
    regexComplexLink: /\[((?:\S\s?)*)\]\((http?\S*)\)/g

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, state)=>
      message.content = message.content
        .replace(@options.regexSimpleLink, '<a target="_blank" href="$1">$1</a>')
        .replace(@options.regexComplexLink, '<a target="_blank" href="$1">$2</a>')
      return Kandan.Helpers.Activities.buildFromMessageTemplate(message)
