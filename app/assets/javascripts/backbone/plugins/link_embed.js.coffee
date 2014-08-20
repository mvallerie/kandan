class Kandan.Plugins.LinkEmbed

  @options:
    simpleLink: /(^| )(http?[^\s<>]*)/g
    complexLink: /\[((?:\S\s?)*)\]\((http?\S*)\)/g

  @init: ()->
    Kandan.Modifiers.register @options, (message, activity) =>
      message = message.replace(@options.simpleLink, '$1<a target="_blank" href="$2">$2</a>')
      message = message.replace(@options.simpleLink, '<a target="_blank" href="$2">$1</a>')
      message
