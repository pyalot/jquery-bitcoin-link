$ = jQuery

openDialog = (address, amount) ->
    overlay = $('<div class="bitcoin-link-overlay"></div>')
        .appendTo('body')
        .click ->
            container.remove()
            overlay.remove()

    container = $('<div class="bitcoin-link"></div>')
        .appendTo('body')

    if amount?
        if amount[0] == '$'
            title = $("<h1>Send #{amount} = <span>?</span> <a href='http://bitcoin.org/'>Bitcoins</a></h1>")
                .appendTo(container)
            span = title.find('span')
            $.getJSON 'http://data.mtgox.com/api/1/BTCUSD/ticker', (event) ->
                converted = parseFloat(amount[1..])/parseFloat(event.return.avg.value)
                if converted >= 1
                    display = converted.toFixed(3)
                else
                    exponent = Math.floor(Math.log(converted)/Math.log(10))-2
                    display = converted.toFixed(-exponent)
                span.text(display)
        else
            title = $("<h1>Send #{amount} <a href='http://bitcoin.org/'>Bitcoins</a></h1>")
                .appendTo(container)
    else
        title = $('<h1>Send <a href="http://bitcoin.org/">Bitcoins</a></h1>')
            .appendTo(container)

    $('<div class="close">X</div>')
        .appendTo(container)
        .click ->
            container.remove()
            overlay.remove()

    $('<h1></h1>')
        .text(address)
        .appendTo(container)

    buttons = $('<div class="buttons"></div>')
        .appendTo(container)
    
    $("<a href='bitcoin:#{address}'>Open</a>")
        .appendTo(buttons)
   
    $("<a href='http://blockchain.info/address/#{address}'>Blockchain.info</a>")
        .appendTo(buttons)

    qrsize = 200

    $('<div></div>')
        .qrcode(width: qrsize, height: qrsize, text:address)
        .appendTo(container)

    container.css
        marginLeft: -container.width()/2
        marginTop: -container.height()/2
           
$.fn.bitcoinLink = ->
    @each ->
        elem = $(@)
        href = elem.attr('href')
        match = href.match(/bitcoin:([13][123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz]+)/)
        if match?
            address = match[1]
            amount = elem.attr('data-amount') ? elem.data('amount')
            elem
                .click (event) ->
                    event.stopPropagation()
                    event.preventDefault()
                    openDialog address, amount
                    return false
