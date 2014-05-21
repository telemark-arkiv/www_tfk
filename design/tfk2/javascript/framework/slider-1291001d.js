/*! telemark-frontend - v0.0.0 - 2014-05-21 */!function(a) {
    a.flexslider = function(b, c) {
        var d = a(b);
        d.vars = a.extend({}, a.flexslider.defaults, c);
        var e, f = d.vars.namespace, g = window.navigator && window.navigator.msPointerEnabled && window.MSGesture, h = ("ontouchstart" in window || g || window.DocumentTouch && document instanceof DocumentTouch) && d.vars.touch, i = "click touchend MSPointerUp", j = "", k = "vertical" === d.vars.direction, l = d.vars.reverse, m = d.vars.itemWidth > 0, n = "fade" === d.vars.animation, o = "" !== d.vars.asNavFor, p = {}, q = !0;
        a.data(b, "flexslider", d), p = {
            init: function() {
                d.animating = !1, d.currentSlide = parseInt(d.vars.startAt ? d.vars.startAt : 0, 10), 
                isNaN(d.currentSlide) && (d.currentSlide = 0), d.animatingTo = d.currentSlide, d.atEnd = 0 === d.currentSlide || d.currentSlide === d.last, 
                d.containerSelector = d.vars.selector.substr(0, d.vars.selector.search(" ")), d.slides = a(d.vars.selector, d), 
                d.container = a(d.containerSelector, d), d.count = d.slides.length, d.syncExists = a(d.vars.sync).length > 0, 
                "slide" === d.vars.animation && (d.vars.animation = "swing"), d.prop = k ? "top" : "marginLeft", 
                d.args = {}, d.manualPause = !1, d.stopped = !1, d.started = !1, d.startTimeout = null, 
                d.transitions = !d.vars.video && !n && d.vars.useCSS && function() {
                    var a = document.createElement("div"), b = [ "perspectiveProperty", "WebkitPerspective", "MozPerspective", "OPerspective", "msPerspective" ];
                    for (var c in b) if (void 0 !== a.style[b[c]]) return d.pfx = b[c].replace("Perspective", "").toLowerCase(), 
                    d.prop = "-" + d.pfx + "-transform", !0;
                    return !1;
                }(), d.ensureAnimationEnd = "", "" !== d.vars.controlsContainer && (d.controlsContainer = a(d.vars.controlsContainer).length > 0 && a(d.vars.controlsContainer)), 
                "" !== d.vars.manualControls && (d.manualControls = a(d.vars.manualControls).length > 0 && a(d.vars.manualControls)), 
                d.vars.randomize && (d.slides.sort(function() {
                    return Math.round(Math.random()) - .5;
                }), d.container.empty().append(d.slides)), d.doMath(), d.setup("init"), d.vars.controlNav && p.controlNav.setup(), 
                d.vars.directionNav && p.directionNav.setup(), d.vars.keyboard && (1 === a(d.containerSelector).length || d.vars.multipleKeyboard) && a(document).bind("keyup", function(a) {
                    var b = a.keyCode;
                    if (!d.animating && (39 === b || 37 === b)) {
                        var c = 39 === b ? d.getTarget("next") : 37 === b ? d.getTarget("prev") : !1;
                        d.flexAnimate(c, d.vars.pauseOnAction);
                    }
                }), d.vars.mousewheel && d.bind("mousewheel", function(a, b) {
                    a.preventDefault();
                    var c = 0 > b ? d.getTarget("next") : d.getTarget("prev");
                    d.flexAnimate(c, d.vars.pauseOnAction);
                }), d.vars.pausePlay && p.pausePlay.setup(), d.vars.slideshow && d.vars.pauseInvisible && p.pauseInvisible.init(), 
                d.vars.slideshow && (d.vars.pauseOnHover && d.hover(function() {
                    d.manualPlay || d.manualPause || d.pause();
                }, function() {
                    d.manualPause || d.manualPlay || d.stopped || d.play();
                }), d.vars.pauseInvisible && p.pauseInvisible.isHidden() || (d.vars.initDelay > 0 ? d.startTimeout = setTimeout(d.play, d.vars.initDelay) : d.play())), 
                o && p.asNav.setup(), h && d.vars.touch && p.touch(), (!n || n && d.vars.smoothHeight) && a(window).bind("resize orientationchange focus", p.resize), 
                d.find("img").attr("draggable", "false"), setTimeout(function() {
                    d.vars.start(d);
                }, 200);
            },
            asNav: {
                setup: function() {
                    d.asNav = !0, d.animatingTo = Math.floor(d.currentSlide / d.move), d.currentItem = d.currentSlide, 
                    d.slides.removeClass(f + "active-slide").eq(d.currentItem).addClass(f + "active-slide"), 
                    g ? (b._slider = d, d.slides.each(function() {
                        var b = this;
                        b._gesture = new MSGesture(), b._gesture.target = b, b.addEventListener("MSPointerDown", function(a) {
                            a.preventDefault(), a.currentTarget._gesture && a.currentTarget._gesture.addPointer(a.pointerId);
                        }, !1), b.addEventListener("MSGestureTap", function(b) {
                            b.preventDefault();
                            var c = a(this), e = c.index();
                            a(d.vars.asNavFor).data("flexslider").animating || c.hasClass("active") || (d.direction = d.currentItem < e ? "next" : "prev", 
                            d.flexAnimate(e, d.vars.pauseOnAction, !1, !0, !0));
                        });
                    })) : d.slides.on(i, function(b) {
                        b.preventDefault();
                        var c = a(this), e = c.index(), g = c.offset().left - a(d).scrollLeft();
                        0 >= g && c.hasClass(f + "active-slide") ? d.flexAnimate(d.getTarget("prev"), !0) : a(d.vars.asNavFor).data("flexslider").animating || c.hasClass(f + "active-slide") || (d.direction = d.currentItem < e ? "next" : "prev", 
                        d.flexAnimate(e, d.vars.pauseOnAction, !1, !0, !0));
                    });
                }
            },
            controlNav: {
                setup: function() {
                    d.manualControls ? p.controlNav.setupManual() : p.controlNav.setupPaging();
                },
                setupPaging: function() {
                    var b, c, e = "thumbnails" === d.vars.controlNav ? "control-thumbs" : "control-paging", g = 1;
                    if (d.controlNavScaffold = a('<ol class="' + f + "control-nav " + f + e + '"></ol>'), 
                    d.pagingCount > 1) for (var h = 0; h < d.pagingCount; h++) {
                        if (c = d.slides.eq(h), b = "thumbnails" === d.vars.controlNav ? '<img src="' + c.attr("data-thumb") + '"/>' : "<a>" + g + "</a>", 
                        "thumbnails" === d.vars.controlNav && !0 === d.vars.thumbCaptions) {
                            var k = c.attr("data-thumbcaption");
                            "" != k && void 0 != k && (b += '<span class="' + f + 'caption">' + k + "</span>");
                        }
                        d.controlNavScaffold.append("<li>" + b + "</li>"), g++;
                    }
                    d.controlsContainer ? a(d.controlsContainer).append(d.controlNavScaffold) : d.append(d.controlNavScaffold), 
                    p.controlNav.set(), p.controlNav.active(), d.controlNavScaffold.delegate("a, img", i, function(b) {
                        if (b.preventDefault(), "" === j || j === b.type) {
                            var c = a(this), e = d.controlNav.index(c);
                            c.hasClass(f + "active") || (d.direction = e > d.currentSlide ? "next" : "prev", 
                            d.flexAnimate(e, d.vars.pauseOnAction));
                        }
                        "" === j && (j = b.type), p.setToClearWatchedEvent();
                    });
                },
                setupManual: function() {
                    d.controlNav = d.manualControls, p.controlNav.active(), d.controlNav.bind(i, function(b) {
                        if (b.preventDefault(), "" === j || j === b.type) {
                            var c = a(this), e = d.controlNav.index(c);
                            c.hasClass(f + "active") || (d.direction = e > d.currentSlide ? "next" : "prev", 
                            d.flexAnimate(e, d.vars.pauseOnAction));
                        }
                        "" === j && (j = b.type), p.setToClearWatchedEvent();
                    });
                },
                set: function() {
                    var b = "thumbnails" === d.vars.controlNav ? "img" : "a";
                    d.controlNav = a("." + f + "control-nav li " + b, d.controlsContainer ? d.controlsContainer : d);
                },
                active: function() {
                    d.controlNav.removeClass(f + "active").eq(d.animatingTo).addClass(f + "active");
                },
                update: function(b, c) {
                    d.pagingCount > 1 && "add" === b ? d.controlNavScaffold.append(a("<li><a>" + d.count + "</a></li>")) : 1 === d.pagingCount ? d.controlNavScaffold.find("li").remove() : d.controlNav.eq(c).closest("li").remove(), 
                    p.controlNav.set(), d.pagingCount > 1 && d.pagingCount !== d.controlNav.length ? d.update(c, b) : p.controlNav.active();
                }
            },
            directionNav: {
                setup: function() {
                    var b = a('<ul class="' + f + 'direction-nav"><li><a class="' + f + 'prev" href="#">' + d.vars.prevText + '</a></li><li><a class="' + f + 'next" href="#">' + d.vars.nextText + "</a></li></ul>");
                    d.controlsContainer ? (a(d.controlsContainer).append(b), d.directionNav = a("." + f + "direction-nav li a", d.controlsContainer)) : (d.append(b), 
                    d.directionNav = a("." + f + "direction-nav li a", d)), p.directionNav.update(), 
                    d.directionNav.bind(i, function(b) {
                        b.preventDefault();
                        var c;
                        ("" === j || j === b.type) && (c = a(this).hasClass(f + "next") ? d.getTarget("next") : d.getTarget("prev"), 
                        d.flexAnimate(c, d.vars.pauseOnAction)), "" === j && (j = b.type), p.setToClearWatchedEvent();
                    });
                },
                update: function() {
                    var a = f + "disabled";
                    1 === d.pagingCount ? d.directionNav.addClass(a).attr("tabindex", "-1") : d.vars.animationLoop ? d.directionNav.removeClass(a).removeAttr("tabindex") : 0 === d.animatingTo ? d.directionNav.removeClass(a).filter("." + f + "prev").addClass(a).attr("tabindex", "-1") : d.animatingTo === d.last ? d.directionNav.removeClass(a).filter("." + f + "next").addClass(a).attr("tabindex", "-1") : d.directionNav.removeClass(a).removeAttr("tabindex");
                }
            },
            pausePlay: {
                setup: function() {
                    var b = a('<div class="' + f + 'pauseplay"><a></a></div>');
                    d.controlsContainer ? (d.controlsContainer.append(b), d.pausePlay = a("." + f + "pauseplay a", d.controlsContainer)) : (d.append(b), 
                    d.pausePlay = a("." + f + "pauseplay a", d)), p.pausePlay.update(d.vars.slideshow ? f + "pause" : f + "play"), 
                    d.pausePlay.bind(i, function(b) {
                        b.preventDefault(), ("" === j || j === b.type) && (a(this).hasClass(f + "pause") ? (d.manualPause = !0, 
                        d.manualPlay = !1, d.pause()) : (d.manualPause = !1, d.manualPlay = !0, d.play())), 
                        "" === j && (j = b.type), p.setToClearWatchedEvent();
                    });
                },
                update: function(a) {
                    "play" === a ? d.pausePlay.removeClass(f + "pause").addClass(f + "play").html(d.vars.playText) : d.pausePlay.removeClass(f + "play").addClass(f + "pause").html(d.vars.pauseText);
                }
            },
            touch: function() {
                function a(a) {
                    d.animating ? a.preventDefault() : (window.navigator.msPointerEnabled || 1 === a.touches.length) && (d.pause(), 
                    q = k ? d.h : d.w, s = Number(new Date()), u = a.touches[0].pageX, v = a.touches[0].pageY, 
                    p = m && l && d.animatingTo === d.last ? 0 : m && l ? d.limit - (d.itemW + d.vars.itemMargin) * d.move * d.animatingTo : m && d.currentSlide === d.last ? d.limit : m ? (d.itemW + d.vars.itemMargin) * d.move * d.currentSlide : l ? (d.last - d.currentSlide + d.cloneOffset) * q : (d.currentSlide + d.cloneOffset) * q, 
                    j = k ? v : u, o = k ? u : v, b.addEventListener("touchmove", c, !1), b.addEventListener("touchend", e, !1));
                }
                function c(a) {
                    u = a.touches[0].pageX, v = a.touches[0].pageY, r = k ? j - v : j - u, t = k ? Math.abs(r) < Math.abs(u - o) : Math.abs(r) < Math.abs(v - o);
                    var b = 500;
                    (!t || Number(new Date()) - s > b) && (a.preventDefault(), !n && d.transitions && (d.vars.animationLoop || (r /= 0 === d.currentSlide && 0 > r || d.currentSlide === d.last && r > 0 ? Math.abs(r) / q + 2 : 1), 
                    d.setProps(p + r, "setTouch")));
                }
                function e() {
                    if (b.removeEventListener("touchmove", c, !1), d.animatingTo === d.currentSlide && !t && null !== r) {
                        var a = l ? -r : r, f = a > 0 ? d.getTarget("next") : d.getTarget("prev");
                        d.canAdvance(f) && (Number(new Date()) - s < 550 && Math.abs(a) > 50 || Math.abs(a) > q / 2) ? d.flexAnimate(f, d.vars.pauseOnAction) : n || d.flexAnimate(d.currentSlide, d.vars.pauseOnAction, !0);
                    }
                    b.removeEventListener("touchend", e, !1), j = null, o = null, r = null, p = null;
                }
                function f(a) {
                    a.stopPropagation(), d.animating ? a.preventDefault() : (d.pause(), b._gesture.addPointer(a.pointerId), 
                    w = 0, q = k ? d.h : d.w, s = Number(new Date()), p = m && l && d.animatingTo === d.last ? 0 : m && l ? d.limit - (d.itemW + d.vars.itemMargin) * d.move * d.animatingTo : m && d.currentSlide === d.last ? d.limit : m ? (d.itemW + d.vars.itemMargin) * d.move * d.currentSlide : l ? (d.last - d.currentSlide + d.cloneOffset) * q : (d.currentSlide + d.cloneOffset) * q);
                }
                function h(a) {
                    a.stopPropagation();
                    var c = a.target._slider;
                    if (c) {
                        var d = -a.translationX, e = -a.translationY;
                        return w += k ? e : d, r = w, t = k ? Math.abs(w) < Math.abs(-d) : Math.abs(w) < Math.abs(-e), 
                        a.detail === a.MSGESTURE_FLAG_INERTIA ? (setImmediate(function() {
                            b._gesture.stop();
                        }), void 0) : ((!t || Number(new Date()) - s > 500) && (a.preventDefault(), !n && c.transitions && (c.vars.animationLoop || (r = w / (0 === c.currentSlide && 0 > w || c.currentSlide === c.last && w > 0 ? Math.abs(w) / q + 2 : 1)), 
                        c.setProps(p + r, "setTouch"))), void 0);
                    }
                }
                function i(a) {
                    a.stopPropagation();
                    var b = a.target._slider;
                    if (b) {
                        if (b.animatingTo === b.currentSlide && !t && null !== r) {
                            var c = l ? -r : r, d = c > 0 ? b.getTarget("next") : b.getTarget("prev");
                            b.canAdvance(d) && (Number(new Date()) - s < 550 && Math.abs(c) > 50 || Math.abs(c) > q / 2) ? b.flexAnimate(d, b.vars.pauseOnAction) : n || b.flexAnimate(b.currentSlide, b.vars.pauseOnAction, !0);
                        }
                        j = null, o = null, r = null, p = null, w = 0;
                    }
                }
                var j, o, p, q, r, s, t = !1, u = 0, v = 0, w = 0;
                g ? (b.style.msTouchAction = "none", b._gesture = new MSGesture(), b._gesture.target = b, 
                b.addEventListener("MSPointerDown", f, !1), b._slider = d, b.addEventListener("MSGestureChange", h, !1), 
                b.addEventListener("MSGestureEnd", i, !1)) : b.addEventListener("touchstart", a, !1);
            },
            resize: function() {
                !d.animating && d.is(":visible") && (m || d.doMath(), n ? p.smoothHeight() : m ? (d.slides.width(d.computedW), 
                d.update(d.pagingCount), d.setProps()) : k ? (d.viewport.height(d.h), d.setProps(d.h, "setTotal")) : (d.vars.smoothHeight && p.smoothHeight(), 
                d.newSlides.width(d.computedW), d.setProps(d.computedW, "setTotal")));
            },
            smoothHeight: function(a) {
                if (!k || n) {
                    var b = n ? d : d.viewport;
                    a ? b.animate({
                        height: d.slides.eq(d.animatingTo).height()
                    }, a) : b.height(d.slides.eq(d.animatingTo).height());
                }
            },
            sync: function(b) {
                var c = a(d.vars.sync).data("flexslider"), e = d.animatingTo;
                switch (b) {
                  case "animate":
                    c.flexAnimate(e, d.vars.pauseOnAction, !1, !0);
                    break;

                  case "play":
                    c.playing || c.asNav || c.play();
                    break;

                  case "pause":
                    c.pause();
                }
            },
            uniqueID: function(b) {
                return b.find("[id]").each(function() {
                    var b = a(this);
                    b.attr("id", b.attr("id") + "_clone");
                }), b;
            },
            pauseInvisible: {
                visProp: null,
                init: function() {
                    var a = [ "webkit", "moz", "ms", "o" ];
                    if ("hidden" in document) return "hidden";
                    for (var b = 0; b < a.length; b++) a[b] + "Hidden" in document && (p.pauseInvisible.visProp = a[b] + "Hidden");
                    if (p.pauseInvisible.visProp) {
                        var c = p.pauseInvisible.visProp.replace(/[H|h]idden/, "") + "visibilitychange";
                        document.addEventListener(c, function() {
                            p.pauseInvisible.isHidden() ? d.startTimeout ? clearTimeout(d.startTimeout) : d.pause() : d.started ? d.play() : d.vars.initDelay > 0 ? setTimeout(d.play, d.vars.initDelay) : d.play();
                        });
                    }
                },
                isHidden: function() {
                    return document[p.pauseInvisible.visProp] || !1;
                }
            },
            setToClearWatchedEvent: function() {
                clearTimeout(e), e = setTimeout(function() {
                    j = "";
                }, 3e3);
            }
        }, d.flexAnimate = function(b, c, e, g, i) {
            if (d.vars.animationLoop || b === d.currentSlide || (d.direction = b > d.currentSlide ? "next" : "prev"), 
            o && 1 === d.pagingCount && (d.direction = d.currentItem < b ? "next" : "prev"), 
            !d.animating && (d.canAdvance(b, i) || e) && d.is(":visible")) {
                if (o && g) {
                    var j = a(d.vars.asNavFor).data("flexslider");
                    if (d.atEnd = 0 === b || b === d.count - 1, j.flexAnimate(b, !0, !1, !0, i), d.direction = d.currentItem < b ? "next" : "prev", 
                    j.direction = d.direction, Math.ceil((b + 1) / d.visible) - 1 === d.currentSlide || 0 === b) return d.currentItem = b, 
                    d.slides.removeClass(f + "active-slide").eq(b).addClass(f + "active-slide"), !1;
                    d.currentItem = b, d.slides.removeClass(f + "active-slide").eq(b).addClass(f + "active-slide"), 
                    b = Math.floor(b / d.visible);
                }
                if (d.animating = !0, d.animatingTo = b, c && d.pause(), d.vars.before(d), d.syncExists && !i && p.sync("animate"), 
                d.vars.controlNav && p.controlNav.active(), m || d.slides.removeClass(f + "active-slide").eq(b).addClass(f + "active-slide"), 
                d.atEnd = 0 === b || b === d.last, d.vars.directionNav && p.directionNav.update(), 
                b === d.last && (d.vars.end(d), d.vars.animationLoop || d.pause()), n) h ? (d.slides.eq(d.currentSlide).css({
                    opacity: 0,
                    zIndex: 1
                }), d.slides.eq(b).css({
                    opacity: 1,
                    zIndex: 2
                }), d.wrapup(t)) : (d.slides.eq(d.currentSlide).css({
                    zIndex: 1
                }).animate({
                    opacity: 0
                }, d.vars.animationSpeed, d.vars.easing), d.slides.eq(b).css({
                    zIndex: 2
                }).animate({
                    opacity: 1
                }, d.vars.animationSpeed, d.vars.easing, d.wrapup)); else {
                    var q, r, s, t = k ? d.slides.filter(":first").height() : d.computedW;
                    m ? (q = d.vars.itemMargin, s = (d.itemW + q) * d.move * d.animatingTo, r = s > d.limit && 1 !== d.visible ? d.limit : s) : r = 0 === d.currentSlide && b === d.count - 1 && d.vars.animationLoop && "next" !== d.direction ? l ? (d.count + d.cloneOffset) * t : 0 : d.currentSlide === d.last && 0 === b && d.vars.animationLoop && "prev" !== d.direction ? l ? 0 : (d.count + 1) * t : l ? (d.count - 1 - b + d.cloneOffset) * t : (b + d.cloneOffset) * t, 
                    d.setProps(r, "", d.vars.animationSpeed), d.transitions ? (d.vars.animationLoop && d.atEnd || (d.animating = !1, 
                    d.currentSlide = d.animatingTo), d.container.unbind("webkitTransitionEnd transitionend"), 
                    d.container.bind("webkitTransitionEnd transitionend", function() {
                        clearTimeout(d.ensureAnimationEnd), d.wrapup(t);
                    }), clearTimeout(d.ensureAnimationEnd), d.ensureAnimationEnd = setTimeout(function() {
                        d.wrapup(t);
                    }, d.vars.animationSpeed + 100)) : d.container.animate(d.args, d.vars.animationSpeed, d.vars.easing, function() {
                        d.wrapup(t);
                    });
                }
                d.vars.smoothHeight && p.smoothHeight(d.vars.animationSpeed);
            }
        }, d.wrapup = function(a) {
            n || m || (0 === d.currentSlide && d.animatingTo === d.last && d.vars.animationLoop ? d.setProps(a, "jumpEnd") : d.currentSlide === d.last && 0 === d.animatingTo && d.vars.animationLoop && d.setProps(a, "jumpStart")), 
            d.animating = !1, d.currentSlide = d.animatingTo, d.vars.after(d);
        }, d.animateSlides = function() {
            !d.animating && q && d.flexAnimate(d.getTarget("next"));
        }, d.pause = function() {
            clearInterval(d.animatedSlides), d.animatedSlides = null, d.playing = !1, d.vars.pausePlay && p.pausePlay.update("play"), 
            d.syncExists && p.sync("pause");
        }, d.play = function() {
            d.playing && clearInterval(d.animatedSlides), d.animatedSlides = d.animatedSlides || setInterval(d.animateSlides, d.vars.slideshowSpeed), 
            d.started = d.playing = !0, d.vars.pausePlay && p.pausePlay.update("pause"), d.syncExists && p.sync("play");
        }, d.stop = function() {
            d.pause(), d.stopped = !0;
        }, d.canAdvance = function(a, b) {
            var c = o ? d.pagingCount - 1 : d.last;
            return b ? !0 : o && d.currentItem === d.count - 1 && 0 === a && "prev" === d.direction ? !0 : o && 0 === d.currentItem && a === d.pagingCount - 1 && "next" !== d.direction ? !1 : a !== d.currentSlide || o ? d.vars.animationLoop ? !0 : d.atEnd && 0 === d.currentSlide && a === c && "next" !== d.direction ? !1 : d.atEnd && d.currentSlide === c && 0 === a && "next" === d.direction ? !1 : !0 : !1;
        }, d.getTarget = function(a) {
            return d.direction = a, "next" === a ? d.currentSlide === d.last ? 0 : d.currentSlide + 1 : 0 === d.currentSlide ? d.last : d.currentSlide - 1;
        }, d.setProps = function(a, b, c) {
            var e = function() {
                var c = a ? a : (d.itemW + d.vars.itemMargin) * d.move * d.animatingTo, e = function() {
                    if (m) return "setTouch" === b ? a : l && d.animatingTo === d.last ? 0 : l ? d.limit - (d.itemW + d.vars.itemMargin) * d.move * d.animatingTo : d.animatingTo === d.last ? d.limit : c;
                    switch (b) {
                      case "setTotal":
                        return l ? (d.count - 1 - d.currentSlide + d.cloneOffset) * a : (d.currentSlide + d.cloneOffset) * a;

                      case "setTouch":
                        return l ? a : a;

                      case "jumpEnd":
                        return l ? a : d.count * a;

                      case "jumpStart":
                        return l ? d.count * a : a;

                      default:
                        return a;
                    }
                }();
                return -1 * e + "px";
            }();
            d.transitions && (e = k ? "translate3d(0," + e + ",0)" : "translate3d(" + e + ",0,0)", 
            c = void 0 !== c ? c / 1e3 + "s" : "0s", d.container.css("-" + d.pfx + "-transition-duration", c), 
            d.container.css("transition-duration", c)), d.args[d.prop] = e, (d.transitions || void 0 === c) && d.container.css(d.args), 
            d.container.css("transform", e);
        }, d.setup = function(b) {
            if (n) d.slides.css({
                width: "100%",
                "float": "left",
                marginRight: "-100%",
                position: "relative"
            }), "init" === b && (h ? d.slides.css({
                opacity: 0,
                display: "block",
                webkitTransition: "opacity " + d.vars.animationSpeed / 1e3 + "s ease",
                zIndex: 1
            }).eq(d.currentSlide).css({
                opacity: 1,
                zIndex: 2
            }) : d.slides.css({
                opacity: 0,
                display: "block",
                zIndex: 1
            }).eq(d.currentSlide).css({
                zIndex: 2
            }).animate({
                opacity: 1
            }, d.vars.animationSpeed, d.vars.easing)), d.vars.smoothHeight && p.smoothHeight(); else {
                var c, e;
                "init" === b && (d.viewport = a('<div class="' + f + 'viewport"></div>').css({
                    overflow: "hidden",
                    position: "relative"
                }).appendTo(d).append(d.container), d.cloneCount = 0, d.cloneOffset = 0, l && (e = a.makeArray(d.slides).reverse(), 
                d.slides = a(e), d.container.empty().append(d.slides))), d.vars.animationLoop && !m && (d.cloneCount = 2, 
                d.cloneOffset = 1, "init" !== b && d.container.find(".clone").remove(), p.uniqueID(d.slides.first().clone().addClass("clone").attr("aria-hidden", "true")).appendTo(d.container), 
                p.uniqueID(d.slides.last().clone().addClass("clone").attr("aria-hidden", "true")).prependTo(d.container)), 
                d.newSlides = a(d.vars.selector, d), c = l ? d.count - 1 - d.currentSlide + d.cloneOffset : d.currentSlide + d.cloneOffset, 
                k && !m ? (d.container.height(200 * (d.count + d.cloneCount) + "%").css("position", "absolute").width("100%"), 
                setTimeout(function() {
                    d.newSlides.css({
                        display: "block"
                    }), d.doMath(), d.viewport.height(d.h), d.setProps(c * d.h, "init");
                }, "init" === b ? 100 : 0)) : (d.container.width(200 * (d.count + d.cloneCount) + "%"), 
                d.setProps(c * d.computedW, "init"), setTimeout(function() {
                    d.doMath(), d.newSlides.css({
                        width: d.computedW,
                        "float": "left",
                        display: "block"
                    }), d.vars.smoothHeight && p.smoothHeight();
                }, "init" === b ? 100 : 0));
            }
            m || d.slides.removeClass(f + "active-slide").eq(d.currentSlide).addClass(f + "active-slide"), 
            d.vars.init(d);
        }, d.doMath = function() {
            var a = d.slides.first(), b = d.vars.itemMargin, c = d.vars.minItems, e = d.vars.maxItems;
            d.w = void 0 === d.viewport ? d.width() : d.viewport.width(), d.h = a.height(), 
            d.boxPadding = a.outerWidth() - a.width(), m ? (d.itemT = d.vars.itemWidth + b, 
            d.minW = c ? c * d.itemT : d.w, d.maxW = e ? e * d.itemT - b : d.w, d.itemW = d.minW > d.w ? (d.w - b * (c - 1)) / c : d.maxW < d.w ? (d.w - b * (e - 1)) / e : d.vars.itemWidth > d.w ? d.w : d.vars.itemWidth, 
            d.visible = Math.floor(d.w / d.itemW), d.move = d.vars.move > 0 && d.vars.move < d.visible ? d.vars.move : d.visible, 
            d.pagingCount = Math.ceil((d.count - d.visible) / d.move + 1), d.last = d.pagingCount - 1, 
            d.limit = 1 === d.pagingCount ? 0 : d.vars.itemWidth > d.w ? d.itemW * (d.count - 1) + b * (d.count - 1) : (d.itemW + b) * d.count - d.w - b) : (d.itemW = d.w, 
            d.pagingCount = d.count, d.last = d.count - 1), d.computedW = d.itemW - d.boxPadding;
        }, d.update = function(a, b) {
            d.doMath(), m || (a < d.currentSlide ? d.currentSlide += 1 : a <= d.currentSlide && 0 !== a && (d.currentSlide -= 1), 
            d.animatingTo = d.currentSlide), d.vars.controlNav && !d.manualControls && ("add" === b && !m || d.pagingCount > d.controlNav.length ? p.controlNav.update("add") : ("remove" === b && !m || d.pagingCount < d.controlNav.length) && (m && d.currentSlide > d.last && (d.currentSlide -= 1, 
            d.animatingTo -= 1), p.controlNav.update("remove", d.last))), d.vars.directionNav && p.directionNav.update();
        }, d.addSlide = function(b, c) {
            var e = a(b);
            d.count += 1, d.last = d.count - 1, k && l ? void 0 !== c ? d.slides.eq(d.count - c).after(e) : d.container.prepend(e) : void 0 !== c ? d.slides.eq(c).before(e) : d.container.append(e), 
            d.update(c, "add"), d.slides = a(d.vars.selector + ":not(.clone)", d), d.setup(), 
            d.vars.added(d);
        }, d.removeSlide = function(b) {
            var c = isNaN(b) ? d.slides.index(a(b)) : b;
            d.count -= 1, d.last = d.count - 1, isNaN(b) ? a(b, d.slides).remove() : k && l ? d.slides.eq(d.last).remove() : d.slides.eq(b).remove(), 
            d.doMath(), d.update(c, "remove"), d.slides = a(d.vars.selector + ":not(.clone)", d), 
            d.setup(), d.vars.removed(d);
        }, p.init();
    }, a(window).blur(function() {
        focused = !1;
    }).focus(function() {
        focused = !0;
    }), a.flexslider.defaults = {
        namespace: "flex-",
        selector: ".slides > li",
        animation: "fade",
        easing: "swing",
        direction: "horizontal",
        reverse: !1,
        animationLoop: !0,
        smoothHeight: !1,
        startAt: 0,
        slideshow: !0,
        slideshowSpeed: 7e3,
        animationSpeed: 600,
        initDelay: 0,
        randomize: !1,
        thumbCaptions: !1,
        pauseOnAction: !0,
        pauseOnHover: !1,
        pauseInvisible: !0,
        useCSS: !0,
        touch: !0,
        video: !1,
        controlNav: !0,
        directionNav: !0,
        prevText: "Previous",
        nextText: "Next",
        keyboard: !0,
        multipleKeyboard: !1,
        mousewheel: !1,
        pausePlay: !1,
        pauseText: "Pause",
        playText: "Play",
        controlsContainer: "",
        manualControls: "",
        sync: "",
        asNavFor: "",
        itemWidth: 0,
        itemMargin: 0,
        minItems: 1,
        maxItems: 0,
        move: 0,
        allowOneSlide: !0,
        start: function() {},
        before: function() {},
        after: function() {},
        end: function() {},
        added: function() {},
        removed: function() {},
        init: function() {}
    }, a.fn.flexslider = function(b) {
        if (void 0 === b && (b = {}), "object" == typeof b) return this.each(function() {
            var c = a(this), d = b.selector ? b.selector : ".slides > li", e = c.find(d);
            1 === e.length && b.allowOneSlide === !0 || 0 === e.length ? (e.fadeIn(400), b.start && b.start(c)) : void 0 === c.data("flexslider") && new a.flexslider(this, b);
        });
        var c = a(this).data("flexslider");
        switch (b) {
          case "play":
            c.play();
            break;

          case "pause":
            c.pause();
            break;

          case "stop":
            c.stop();
            break;

          case "next":
            c.flexAnimate(c.getTarget("next"), !0);
            break;

          case "prev":
          case "previous":
            c.flexAnimate(c.getTarget("prev"), !0);
            break;

          default:
            "number" == typeof b && c.flexAnimate(b, !0);
        }
    };
}(jQuery);

$(window).load(function() {
    $(".slider").flexslider({
        namespace: "slider__",
        selector: ".slider__slides > .slider__slide",
        animation: "slide",
        slideshow: false,
        prevText: "Forrige",
        nextText: "Neste"
    });
});