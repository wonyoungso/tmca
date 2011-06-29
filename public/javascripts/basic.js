
(function($) {

var version = '1.4',
    defaults = {
      exclude: [],
      excludeWithin:[],
      offset: 0,
      direction: 'top', // one of 'top' or 'left'
      scrollElement: null, // jQuery set of elements you wish to scroll (for $.smoothScroll).
                          //  if null (default), $('html, body').firstScrollable() is used.
      scrollTarget: null, // only use if you want to override default behavior
      afterScroll: null,   // function to be called after window is scrolled. "this" is the triggering element
      easing: 'swing',
      speed: 400
    },
    locationPath = filterPath(location.pathname),
    getScrollable = function(opts) {
      var scrollable = [],
          scrolled = false,
          dir = opts.dir && opts.dir == 'left' ? 'scrollLeft' : 'scrollTop';

      this.each(function() {

        if (this == document || this == window) { return; }
        var el = $(this);
        if ( el[dir]() > 0 ) {
          scrollable.push(this);
          return;
        }

        el[dir](1);
        scrolled  = el[dir]() > 0;
        el[dir](0);
        if ( scrolled ) {
          scrollable.push(this);
          return;
        }

      });

      if ( opts.el === 'first' && scrollable.length ) {
        scrollable = [ scrollable.shift() ];
      }

      return scrollable;
    };

$.fn.extend({
  scrollable: function(dir) {
    var scrl = getScrollable.call(this, {dir: dir});
    return this.pushStack(scrl);
  },
  firstScrollable: function(dir) {
    var scrl = getScrollable.call(this, {el: 'first', dir: dir});
    return this.pushStack(scrl);
  },

  smoothScroll: function(options) {
    options = options || {};
    var opts = $.extend({}, $.fn.smoothScroll.defaults, options);
    this.die('click.smoothscroll').live('click.smoothscroll', function(event) {

      var link = this, $link = $(this),
          hostMatch = ((location.hostname === link.hostname) || !link.hostname),
          pathMatch = opts.scrollTarget || (filterPath(link.pathname) || locationPath) === locationPath,
          thisHash = link.hash,
          include = true;


      if ( !opts.scrollTarget && (!hostMatch || !pathMatch || !thisHash) ) {
        include = false;
      } else {
        var exclude = opts.exclude, elCounter = 0, el = exclude.length;
        while (include && elCounter < el) {
          if ($link.is(exclude[elCounter++])) {
            include = false;
          }
        }

        var excludeWithin = opts.excludeWithin, ewlCounter = 0, ewl = excludeWithin.length;
        while ( include && ewlCounter < ewl ) {
          if ($link.closest(excludeWithin[ewlCounter++]).length) {
            include = false;
          }
        }
      }

      if ( include ) {
        opts.scrollTarget = options.scrollTarget || thisHash;
        opts.link = link;
        event.preventDefault();
        $.smoothScroll(opts);
      }
    });

    return this;

  }

});

$.smoothScroll = function(options, px) {
  var opts, $scroller, scrollTargetOffset,
      scrollerOffset = 0,
      offPos = 'offset',
      scrollDir = 'scrollTop',
      aniprops = {};

  if ( typeof options === 'number') {
    opts = $.fn.smoothScroll.defaults;
    scrollTargetOffset = options;
  } else {
    opts = $.extend({}, $.fn.smoothScroll.defaults, options || {});
    if (opts.scrollElement) {
      offPos = 'position';
      if (opts.scrollElement.css('position') == 'static') {
        opts.scrollElement.css('position', 'relative');
      }
    }

    scrollTargetOffset = px ||
                        ( $(opts.scrollTarget)[offPos]() &&
                        $(opts.scrollTarget)[offPos]()[opts.direction] ) ||
                        0;
  }
  opts = $.extend({link: null}, opts);
  scrollDir = opts.direction == 'left' ? 'scrollLeft' : scrollDir;

  if ( opts.scrollElement ) {
    $scroller = opts.scrollElement;
    scrollerOffset = $scroller[scrollDir]();
  } else {
    $scroller = $('html, body').firstScrollable();
  }

  aniprops[scrollDir] = scrollTargetOffset + scrollerOffset + opts.offset;

  $scroller.animate(aniprops,
  {
    duration: opts.speed,
    easing: opts.easing,
    complete: function() {
      if ( opts.afterScroll && $.isFunction(opts.afterScroll) ) {
        opts.afterScroll.call(opts.link, opts);
      }
    }
  });

};

(function($){
 $.cookie = function(key, value, options) {
  if(arguments.length > 1) {
   var o = $.extend({}, $.cookie.defaults, options);
         if (value === null || value === undefined) {
             value = '';
             o.expires = -1;
         }
         if (o.expires.constructor != Date) {
    var today = new Date();
    today.setDate(today.getDate() + o.expires);
    o.expires = today;
   }
   // Create the cookie string
   document.cookie = 
    key + '=' + value +
    '; expires=' + o.expires.toUTCString() +
    (o.path? '; path=' + (o.path) : '') +
    (o.domain? '; domain=' + (o.domain) : '') +
    (o.secure? '; secure' : '');
  } else {
   if(result = new RegExp(key+"=(.*?)(?:;|$)").exec(document.cookie))
    return decodeURIComponent(result[1]);
   return false;
  }
 };
 $.cookie.defaults = {
  expires: 365,
  path: '/'
 }
})(jQuery);

$.smoothScroll.version = version;

// default options
$.fn.smoothScroll.defaults = defaults;


// private function
function filterPath(string) {
  return string
    .replace(/^\//,'')
    .replace(/(index|default).[a-zA-Z]{3,4}$/,'')
    .replace(/\/$/,'');
}

})(jQuery);

(function($) {
  $.loginModal = function(redirection){

    $("<div/>", {'class': 'mdBack'}).appendTo($('body'));
     var loginModal = $("<div/>", {'id': 'mdLogin', 'class': 'mdL'}).appendTo($('body')).load('/login?redirection=' + redirection, null, function(e){
        $("<a/>", {'class': 'delete', href: '#', html:'닫기'}).appendTo($(this)).click(function(e){
          e.preventDefault();
          $('#mdLogin').remove();
          $('.mdBack').remove();
          
          try
          {
            $("#pledge_btn").removeClass("disabled");
            pledgeBtnPressed = false;
          }
          catch(E)
          {
            
          }
        });
      });
  }
  
  $.loginModalForProjectCreate = function(redirection, email){
      $("<div/>", {'class': 'mdBack'}).appendTo($('body'));
       var loginModal = $("<div/>", {'id': 'mdLogin', 'class': 'mdL'}).appendTo($('body')).load('/sessions/new_for_invitation?redirection=' + redirection, null, function(e){
          
       });
  }
  
 $.noticeMessage = function(message){
   // notice is true, error is false

     var caution_icon = $("<img/>", {'class': 'pngFix', alt: 'caution', src:'/images/success_icon.png'});

   
   var title = $("<h3/>").append(caution_icon).append(message);
   var line = $("<div/>", {'class': 'line'});
   var notice = $("<div/>", {id: 'success', 'class': 'noticeWrap'}).append(line).append(title);
   
   notice.appendTo($("body")).fadeTo(400, 1).delay(1000).fadeTo(400, 0, function(){
     $(this).remove();
   });
 }
 
 
 $.errorMessage = function(message){
   // notice is true, error is false

     var caution_icon = $("<img/>", {'class': 'pngFix', alt: 'error', src:'/images/caution_icon.png'})

   
   var title = $("<h3/>").append(caution_icon).append(message);
   var line = $("<div/>", {'class': 'line'});
   var notice = $("<div/>", {id: 'caution', 'class': 'noticeWrap'}).append(line).append(title);
   
   notice.appendTo($("body")).fadeTo(400, 1).delay(1000).fadeTo(400, 0, function(){
     $(this).remove();
   });
 }
 
 
 $.fn.toPrice = function(cipher) {
  var strb, len, revslice;
 
  strb = $(this).val().toString();
  strb = strb.replace(/,/g, '');
  strb = $(this).getOnlyNumeric();
  strb = parseInt(strb, 10);
  if(isNaN(strb))
   return $(this).val('');
   
  strb = strb.toString();
  len = strb.length;
 
  if(len < 4)
   return $(this).val(strb);
 
  if(cipher == undefined || !isNumeric(cipher))
   cipher = 3;
 
  count = len/cipher;
  slice = new Array();
 
  for(var i=0; i<count; ++i) {
   if(i*cipher >= len)
    break;
   slice[i] = strb.slice((i+1) * -cipher, len - (i*cipher));
  }
 
  revslice = slice.reverse();
  return $(this).val(revslice.join(','));
 }
 
 $.fn.getOnlyNumeric = function(data) {
  var chrTmp, strTmp;
  var len, str;
 
  if(data == undefined) {
   str = $(this).val();
  }
  else {
   str = data;
  }
 
  len = str.length;
  strTmp = '';
 
  for(var i=0; i<len; ++i) {
   chrTmp = str.charCodeAt(i);
   if((chrTmp > 47 || chrTmp <= 31) && chrTmp < 58) {
    strTmp = strTmp + String.fromCharCode(chrTmp);
   }
  }
 
  if(data == undefined)
   return strTmp;
  else
   return $(this).val(strTmp);
 }

 var isNumeric = function(data) {
  var len, chrTmp;

  len = data.length;
  for(var i=0; i<len; ++i) {
   chrTmp = str.charCodeAt(i);
   if((chrTmp <= 47 && chrTmp > 31) || chrTmp >= 58) {
    return false;
   }
  }

  return true;
 }
})(jQuery);



$(document).ready(function(e){
  
  $('input, textarea').placeholder();
  
  
  
  Cufon.set('fontFamily', 'Helvetica');
  Cufon.now();

  Cufon.replace('.HV');


});
