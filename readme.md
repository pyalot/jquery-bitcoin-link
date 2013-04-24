jquery.bitcoin-link.js
======================

This library allows you to handle bitcoin links on your website.

Like it?
--------

Send me some bitcoins: 14rqCoRQcyEaoaXjc8iLwa2s7HNHGjiEjp

Features
--------

 * Style bitcoin links, only applies to href with "bitcion:..."
 * Provide a popup with information
 * Displays QR-Code
 * Bitcoin Address
 * Link to blockchain
 * Link to open with the bitcoin protocol

Example
-------

 * Source: https://github.com/pyalot/jquery-bitcoin-link/blob/master/index.html
 * Github pages: http://pyalot.github.io/jquery-bitcoin-link/
 * Live: http://codeflow.org/bitcoin/link/

Dependencies
------------

The library depends on

 * jQuery: http://jquery.com/
 * jquery.qrcode: http://jeromeetienne.github.io/jquery-qrcode/

How to Use
----------

Include the dependencies into the head tag on your website.

```html
<link rel="stylesheet" href="res/bitcoin-link.css"></link>
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/jquery.qrcode.min.js"></script>
<script src="jquery.bitcoin-link.js"></script>
```

Add a bitcoin link anywhere

```html
<a class="bitcoin-address" href="bitcoin:14rqCoRQcyEaoaXjc8iLwa2s7HNHGjiEjp">Styled Link</a>
```

Invoke the jQuery plugin to attach the behavior to the link

```javascript
$('a').bitcoinLink()
```

Options
-------

Add a link style with the class "bitcoin-address"

```html
<a class="bitcoin-address" href="bitcoin:14rqCoRQcyEaoaXjc8iLwa2s7HNHGjiEjp">Link</a>
```

Set a bitcoin amount to display

```html
<a data-amount="0.1" href="bitcoin:14rqCoRQcyEaoaXjc8iLwa2s7HNHGjiEjp">Link</a>
```

Set a USD amount to display (queries MtGox for conversion)

```html
<a data-amount="$10" href="bitcoin:14rqCoRQcyEaoaXjc8iLwa2s7HNHGjiEjp">Link</a>
```

License MIT/BSD
---------------

Copyright (c) 2013, Florian Boesch <pyalot@gmail.com> http://codeflow.org/

* MIT: see license/mit
* BSD: see license/bsd
