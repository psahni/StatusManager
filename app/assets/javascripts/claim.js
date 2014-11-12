/* DO NOT MODIFY. This file was compiled Thu, 29 Aug 2013 17:05:27 GMT from
 * /Users/adalbertgorecki/Development/9elements/nine2011/app/coffeescripts/claimatizer.coffee
 */


(function($){
    $.Claim = function(options){
        var $characters, $claim, $claimCursor, claimIndex, claims, createElements, cursorTimeoutHandler, drawClaim, setClaimHeight, startBlinkingCursor;

        claims = options.items || ['WE CREATE DIGITAL PRODUCTS', 'WE MAKE MOBILE AND WEB APPS', 'WE LOVE ROCKET SCIENCE TECHNOLOGY', 'WE ARE SUPER WIFI HUMAN BEINGS', 'WE ARE STUNTMEN SLASH PROGRAMMERS', 'WE <3 THE TERMINAL AND DESIGN'];
        claimIndex = Math.floor(Math.random() * claims.length);
        claims.sort(function(a, b) {
            return b.length - a.length;
        });
        $claim = $('#claim');
        $characters = null;
        $claimCursor = $('<span id="claimCursor">_ </span>');
        cursorTimeoutHandler = null;
        setClaimHeight = function() {
            var $tmpClaim, backup, c, _i, _len, _ref;

            $tmpClaim = $('<div class="tmpClaim"></div>');
            $claim.css('height', 'auto');
            _ref = claims[0];
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                c = _ref[_i];
                $tmpClaim.append("<span >" + c + "</span>");
            }
            $tmpClaim.append("<span >_ </span>");
            backup = $claim.children().remove();
            $claim.append($tmpClaim);
            $claim.css('height', $claim.height());
            $tmpClaim.remove();
            return $claim.append(backup);
        };
        $(window).resize(function() {
            return setClaimHeight();
        });
        createElements = function() {
            var c, _i, _len, _ref;

            $claim.empty();
            _ref = claims[claimIndex].split('');
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                c = _ref[_i];
                $claim.append("<span class='off'>" + c + "</span>");
            }
            $claim.append($claimCursor);
            return $characters = $claim.children();
        };
        drawClaim = function() {
            var character, characterIndex, timeout, _i, _len, _results,
                _this = this;

            createElements();
            timeout = 0;
            $claimCursor.addClass('off');
            _results = [];
            for (characterIndex = _i = 0, _len = $characters.length; _i < _len; characterIndex = ++_i) {
                character = $characters[characterIndex];
                timeout += Math.floor(Math.random() * 175 + 15);
                _results.push((function(character, timeout, characterIndex) {
                    return setTimeout(function() {
                        $(character).removeClass('off').after($claimCursor);
                        startBlinkingCursor();
                        if (characterIndex === $characters.length - 1) {
                            claimIndex = (claimIndex + 1) % claims.length;
                            return setTimeout(drawClaim, 2000);
                        }
                    }, timeout);
                })(character, timeout, characterIndex));
            }
            return _results;
        };
        startBlinkingCursor = function() {
            if (cursorTimeoutHandler) {
                clearTimeout(cursorTimeoutHandler);
                $claimCursor.removeClass('off');
            }
            return cursorTimeoutHandler = setTimeout(function() {
                $claimCursor.toggleClass('off');
                cursorTimeoutHandler = null;
                return startBlinkingCursor();
            }, 500);
        };
        setClaimHeight();
        return drawClaim();
    };
}(jQuery));

