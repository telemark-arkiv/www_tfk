//init page
jQuery(function(){
	initAutoscalingMenu();
	initDropDown();
	initButtons();
	initCarousel();
	initTabs();
	initFancyBox('a[title="group"]');
	initFancyBox('a[title="group2"]');
	initFancyBox('a[title="group3"]');
	initFadeHovers();
});

jQuery(window).load(function(){
	initRoundGallery();
})

function initFadeHovers() {
	var activeClass = 'active';
	var animSpeed = 500;
	jQuery('.visual-holder').each(function(){
		var holder = jQuery(this);
		var block = holder.find('.block-info').hide();
		
		block.css({
			opacity:0
		});
		
		holder.mouseenter(function(){
			block.show().stop().animate({opacity:0.8}, {duration:animSpeed/2})
		}).mouseleave(function(){
			block.stop().animate({opacity:0}, {duration:animSpeed, complete:function(){
				block.hide();
			}});
		});
	});
	
	jQuery('.photos li').each(function(){
		var holderP = jQuery(this);
		var blockP = holderP.find('.block-hover').hide();
		
		blockP.css({
			opacity:0
		});
		
		holderP.mouseenter(function(){
			blockP.show().stop().animate({opacity:0.8}, {duration:animSpeed/2})
		}).mouseleave(function(){
			blockP.stop().animate({opacity:0}, {duration:animSpeed, complete:function(){
				blockP.hide();
			}})
		})
	})
}

function initFancyBox(links) {
	var arr = [];
	$(links).each(function(){
		var json = { href: this.href, title: $(this).parent().find('.popup-block').html()};
		arr.push(json)
	})
	$(links).each(function(i){
		$(this).parent().find('a.btn').bind('click', function(){
			if(jQuery(this).closest('.visual-holder').find('a[title="group"]').length) jQuery(this).closest('.visual-holder').find('a[title="group"]').trigger('click');
			if(jQuery(this).closest('.visual-holder').find('a[title="group2"]').length) jQuery(this).closest('.visual-holder').find('a[title="group2"]').trigger('click');
			if(jQuery(this).closest('.visual-holder').find('a[title="group3"]').length) jQuery(this).closest('.visual-holder').find('a[title="group3"]').trigger('click');
			return false;
		});
		$(this).bind('click', function(){
			var that = $(this);
			$.fancybox(arr,{
				loop: true,
				overlayColor:'#000',
				overlayOpacity:0.75,
				centerOnScroll:true,
				autoScale:true,
				closeBtn:true,
				transitionIn: 'elastic',
				transitionOut: 'elastic',
				index: i,
				helpers : {
    				title : {
    					type : 'inside'
    				}
    			}
			});
			return false;
		})
	});
}

function initRoundGallery() {
	jQuery('.carousel-images').roundabout({
		btnPrev:'.carousel-controls .carousel-prev',
		btnNext:'.carousel-controls .carousel-next',
		minScale:0.7,
		maxScale:1,
		minOpacity:1,
		duration:500,
		autoplayDuration: 8000,
		autoplayPauseOnHover: true
	});
}

function initAutoscalingMenu() {
	initAutoScalingNav({
		menuId: "nav",
		tag: "span",
		spacing: 2,
		constant: 0,
		minPaddings: 0,
		liHovering: false,
		sideClasses: false
	});
	initAutoScalingNav({
		menuId: "tab-nav",
		tag: "a",
		spacing: 1,
		constant: 0,
		minPaddings: 0,
		liHovering: false,
		sideClasses: true
	});
	initAutoScalingNav({
		menuId: "tab-nav2",
		tag: "a",
		spacing: 1,
		constant: 0,
		minPaddings: 0,
		liHovering: false,
		sideClasses: true
	});
	initAutoScalingNav({
		menuId: "paging",
		tag: "span",
		spacing: 1,
		constant: 0,
		minPaddings: 0,
		liHovering: false,
		sideClasses: true
	});
	initAutoScalingNav({
		menuId: "paging2",
		tag: "span",
		spacing: 1,
		constant: 0,
		minPaddings: 0,
		liHovering: false,
		sideClasses: true
	});
	initAutoScalingNav({
		menuId: "alphabet",
		tag: "span",
		spacing: 2,
		constant: 0,
		minPaddings: 0,
		liHovering: false,
		sideClasses: true
	});
	initAutoScalingNav({
		menuId: "categories-nav",
		tag: "a",
		spacing: 1,
		constant: 0,
		minPaddings: 0,
		liHovering: false,
		sideClasses: true
	});
}

// accordion init
function initCarousel() {
	jQuery('div.slide-holder').scrollGallery({
		mask: 'div.frame',
		slider: '>ul',
		slides: '>li',
		currentNumber: 'span.cur-num',
		totalNumber: 'span.all-num',
		btnPrev: 'a.prev',
		btnNext: 'a.next',
		disableWhileAnimating: true,
		generatePagination: 'div.pagination',
		circularRotation: true,
		pauseOnHover: false,
		autoRotation: false,
		maskAutoSize: false,
		switchTime: 2000,
		animSpeed: 600,
		step: 1
	});
}

/*
 * jQuery Carousel plugin
 */
;(function($){
	function ScrollGallery(options) {
		this.options = $.extend({
			mask: 'div.mask',
			slider: '>*',
			slides: '>*',
			activeClass:'active',
			disabledClass:'disabled',
			btnPrev: 'a.btn-prev',
			btnNext: 'a.btn-next',
			generatePagination: false,
			pagerList: '<ul>',
			pagerListItem: '<li><a href="#"></a></li>',
			pagerListItemText: 'a',
			pagerLinks: '.pagination li',
			currentNumber: 'span.current-num',
			totalNumber: 'span.total-num',
			btnPlay: '.btn-play',
			btnPause: '.btn-pause',
			btnPlayPause: '.btn-play-pause',
			autorotationActiveClass: 'autorotation-active',
			autorotationDisabledClass: 'autorotation-disabled',
			circularRotation: true,
			disableWhileAnimating: false,
			autoRotation: false,
			pauseOnHover: isTouchDevice ? false : true,
			maskAutoSize: false,
			switchTime: 4000,
			animSpeed: 600,
			event:'click',
			swipeGap: false,
			swipeThreshold: 50,
			handleTouch: true,
			vertical: false,
			step: false
		}, options);
		this.init();
	}
	ScrollGallery.prototype = {
		init: function() {
			if(this.options.holder) {
				this.findElements();
				this.attachEvents();
				this.refreshPosition();
				this.refreshState(true);
				this.resumeRotation();
				this.makeCallback('onInit', [this]);
			}
		},
		findElements: function() {
			// define dimensions proporties
			this.fullSizeFunction = this.options.vertical ? 'outerHeight' : 'outerWidth';
			this.innerSizeFunction = this.options.vertical ? 'height' : 'width';
			this.slideSizeFunction = 'outerHeight';
			this.maskSizeProperty = 'height';
			this.animProperty = this.options.vertical ? 'marginTop' : 'marginLeft';
			this.swipeProperties = this.options.vertical ? ['up', 'down'] : ['left', 'right'];
			
			// control elements
			this.gallery = $(this.options.holder);
			this.mask = this.gallery.find(this.options.mask);
			this.slider = this.mask.find(this.options.slider);
			this.slides = this.slider.find(this.options.slides);
			this.btnPrev = this.gallery.find(this.options.btnPrev);
			this.btnNext = this.gallery.find(this.options.btnNext);
			this.currentStep = 0; this.stepsCount = 0;
			
			// get start index
			if(this.options.step === false) {
				var activeSlide = this.slides.filter('.'+this.options.activeClass);
				if(activeSlide.length) {
					this.currentStep = this.slides.index(activeSlide);
				}
			}
			
			// calculate offsets
			this.calculateOffsets();
			$(window).bind('resize orientationchange', $.proxy(this.onWindowResize, this));
			
			// create gallery pagination
			if(typeof this.options.generatePagination === 'string') {
				this.buildPagination();
			} else {
				this.pagerLinks = this.gallery.find(this.options.pagerLinks);
				this.attachPaginationEvents();
			}
			
			// autorotation control buttons
			this.btnPlay = this.gallery.find(this.options.btnPlay);
			this.btnPause = this.gallery.find(this.options.btnPause);
			this.btnPlayPause = this.gallery.find(this.options.btnPlayPause);
			
			// misc elements
			this.curNum = this.gallery.find(this.options.currentNumber);
			this.allNum = this.gallery.find(this.options.totalNumber);
		},
		attachEvents: function() {
			this.btnPrev.bind(this.options.event, this.bindScope(function(e){
				this.prevSlide();
				e.preventDefault();
			}));
			this.btnNext.bind(this.options.event, this.bindScope(function(e){
				this.nextSlide();
				e.preventDefault();
			}));
			
			// pause on hover handling
			if(this.options.pauseOnHover) {
				this.gallery.hover(this.bindScope(function(){
					if(this.options.autoRotation) {
						this.galleryHover = true;
						this.pauseRotation();
					}
				}), this.bindScope(function(){
					if(this.options.autoRotation) {
						this.galleryHover = false;
						this.resumeRotation();
					}
				}));
			}
			
			// autorotation buttons handler
			this.btnPlay.bind(this.options.event, this.bindScope(this.startRotation));
			this.btnPause.bind(this.options.event, this.bindScope(this.stopRotation));
			this.btnPlayPause.bind(this.options.event, this.bindScope(function(){
				if(!this.gallery.hasClass(this.options.autorotationActiveClass)) {
					this.startRotation();
				} else {
					this.stopRotation();
				}
			}));
			
			// swipe event handling
			if(isTouchDevice) {
				// enable hardware acceleration
				this.slider.css({'-webkit-transform': 'translate3d(0px, 0px, 0px)'});
				
				// swipe gestures
				if(this.options.handleTouch && $.fn.swipe) {
					this.mask.swipe({
						threshold: this.options.swipeThreshold,
						allowPageScroll: 'vertical',
						swipeStatus: $.proxy(function(e, phase, direction, distance) {
							if(phase === 'start') {
								this.originalOffset = parseInt(this.slider.stop(true, false).css(this.animProperty));
							} else if(phase === 'move') {
								if(direction === this.swipeProperties[0] || direction === this.swipeProperties[1]) {
									var tmpOffset = this.originalOffset + distance * (direction === this.swipeProperties[0] ? -1 : 1);
									if(!this.options.swipeGap) {
										tmpOffset = Math.max(Math.min(0, tmpOffset), this.maxOffset);
									}
									this.tmpProps = {};
									this.tmpProps[this.animProperty] = tmpOffset;
									this.slider.css(this.tmpProps);
									e.preventDefault();
								}
							} else if(phase === 'cancel') {
								// return to previous position
								this.switchSlide();
							}
						},this),
						swipe: $.proxy(function(event, direction) {
							if(direction === this.swipeProperties[0]) {
								if(this.currentStep === this.stepsCount - 1) this.switchSlide();
								else this.nextSlide();
							} else if(direction === this.swipeProperties[1]) {
								if(this.currentStep === 0) this.switchSlide();
								else this.prevSlide();
							}
						},this)
					});
				}
			}
		},
		onWindowResize: function() {
			if(!this.galleryAnimating) {
				this.calculateOffsets();
				this.refreshPosition();
				this.buildPagination();
				this.refreshState();
				this.resizeQueue = false;
			} else {
				this.resizeQueue = true;
			}
		},
		refreshPosition: function() {
			this.currentStep = Math.min(this.currentStep, this.stepsCount - 1);
			this.tmpProps = {};
			this.tmpProps[this.animProperty] = this.getStepOffset();
			this.slider.stop().css(this.tmpProps);
		},
		calculateOffsets: function() {
			this.maskSize = this.mask[this.innerSizeFunction]();
			this.sumSize = this.getSumSize();
			this.maxOffset = this.maskSize - this.sumSize;
			
			// vertical gallery with single size step custom behavior
			if(this.options.vertical && this.options.maskAutoSize) {
				this.options.step = 1;
				this.stepsCount = this.slides.length;
				this.stepOffsets = [0];
				var tmpOffset = 0;
				for(var i = 0; i < this.slides.length; i++) {
					tmpOffset -= $(this.slides[i])[this.fullSizeFunction](true);
					this.stepOffsets.push(tmpOffset);
				}
				this.maxOffset = tmpOffset;
				return;
			}
			
			// scroll by slide size
			if(typeof this.options.step === 'number' && this.options.step > 0) {
				this.slideDimensions = [];
				this.slides.each($.proxy(function(ind, obj){
					this.slideDimensions.push( $(obj)[this.fullSizeFunction](true) );
				},this));
				
				// calculate steps count
				this.stepOffsets = [0];
				this.stepsCount = 1;
				var tmpOffset = 0, tmpStep = 0;
				while(tmpOffset > this.maxOffset) {
					tmpOffset -= this.getSlideSize(tmpStep, tmpStep + this.options.step);
					tmpStep += this.options.step;
					this.stepOffsets.push(Math.max(tmpOffset, this.maxOffset));
					this.stepsCount++;
				}
			}
			// scroll by mask size
			else {
				// define step size
				this.stepSize = this.maskSize;
				
				// calculate steps count
				this.stepsCount = 1;
				var tmpOffset = 0;
				while(tmpOffset > this.maxOffset) {
					tmpOffset -= this.stepSize;
					this.stepsCount++;
				}
			}
		},
		getSumSize: function() {
			var sum = 0;
			this.slides.each($.proxy(function(ind, obj){
				sum += $(obj)[this.fullSizeFunction](true);
			},this));
			this.slider.css(this.innerSizeFunction, sum);
			return sum;
		},
		getStepOffset: function(step) {
			step = step || this.currentStep;
			if(typeof this.options.step === 'number') {
				return this.stepOffsets[this.currentStep];
			} else {
				return Math.max(-this.currentStep * this.stepSize, this.maxOffset);
			}
		},
		getSlideSize: function(i1, i2) {
			var sum = 0;
			for(var i = i1; i < Math.min(i2, this.slideDimensions.length); i++) {
				sum += this.slideDimensions[i];
			}
			return sum;
		},
		buildPagination: function() {
			if(this.options.generatePagination) {
				this.pagerHolder = this.gallery.find(this.options.generatePagination).empty();
				this.pagerList = $(this.options.pagerList).appendTo(this.pagerHolder);
				for(var i = 0; i < this.stepsCount; i++) {
					$(this.options.pagerListItem).appendTo(this.pagerList).find(this.options.pagerListItemText).text(i+1);
				}
				this.pagerLinks = this.pagerList.children();
				this.attachPaginationEvents();
			}
		},
		attachPaginationEvents: function() {
			this.pagerLinks.each(this.bindScope(function(ind, obj){
				$(obj).bind(this.options.event, this.bindScope(function(){
					this.numSlide(ind);
					return false;
				}));
			}));
		},
		prevSlide: function() {
			if(!(this.options.disableWhileAnimating && this.galleryAnimating)) {
				if(this.currentStep > 0) {
					this.currentStep--;
					this.switchSlide();
				} else if(this.options.circularRotation) {
					this.currentStep = this.stepsCount - 1;
					this.switchSlide();
				}
			}
		},
		nextSlide: function(fromAutoRotation) {
			if(!(this.options.disableWhileAnimating && this.galleryAnimating)) {
				if(this.currentStep < this.stepsCount - 1) {
					this.currentStep++;
					this.switchSlide();
				} else if(this.options.circularRotation || fromAutoRotation === true) {
					this.currentStep = 0;
					this.switchSlide();
				}
			}
		},
		numSlide: function(c) {
			if(this.currentStep != c) {
				this.currentStep = c;
				this.switchSlide();
			}
		},
		switchSlide: function() {
			this.galleryAnimating = true;
			this.tmpProps = {}
			this.tmpProps[this.animProperty] = this.getStepOffset();
			this.slider.stop().animate(this.tmpProps,{duration: this.options.animSpeed, complete: this.bindScope(function(){
				// animation complete
				this.galleryAnimating = false;
				if(this.resizeQueue) {
					this.onWindowResize();
				}
				
				// onchange callback
				this.makeCallback('onChange', [this]);
				this.autoRotate();
			})});
			this.refreshState();
			
			// onchange callback
			this.makeCallback('onBeforeChange', [this]);
		},
		refreshState: function(initial) {
			this.slides.removeClass(this.options.activeClass).eq(this.currentStep).addClass(this.options.activeClass);
			this.pagerLinks.removeClass(this.options.activeClass).eq(this.currentStep).addClass(this.options.activeClass);
			this.curNum.html(this.currentStep+1);
			this.allNum.html(this.stepsCount);
			
			// initial refresh
			if(this.options.maskAutoSize && typeof this.options.step === 'number') {
				this.tmpProps = {};
				this.tmpProps[this.maskSizeProperty] = this.slides.eq(Math.min(this.currentStep,this.slides.length-1))[this.slideSizeFunction](true);
				this.mask.stop()[initial ? 'css' : 'animate'](this.tmpProps);
			}
			
			// disabled state
			if(!this.options.circularRotation) {
				this.btnPrev.add(this.btnNext).removeClass(this.options.disabledClass);
				if(this.currentStep === 0) this.btnPrev.addClass(this.options.disabledClass);
				if(this.currentStep === this.stepsCount - 1) this.btnNext.addClass(this.options.disabledClass);
			}
		},
		startRotation: function() {
			this.options.autoRotation = true;
			this.galleryHover = false;
			this.autoRotationStopped = false;
			this.resumeRotation();
		},
		stopRotation: function() {
			this.galleryHover = true;
			this.autoRotationStopped = true;
			this.pauseRotation();
		},
		pauseRotation: function() {
			this.gallery.addClass(this.options.autorotationDisabledClass);
			this.gallery.removeClass(this.options.autorotationActiveClass);
			clearTimeout(this.timer);
		},
		resumeRotation: function() {
			if(!this.autoRotationStopped) {
				this.gallery.addClass(this.options.autorotationActiveClass);
				this.gallery.removeClass(this.options.autorotationDisabledClass);
				this.autoRotate();
			}
		},
		autoRotate: function() {
			clearTimeout(this.timer);
			if(this.options.autoRotation && !this.galleryHover && !this.autoRotationStopped) {
				this.timer = setTimeout(this.bindScope(function(){
					this.nextSlide(true);
				}), this.options.switchTime);
			} else {
				this.pauseRotation();
			}
		},
		bindScope: function(func, scope) {
			return $.proxy(func, scope || this);
		},
		makeCallback: function(name, args) {
			if(typeof this.options[name] === 'function') {
				this.options[name].apply(this, args);
			}
		}
	}
	
	// detect device type
	var isTouchDevice = (function() {
		try {
			return ('ontouchstart' in window) || window.DocumentTouch && document instanceof DocumentTouch;
		} catch (e) {
			return false;
		}
	}());
	
	// jquery plugin
	$.fn.scrollGallery = function(opt){
		return this.each(function(){
			$(this).data('ScrollGallery', new ScrollGallery($.extend(opt,{holder:this})));
		});
	}
}(jQuery));

/*
 * touchSwipe - jQuery Plugin
 * http://plugins.jquery.com/project/touchSwipe
 * http://labs.skinkers.com/touchSwipe/
 *
 * Copyright (c) 2010 Matt Bryson (www.skinkers.com)
 * Dual licensed under the MIT or GPL Version 2 licenses.
 *
 * $version: 1.2.5
 */
;(function(a){a.fn.swipe=function(c){if(!this){return false}var k={fingers:1,threshold:75,swipe:null,swipeLeft:null,swipeRight:null,swipeUp:null,swipeDown:null,swipeStatus:null,click:null,triggerOnTouchEnd:true,allowPageScroll:"auto"};var m="left";var l="right";var d="up";var s="down";var j="none";var u="horizontal";var q="vertical";var o="auto";var f="start";var i="move";var h="end";var n="cancel";var t="ontouchstart" in window,b=t?"touchstart":"mousedown",p=t?"touchmove":"mousemove",g=t?"touchend":"mouseup",r="touchcancel";var e="start";if(c.allowPageScroll==undefined&&(c.swipe!=undefined||c.swipeStatus!=undefined)){c.allowPageScroll=j}if(c){a.extend(k,c)}return this.each(function(){var D=this;var H=a(this);var E=null;var I=0;var x={x:0,y:0};var A={x:0,y:0};var K={x:0,y:0};function z(N){var M=t?N.touches[0]:N;e=f;if(t){I=N.touches.length}distance=0;direction=null;if(I==k.fingers||!t){x.x=A.x=M.pageX;x.y=A.y=M.pageY;if(k.swipeStatus){y(N,e)}}else{C(N)}D.addEventListener(p,J,false);D.addEventListener(g,L,false)}function J(N){if(e==h||e==n){return}var M=t?N.touches[0]:N;A.x=M.pageX;A.y=M.pageY;direction=v();if(t){I=N.touches.length}e=i;G(N,direction);if(I==k.fingers||!t){distance=B();if(k.swipeStatus){y(N,e,direction,distance)}if(!k.triggerOnTouchEnd){if(distance>=k.threshold){e=h;y(N,e);C(N)}}}else{e=n;y(N,e);C(N)}}function L(M){M.preventDefault();distance=B();direction=v();if(k.triggerOnTouchEnd){e=h;if((I==k.fingers||!t)&&A.x!=0){if(distance>=k.threshold){y(M,e);C(M)}else{e=n;y(M,e);C(M)}}else{e=n;y(M,e);C(M)}}else{if(e==i){e=n;y(M,e);C(M)}}D.removeEventListener(p,J,false);D.removeEventListener(g,L,false)}function C(M){I=0;x.x=0;x.y=0;A.x=0;A.y=0;K.x=0;K.y=0}function y(N,M){if(k.swipeStatus){k.swipeStatus.call(H,N,M,direction||null,distance||0)}if(M==n){if(k.click&&(I==1||!t)&&(isNaN(distance)||distance==0)){k.click.call(H,N,N.target)}}if(M==h){if(k.swipe){k.swipe.call(H,N,direction,distance)}switch(direction){case m:if(k.swipeLeft){k.swipeLeft.call(H,N,direction,distance)}break;case l:if(k.swipeRight){k.swipeRight.call(H,N,direction,distance)}break;case d:if(k.swipeUp){k.swipeUp.call(H,N,direction,distance)}break;case s:if(k.swipeDown){k.swipeDown.call(H,N,direction,distance)}break}}}function G(M,N){if(k.allowPageScroll==j){M.preventDefault()}else{var O=k.allowPageScroll==o;switch(N){case m:if((k.swipeLeft&&O)||(!O&&k.allowPageScroll!=u)){M.preventDefault()}break;case l:if((k.swipeRight&&O)||(!O&&k.allowPageScroll!=u)){M.preventDefault()}break;case d:if((k.swipeUp&&O)||(!O&&k.allowPageScroll!=q)){M.preventDefault()}break;case s:if((k.swipeDown&&O)||(!O&&k.allowPageScroll!=q)){M.preventDefault()}break}}}function B(){return Math.round(Math.sqrt(Math.pow(A.x-x.x,2)+Math.pow(A.y-x.y,2)))}function w(){var P=x.x-A.x;var O=A.y-x.y;var M=Math.atan2(O,P);var N=Math.round(M*180/Math.PI);if(N<0){N=360-Math.abs(N)}return N}function v(){var M=w();if((M<=45)&&(M>=0)){return m}else{if((M<=360)&&(M>=315)){return m}else{if((M>=135)&&(M<=225)){return l}else{if((M>45)&&(M<135)){return s}else{return d}}}}}try{this.addEventListener(b,z,false);this.addEventListener(r,C)}catch(F){}})}})(jQuery);

// init tabs when page ready
function initTabs() {
	if(typeof ContentTabs !== 'undefined') {
		ContentTabs.init();
	}
}

// content tabs module
ContentTabs = {
	options: {
		classOnParent: false,
		hiddenClass: 'tab-hidden',
		visibleClass: 'tab-active',
		activeClass: 'active',
		tabsets: 'ul.tabset',
		tablinks: 'a.tab',
		event: 'click'
	},
	init: function(){
		this.createStyleSheet();
		this.getTabsets();
		return this;
	},
	createStyleSheet: function() {
		this.tabStyleSheet = document.createElement('style');
		this.tabStyleSheet.setAttribute('type', 'text/css');
		this.tabStyleRule = '.'+this.options.hiddenClass;
		this.tabStyleRule += '{position:absolute !important;left:-9999px !important;top:-9999px !important;display:block !important}';
		document.getElementsByTagName('head')[0].appendChild(this.tabStyleSheet);
		if (this.tabStyleSheet.styleSheet) {
			this.tabStyleSheet.styleSheet.cssText = this.tabStyleRule;
		} else {
			this.tabStyleSheet.appendChild(document.createTextNode(this.tabStyleRule));
		}
	},
	getTabsets: function() {
		this.tabsets = this.queryElements(this.options.tabsets);
		for(var i = 0; i < this.tabsets.length; i++) {
			this.initTabset(this.tabsets[i]);
		}
	},
	initTabset: function(tabset) {
		var tabLinks = this.queryElements(this.options.tablinks, tabset), instance = this;
		for(var i = 0; i < tabLinks.length; i++) {
			tabLinks[i]['on'+this.options.event] = function(){
				instance.switchTab(this, tabLinks);
				return false;
			}
			if(this.hasClass(this.options.classOnParent ? tabLinks[i].parentNode : tabLinks[i], this.options.activeClass)) {
				this.switchTab(tabLinks[i], tabLinks);
			}
		}
	},
	switchTab: function(link, set) {
		for(var i = 0; i < set.length; i++) {
			var curLink = set[i];
			var curTab = document.getElementById(curLink.href.substr(curLink.href.indexOf('#')+1));
			if(curLink === link) {
				this.addClass(this.options.classOnParent ? curLink.parentNode : curLink, this.options.activeClass);
				this.addClass(curTab,this.options.visibleClass);
				this.removeClass(curTab,this.options.hiddenClass);
			} else {
				this.removeClass(this.options.classOnParent ? curLink.parentNode : curLink, this.options.activeClass);
				this.removeClass(curTab,this.options.visibleClass);
				this.addClass(curTab,this.options.hiddenClass);
			}
		}
	},
	queryElements: function(selector, holder) {
		var box = holder || document;
		if(box.querySelectorAll) {
			return box.querySelectorAll(selector);
		} else {
			var res = [], selectorData = selector.split('.');
			var tagName = selectorData[0];
			var set = box.getElementsByTagName(tagName);
			if(selectorData.length > 1) {
				for(var i = 0; i < set.length; i++) {
					if(this.hasClass(set[i], selectorData[1])) res.push(set[i]);
				}
				return res;
			} else {
				return set;
			}
		}
	},
	hasClass: function (obj,cname) {
		return (obj.className ? obj.className.match(new RegExp('(\\s|^)'+cname+'(\\s|$)')) : false);
	},
	addClass: function (obj,cname) {
		if (!this.hasClass(obj,cname)) obj.className += " "+cname;
	},
	removeClass: function (obj,cname) {
		if (this.hasClass(obj,cname)) obj.className=obj.className.replace(new RegExp('(\\s|^)'+cname+'(\\s|$)'),' ');
	}
};

function initAutoScalingNav(o) {
	if (!o.menuId) o.menuId = "nav";
	if (!o.tag) o.tag = "a";
	if (!o.spacing) o.spacing = 0;
	if (!o.constant) o.constant = 0;
	if (!o.minPaddings) o.minPaddings = 0;
	if (!o.liHovering) o.liHovering = false;
	if (!o.sideClasses) o.sideClasses = false;
	if (!o.equalLinks) o.equalLinks = false;
	if (!o.flexible) o.flexible = false;
	var nav = document.getElementById(o.menuId);
	if(nav) {
		nav.className += " scaling-active";
		var lis = nav.getElementsByTagName("li");
		var asFl = [];
		var lisFl = [];
		var width = 0;
		for (var i=0, j=0; i<lis.length; i++) {
			if(lis[i].parentNode == nav) {
				var t = lis[i].getElementsByTagName(o.tag).item(0);
				asFl.push(t);
				asFl[j++].width = t.offsetWidth;
				lisFl.push(lis[i]);
				if(width < t.offsetWidth) width = t.offsetWidth;
			}
			if(o.liHovering) {
				lis[i].onmouseover = function() {
					this.className += " hover";
				}
				lis[i].onmouseout = function() {
					this.className = this.className.replace("hover", "");
				}
			}
		}
		var menuWidth = nav.clientWidth - asFl.length*o.spacing - o.constant;
		if(o.equalLinks && width * asFl.length < menuWidth) {
			for (var i=0; i<asFl.length; i++) {
				asFl[i].width = width;
			}
		}
		width = getItemsWidth(asFl);
		if(width < menuWidth) {
			var version = navigator.userAgent.toLowerCase();
			for (var i=0; getItemsWidth(asFl) < menuWidth; i++) {
				asFl[i].width++;
				if(!o.flexible) {
					asFl[i].style.width = asFl[i].width + "px";
				}
				if(i >= asFl.length-1) i=-1;
			}
			if(o.flexible) {
				for (var i=0; i<asFl.length; i++) {
					width = (asFl[i].width - o.spacing - o.constant/asFl.length)/menuWidth*100;
					if(i != asFl.length-1) {
						lisFl[i].style.width = width + "%";
					}
					else {
						if(navigator.appName.indexOf("Microsoft Internet Explorer") == -1 || version.indexOf("msie 8") != -1 || version.indexOf("msie 9") != -1)
							lisFl[i].style.width = width + "%";
					}
				}
			}
		}
		else if(o.minPaddings > 0) {
			for (var i=0; i<asFl.length; i++) {
				asFl[i].style.paddingLeft = o.minPaddings + "px";
				asFl[i].style.paddingRight = o.minPaddings + "px";
			}
		}
		if(o.sideClasses) {
			lisFl[0].className += " first-child";
			lisFl[0].getElementsByTagName(o.tag).item(0).className += " first-child-a";
			lisFl[lisFl.length-1].className += " last-child";
			lisFl[lisFl.length-1].getElementsByTagName(o.tag).item(0).className += " last-child-a";
		}
		nav.className += " scaling-ready";
	}
	function getItemsWidth(a) {
		var w = 0;
		for(var q=0; q<a.length; q++) {
			w += a[q].width;
		}
		return w;
	}
}

//drop
function initDropDown()
{
	var nav = document.getElementById("nav");
	if(nav) {
		var lis = nav.getElementsByTagName("li");
		for (var i=0; i<lis.length; i++) {
			if(lis[i].getElementsByTagName("ul").length > 0) {
				lis[i].className += " has-drop-down"
				lis[i].getElementsByTagName("a")[0].className += " has-drop-down-a"
			}
			lis[i].onmouseover = function()	{
				this.className += " hover";
			}
			lis[i].onmouseout = function() {
				this.className = this.className.replace(" hover", "");
			}
		}
	}
}

	
//pressed btn
function initButtons()
{
	var buttons = document.getElementsByTagName("input");
	for(var i = 0; i < buttons.length; i++) {
		if(buttons[i].className.indexOf("btn") != -1) {
			buttons[i].onmousedown = function() {
				if(this.className.indexOf("pressed") == -1) this.className += " pressed";
			}
			buttons[i].onmouseup = function() {
				this.className = this.className.replace("pressed","");
			}
			buttons[i].onmouseout = function() {
				this.className = this.className.replace("pressed","");
			} 
		}
	}
}

/*! http://mths.be/placeholder v2.0.6 by @mathias */
;(function(window, document, $) {

	var isInputSupported = 'placeholder' in document.createElement('input'),
	    isTextareaSupported = 'placeholder' in document.createElement('textarea'),
	    prototype = $.fn,
	    valHooks = $.valHooks,
	    hooks,
	    placeholder;
	if(navigator.userAgent.indexOf('Opera/') != -1) {
		isInputSupported = isTextareaSupported = false;
	}
	if (isInputSupported && isTextareaSupported) {

		placeholder = prototype.placeholder = function() {
			return this;
		};

		placeholder.input = placeholder.textarea = true;

	} else {

		placeholder = prototype.placeholder = function() {
			var $this = this;
			$this
				.filter((isInputSupported ? 'textarea' : ':input') + '[placeholder]')
				.not('.placeholder')
				.bind({
					'focus.placeholder': clearPlaceholder,
					'blur.placeholder': setPlaceholder
				})
				.data('placeholder-enabled', true)
				.trigger('blur.placeholder');
			return $this;
		};

		placeholder.input = isInputSupported;
		placeholder.textarea = isTextareaSupported;

		hooks = {
			'get': function(element) {
				var $element = $(element);
				return $element.data('placeholder-enabled') && $element.hasClass('placeholder') ? '' : element.value;
			},
			'set': function(element, value) {
				var $element = $(element);
				if (!$element.data('placeholder-enabled')) {
					return element.value = value;
				}
				if (value == '') {
					element.value = value;
					// Issue #56: Setting the placeholder causes problems if the element continues to have focus.
					if (element != document.activeElement) {
						// We can�t use `triggerHandler` here because of dummy text/password inputs :(
						setPlaceholder.call(element);
					}
				} else if ($element.hasClass('placeholder')) {
					clearPlaceholder.call(element, true, value) || (element.value = value);
				} else {
					element.value = value;
				}
				// `set` can not return `undefined`; see http://jsapi.info/jquery/1.7.1/val#L2363
				return $element;
			}
		};

		isInputSupported || (valHooks.input = hooks);
		isTextareaSupported || (valHooks.textarea = hooks);

		$(function() {
			// Look for forms
			$(document).delegate('form', 'submit.placeholder', function() {
				// Clear the placeholder values so they don�t get submitted
				var $inputs = $('.placeholder', this).each(clearPlaceholder);
				setTimeout(function() {
					$inputs.each(setPlaceholder);
				}, 10);
			});
		});

		// Clear placeholder values upon page reload
		$(window).bind('beforeunload.placeholder', function() {
			$('.placeholder').each(function() {
				this.value = '';
			});
		});

	}

	function args(elem) {
		// Return an object of element attributes
		var newAttrs = {},
		    rinlinejQuery = /^jQuery\d+$/;
		$.each(elem.attributes, function(i, attr) {
			if (attr.specified && !rinlinejQuery.test(attr.name)) {
				newAttrs[attr.name] = attr.value;
			}
		});
		return newAttrs;
	}

	function clearPlaceholder(event, value) {
		var input = this,
		    $input = $(input),
		    hadFocus;
		if (input.value == $input.attr('placeholder') && $input.hasClass('placeholder')) {
			hadFocus = input == document.activeElement;
			if ($input.data('placeholder-password')) {
				$input = $input.hide().next().show().attr('id', $input.removeAttr('id').data('placeholder-id'));
				// If `clearPlaceholder` was called from `$.valHooks.input.set`
				if (event === true) {
					return $input[0].value = value;
				}
				$input.focus();
			} else {
				input.value = '';
				$input.removeClass('placeholder');
			}
			hadFocus && input.select();
		}
	}

	function setPlaceholder() {
		var $replacement,
		    input = this,
		    $input = $(input),
		    $origInput = $input,
		    id = this.id;
		if (input.value == '') {
			if (input.type == 'password') {
				if (!$input.data('placeholder-textinput')) {
					try {
						$replacement = $input.clone().attr({ 'type': 'text' });
					} catch(e) {
						$replacement = $('<input>').attr($.extend(args(this), { 'type': 'text' }));
					}
					$replacement
						.removeAttr('name')
						.data({
							'placeholder-password': true,
							'placeholder-id': id
						})
						.bind('focus.placeholder', clearPlaceholder);
					$input
						.data({
							'placeholder-textinput': $replacement,
							'placeholder-id': id
						})
						.before($replacement);
				}
				$input = $input.removeAttr('id').hide().prev().attr('id', id).show();
				// Note: `$input[0] != input` now!
			}
			$input.addClass('placeholder');
			$input[0].value = $input.attr('placeholder');
		} else {
			$input.removeClass('placeholder');
		}
	}

}(this, document, jQuery));

function getProportion(elementWidth,elementHeight,maskWidth,maskHeight) {
	// calculate element coords to fit in mask
	var ratio = (elementWidth / elementHeight);
	var slideWidth = maskWidth, slideHeight = slideWidth / ratio;
	if(slideHeight < maskHeight) {
		slideHeight = maskHeight;
		slideWidth = slideHeight * ratio;
	}
	return {
		width: slideWidth,
		height: slideHeight,
		top: (maskHeight - slideHeight) / 2,
		left: (maskWidth - slideWidth) / 2
	}
}

function resizeImage(){
	jQuery('#main').each(function(){
		var slides = jQuery('.slideshow > li', jQuery(this));
		slides.each(function(){
			var slide = jQuery(this);
			var img = slide.find('>images');
			if(img.length){
				var data = getProportion(img.width(),img.height(),slide.width(),slide.height());
				img.css({
					width: data.width,
					height: data.height,
					top: data.top,
					left: data.left
				})
			}
		});
	});
}

// To test the @id toggling on password inputs in browsers that don�t support changing an input�s @type dynamically (e.g. Firefox 3.6 or IE), uncomment this:
// $.fn.hide = function() { return this; }
// Then uncomment the last rule in the <style> element (in the <head>).
$(function() {
	// Invoke the plugin
	$('input, textarea').placeholder();
	resizeImage();
});

jQuery(window).resize(resizeImage);

// browser detect script
browserDetect = {
	matchGroups: [
		[
			{uaString:'win', className:'win'},
			{uaString:'mac', className:'mac'},
			{uaString:['linux','x11'], className:'linux'}
		],
		[
			{uaString:'msie', className:'trident'},
			{uaString:'applewebkit', className:'webkit'},
			{uaString:'gecko', className:'gecko'},
			{uaString:'opera', className:'presto'}
		],
		[
			{uaString:'msie 9.0', className:'ie9'},
			{uaString:'msie 8.0', className:'ie8'},
			{uaString:'msie 7.0', className:'ie7'},
			{uaString:'msie 6.0', className:'ie6'},
			{uaString:'firefox/2', className:'ff2'},
			{uaString:'firefox/3', className:'ff3'},
			{uaString:'firefox/4', className:'ff4'},
			{uaString:['opera','version/11'], className:'opera11'},
			{uaString:['opera','version/10'], className:'opera10'},
			{uaString:'opera/9', className:'opera9'},
			{uaString:['safari','version/3'], className:'safari3'},
			{uaString:['safari','version/4'], className:'safari4'},
			{uaString:['safari','version/5'], className:'safari5'},
			{uaString:'chrome', className:'chrome'},
			{uaString:'safari', className:'safari2'},
			{uaString:'unknown', className:'unknown'}
		]
	],
	init: function() {
		this.detect();
		return this;
	},
	addClass: function(className) {
		this.pageHolder = document.documentElement;
		document.documentElement.className += ' '+className;
	},
	detect: function() {
		for(var i = 0, curGroup; i < this.matchGroups.length; i++) {
			curGroup = this.matchGroups[i];
			for(var j = 0, curItem; j < curGroup.length; j++) {
				curItem = curGroup[j];
				if(typeof curItem.uaString === 'string') {
					if(this.uaMatch(curItem.uaString)) {
						this.addClass(curItem.className);
						break;
					}
				} else {
					for(var k = 0, allMatch = true; k < curItem.uaString.length; k++) {
						if(!this.uaMatch(curItem.uaString[k])) {
							allMatch = false;
							break;
						}
					}
					if(allMatch) {
						this.addClass(curItem.className);
						break;
					}
				}
			}
		}
	},
	uaMatch: function(s) {
		if(!this.ua) {
			this.ua = navigator.userAgent.toLowerCase();
		}
		return this.ua.indexOf(s) != -1;
	}
}.init();



// html5shiv @rem remysharp.com/html5-enabling-script
// iepp v1.6.2 @jon_neal iecss.com/print-protector
// Dual licensed under the MIT or GPL Version 2 licenses
;(function(){
    /*@cc_on(function(a,b){function r(a){var b=-1;while(++b<f)a.createElement(e[b])}if(!(!window.attachEvent||!b.createStyleSheet||!function(){var a=document.createElement("div");a.innerHTML="<elem></elem>";return a.childNodes.length!==1}())){a.iepp=a.iepp||{};var c=a.iepp,d=c.html5elements||"abbr|article|aside|audio|canvas|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video",e=d.split("|"),f=e.length,g=new RegExp("(^|\\s)("+d+")","gi"),h=new RegExp("<(/*)("+d+")","gi"),i=/^\s*[\{\}]\s*$/,j=new RegExp("(^|[^\\n]*?\\s)("+d+")([^\\n]*)({[\\n\\w\\W]*?})","gi"),k=b.createDocumentFragment(),l=b.documentElement,m=l.firstChild,n=b.createElement("body"),o=b.createElement("style"),p=/print|all/,q;c.getCSS=function(a,b){if(a+""===undefined)return"";var d=-1,e=a.length,f,g=[];while(++d<e){f=a[d];if(f.disabled)continue;b=f.media||b,p.test(b)&&g.push(c.getCSS(f.imports,b),f.cssText),b="all"}return g.join("")},c.parseCSS=function(a){var b=[],c;while((c=j.exec(a))!=null)b.push(((i.exec(c[1])?"\n":c[1])+c[2]+c[3]).replace(g,"$1.iepp_$2")+c[4]);return b.join("\n")},c.writeHTML=function(){var a=-1;q=q||b.body;while(++a<f){var c=b.getElementsByTagName(e[a]),d=c.length,g=-1;while(++g<d)c[g].className.indexOf("iepp_")<0&&(c[g].className+=" iepp_"+e[a])}k.appendChild(q),l.appendChild(n),n.className=q.className,n.id=q.id,n.innerHTML=q.innerHTML.replace(h,"<$1font")},c._beforePrint=function(){o.styleSheet.cssText=c.parseCSS(c.getCSS(b.styleSheets,"all")),c.writeHTML()},c.restoreHTML=function(){n.innerHTML="",l.removeChild(n),l.appendChild(q)},c._afterPrint=function(){c.restoreHTML(),o.styleSheet.cssText=""},r(b),r(k);if(c.disablePP)return;m.insertBefore(o,m.firstChild),o.media="print",o.className="iepp-printshim",a.attachEvent("onbeforeprint",c._beforePrint),a.attachEvent("onafterprint",c._afterPrint)}})(this,document);@*/
}());



/*
 * JavaScript Custom Forms 1.4.0
 */
jcf = {
	// global options
	modules: {},
	plugins: {},
	baseOptions: {
		labelActiveClass: 'jcf-label-active',
		hiddenClass:'jcf-hidden',
		focusClass:'jcf-focus',
		wrapperTag: 'div'
	},
	// replacer function
	customForms: {
		setOptions: function(obj) {
			for(var p in obj) {
				if(obj.hasOwnProperty(p) && typeof obj[p] === 'object') {
					jcf.lib.extend(jcf.modules[p].prototype.defaultOptions, obj[p]);
				}
			}
		},
		replaceAll: function() {
			for(var k in jcf.modules) {
				var els = jcf.lib.queryBySelector(jcf.modules[k].prototype.selector);
				for(var i = 0; i<els.length; i++) {
					if(els[i].jcf) {
						// refresh form element state
						els[i].jcf.refreshState();
					} else {
						// replace form element
						if(jcf.modules[k].prototype.checkElement(els[i])) {
							new jcf.modules[k]({
								replaces:els[i]
							});
						}
					}
				}
			}
		},
		refreshAll: function() {
			for(var k in jcf.modules) {
				var els = jcf.lib.queryBySelector(jcf.modules[k].prototype.selector);
				for(var i = 0; i<els.length; i++) {
					if(els[i].jcf) {
						// refresh form element state
						els[i].jcf.refreshState();
					}
				}
			}
		},
		refreshElement: function(obj) {
			if(obj && obj.jcf) {
				obj.jcf.refreshState();
			}
		},
		destroyAll: function() {
			for(var k in jcf.modules) {
				var els = jcf.lib.queryBySelector(jcf.modules[k].prototype.selector);
				for(var i = 0; i<els.length; i++) {
					if(els[i].jcf) {
						els[i].jcf.destroy();
					}
				}
			}
		}
	},	
	// detect device type
	isTouchDevice: (function() {
		try {
			return ('ontouchstart' in window) || window.DocumentTouch && document instanceof DocumentTouch;
		} catch (e) {
			return false;
		}
	}()),
	// define base module
	setBaseModule: function(obj) {
		jcf.customControl = function(opt){
			this.options = jcf.lib.extend({}, jcf.baseOptions, this.defaultOptions, opt);
			this.init();
		}
		for(var p in obj) {
			jcf.customControl.prototype[p] = obj[p];
		}
	},
	// add module to jcf.modules
	addModule: function(obj) {
		if(obj.name){
			// create new module proto class
			jcf.modules[obj.name] = function(){
				jcf.modules[obj.name].superclass.constructor.apply(this, arguments);
			}
			jcf.lib.inherit(jcf.modules[obj.name], jcf.customControl);
			for(var p in obj) {
				jcf.modules[obj.name].prototype[p] = obj[p]
			}
			// on create module
			jcf.modules[obj.name].prototype.onCreateModule();
			// make callback for exciting modules
			for(var mod in jcf.modules) {
				if(jcf.modules[mod] != jcf.modules[obj.name]) {
					jcf.modules[mod].prototype.onModuleAdded(jcf.modules[obj.name]);
				}
			}
		}
	},
	// add plugin to jcf.plugins
	addPlugin: function(obj) {
		if(obj && obj.name) {
			jcf.plugins[obj.name] = function() {
				this.init.apply(this, arguments);
			}
			for(var p in obj) {
				jcf.plugins[obj.name].prototype[p] = obj[p];
			}
		}
	},
	// miscellaneous init
	init: function(){
		this.eventPress = this.isTouchDevice ? 'touchstart' : 'mousedown';
		this.eventMove = this.isTouchDevice ? 'touchmove' : 'mousemove';
		this.eventRelease = this.isTouchDevice ? 'touchend' : 'mouseup';
		return this;
	}
}.init();

/*
 * Custom Form Control prototype
 */
jcf.setBaseModule({
	init: function(){
		if(this.options.replaces) {
			this.realElement = this.options.replaces;
			this.realElement.jcf = this;
			this.replaceObject();
		}
	},
	defaultOptions: {
		// default module options (will be merged with base options)
	},
	checkElement: function(el){
		return true; // additional check for correct form element
	},
	replaceObject: function(){
		this.createWrapper();
		this.attachEvents();
		this.fixStyles();
		this.setupWrapper();
	},
	createWrapper: function(){
		this.fakeElement = jcf.lib.createElement(this.options.wrapperTag);
		this.labelFor = jcf.lib.getLabelFor(this.realElement);
		jcf.lib.disableTextSelection(this.fakeElement);
		jcf.lib.addClass(this.realElement, jcf.baseOptions.hiddenClass);
	},
	attachEvents: function(){
		jcf.lib.event.add(this.realElement, 'focus', this.onFocusHandler, this);
		jcf.lib.event.add(this.realElement, 'blur', this.onBlurHandler, this);
		jcf.lib.event.add(this.fakeElement, 'click', this.onFakeClick, this);
		jcf.lib.event.add(this.fakeElement, jcf.eventPress, this.onFakePressed, this);
		jcf.lib.event.add(this.fakeElement, jcf.eventRelease, this.onFakeReleased, this);

		if(this.labelFor) {
			this.labelFor.jcf = this;
			jcf.lib.event.add(this.labelFor, 'click', this.onFakeClick, this);
			jcf.lib.event.add(this.labelFor, jcf.eventPress, this.onFakePressed, this);
			jcf.lib.event.add(this.labelFor, jcf.eventRelease, this.onFakeReleased, this);
		}
	},
	fixStyles: function() {
		// hide mobile webkit tap effect
		var tapStyle = 'rgba(255,255,255,0)';
		this.realElement.style.webkitTapHighlightColor = tapStyle; 
		this.fakeElement.style.webkitTapHighlightColor = tapStyle; 
		if(this.labelFor) {
			this.labelFor.style.webkitTapHighlightColor = tapStyle; 
		}
	},
	setupWrapper: function(){
		// implement in subclass
	},
	refreshState: function(){
		// implement in subclass
	},
	destroy: function() {
		if(this.fakeElement && this.fakeElement.parentNode) {
			this.fakeElement.parentNode.removeChild(this.fakeElement);
		}
		jcf.lib.removeClass(this.realElement, jcf.baseOptions.hiddenClass);
		this.realElement.jcf = null;
	},
	onFocus: function(){
		// emulated focus event
		jcf.lib.addClass(this.fakeElement,this.options.focusClass);
	},
	onBlur: function(cb){
		// emulated blur event
		jcf.lib.removeClass(this.fakeElement,this.options.focusClass);
	},
	onFocusHandler: function() {
		// handle focus loses
		if(this.focused) return;
		this.focused = true;
		
		// handle touch devices also
		if(jcf.isTouchDevice) {
			if(jcf.focusedInstance && jcf.focusedInstance.realElement != this.realElement) {
				jcf.focusedInstance.onBlur();
				jcf.focusedInstance.realElement.blur();
			}
			jcf.focusedInstance = this;
		}
		this.onFocus.apply(this, arguments);
	},
	onBlurHandler: function() {
		// handle focus loses
		if(!this.pressedFlag) {
			this.focused = false;
			this.onBlur.apply(this, arguments);
		}
	},
	onFakeClick: function(){
		if(jcf.isTouchDevice) {
			this.onFocus();
		} else {
			this.realElement.focus();
		}
	},
	onFakePressed: function(e){
		this.pressedFlag = true;
	},
	onFakeReleased: function(){
		this.pressedFlag = false;
	},
	onCreateModule: function(){
		// implement in subclass
	},
	onModuleAdded: function(module) {
		// implement in subclass
	},
	onControlReady: function() {
		// implement in subclass
	}
});

/*
 * JCF Utility Library
 */
jcf.lib = {
	bind: function(func, scope){
		return function() {
			return func.apply(scope, arguments);
		}
	},
	browser: (function() {
		var ua = navigator.userAgent.toLowerCase(), res = {},
		match = /(webkit)[ \/]([\w.]+)/.exec(ua) || /(opera)(?:.*version)?[ \/]([\w.]+)/.exec(ua) ||
				/(msie) ([\w.]+)/.exec(ua) || ua.indexOf("compatible") < 0 && /(mozilla)(?:.*? rv:([\w.]+))?/.exec(ua) || [];
		res[match[1]] = true;
		res.version = match[2] || "0";
		res.safariMac = ua.indexOf('mac') != -1 && ua.indexOf('safari') != -1;
		return res;
	})(),
	getOffset: function (obj) {
		if (obj.getBoundingClientRect) {
			var scrollLeft = window.pageXOffset || document.documentElement.scrollLeft || document.body.scrollLeft;
			var scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
			var clientLeft = document.documentElement.clientLeft || document.body.clientLeft || 0;
			var clientTop = document.documentElement.clientTop || document.body.clientTop || 0;
			return {
				top:Math.round(obj.getBoundingClientRect().top + scrollTop - clientTop),
				left:Math.round(obj.getBoundingClientRect().left + scrollLeft - clientLeft)
			}
		} else {
			var posLeft = 0, posTop = 0;
			while (obj.offsetParent) {posLeft += obj.offsetLeft; posTop += obj.offsetTop; obj = obj.offsetParent;}
			return {top:posTop,left:posLeft};
		}
	},
	getScrollTop: function() {
		return window.pageYOffset || document.documentElement.scrollTop;
	},
	getScrollLeft: function() {
		return window.pageXOffset || document.documentElement.scrollLeft;
	},
	getWindowWidth: function(){
		return document.compatMode=='CSS1Compat' ? document.documentElement.clientWidth : document.body.clientWidth;
	},
	getWindowHeight: function(){
		return document.compatMode=='CSS1Compat' ? document.documentElement.clientHeight : document.body.clientHeight;
	},
	getStyle: function(el, prop) {
		if (document.defaultView && document.defaultView.getComputedStyle) {
			return document.defaultView.getComputedStyle(el, null)[prop];
		} else if (el.currentStyle) {
			return el.currentStyle[prop];
		} else {
			return el.style[prop];
		}
	},
	getParent: function(obj, selector) {
		while(obj.parentNode && obj.parentNode != document.body) {
			if(obj.parentNode.tagName.toLowerCase() == selector.toLowerCase()) {
				return obj.parentNode;
			}
			obj = obj.parentNode;
		}
		return false;
	},
	isParent: function(child, parent) {
		while(child.parentNode) {
			if(child.parentNode === parent) {
				return true;
			}
			child = child.parentNode;
		}
		return false;
	},
	getLabelFor: function(object) {
		if(jcf.lib.getParent(object,'label')) {
			return object.parentNode;
		} else if(object.id) {
			return jcf.lib.queryBySelector('label[for=' + object.id + ']')[0];
		}
	},
	disableTextSelection: function(el){
		el.setAttribute('unselectable', 'on');
		el.style.MozUserSelect = 'none';
		el.style.WebkitUserSelect = 'none';
		el.style.UserSelect = 'none';
		el.onselectstart = function() {return false};
	},
	enableTextSelection: function(el) {
		el.removeAttribute('unselectable');
		el.style.MozUserSelect = '';
		el.style.WebkitUserSelect = '';
		el.style.UserSelect = '';
		el.onselectstart = null;
	},
	queryBySelector: function(selector, scope){
		return this.getElementsBySelector(selector, scope);
	},
	prevSibling: function(node) {
		while(node = node.previousSibling) if(node.nodeType == 1) break;
		return node;
	},
	nextSibling: function(node) {
		while(node = node.nextSibling) if(node.nodeType == 1) break;
		return node;
	},
	fireEvent: function(element,event) {
		if (document.createEventObject){
			var evt = document.createEventObject();
			return element.fireEvent('on'+event,evt)
		}
		else{
			var evt = document.createEvent('HTMLEvents');
			evt.initEvent(event, true, true );
			return !element.dispatchEvent(evt);
		}
	},
	isParent: function(p, c) {
		while(c.parentNode) {
			if(p == c) {
				return true;
			}
			c = c.parentNode;
		}
		return false;
	},
	inherit: function(Child, Parent) {
		var F = function() { }
		F.prototype = Parent.prototype
		Child.prototype = new F()
		Child.prototype.constructor = Child
		Child.superclass = Parent.prototype
	},
	extend: function(obj) {
		for(var i = 1; i < arguments.length; i++) {
			for(var p in arguments[i]) {
				if(arguments[i].hasOwnProperty(p)) {
					obj[p] = arguments[i][p];
				}
			}
		}
		return obj;
	},
	hasClass: function (obj,cname) {
		return (obj.className ? obj.className.match(new RegExp('(\\s|^)'+cname+'(\\s|$)')) : false);
	},
	addClass: function (obj,cname) {
		if (!this.hasClass(obj,cname)) obj.className += " "+cname;
	},
	removeClass: function (obj,cname) {
		if (this.hasClass(obj,cname)) obj.className=obj.className.replace(new RegExp('(\\s|^)'+cname+'(\\s|$)'),' ');
	},
	toggleClass: function(obj, cname, condition) {
		if(condition) this.addClass(obj, cname); else this.removeClass(obj, cname);
	},
	createElement: function(tagName, options) {
		var el = document.createElement(tagName);
		for(var p in options) {
			if(options.hasOwnProperty(p)) {
				switch (p) {
					case 'class': el.className = options[p]; break;
					case 'html': el.innerHTML = options[p]; break;
					case 'style': this.setStyles(el, options[p]); break;
					default: el.setAttribute(p, options[p]);
				}
			}
		}
		return el;
	},
	setStyles: function(el, styles) {
		for(var p in styles) {
			if(styles.hasOwnProperty(p)) {
				switch (p) {
					case 'float': el.style.cssFloat = styles[p]; break;
					case 'opacity': el.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity='+styles[p]*100+')'; el.style.opacity = styles[p]; break;
					default: el.style[p] = (typeof styles[p] === 'undefined' ? 0 : styles[p]) + (typeof styles[p] === 'number' ? 'px' : '');
				}
			}
		}
		return el;
	},
	getInnerWidth: function(el) {
		return el.offsetWidth - (parseInt(this.getStyle(el,'paddingLeft')) || 0) - (parseInt(this.getStyle(el,'paddingRight')) || 0);
	},
	getInnerHeight: function(el) {
		return el.offsetHeight - (parseInt(this.getStyle(el,'paddingTop')) || 0) - (parseInt(this.getStyle(el,'paddingBottom')) || 0);
	},
	getAllClasses: function(cname, prefix, skip) {
		if(!skip) skip = '';
		if(!prefix) prefix = '';
		return cname ? cname.replace(new RegExp('(\\s|^)'+skip+'(\\s|$)'),' ').replace(/[\s]*([\S]+)+[\s]*/gi,prefix+"$1 ") : '';
	},
	getElementsBySelector: function(selector, scope) {
		if(typeof document.querySelectorAll === 'function') {
			return (scope || document).querySelectorAll(selector);
		}
		var selectors = selector.split(',');
		var resultList = [];
		for(var s = 0; s < selectors.length; s++) {
			var currentContext = [scope || document];
			var tokens = selectors[s].replace(/^\s+/,'').replace(/\s+$/,'').split(' ');
			for (var i = 0; i < tokens.length; i++) {
				token = tokens[i].replace(/^\s+/,'').replace(/\s+$/,'');
				if (token.indexOf('#') > -1) {
					var bits = token.split('#'), tagName = bits[0], id = bits[1];
					var element = document.getElementById(id);
					if (tagName && element.nodeName.toLowerCase() != tagName) {
						return [];
					}
					currentContext = [element];
					continue;
				}
				if (token.indexOf('.') > -1) {
					var bits = token.split('.'), tagName = bits[0] || '*', className = bits[1], found = [], foundCount = 0;
					for (var h = 0; h < currentContext.length; h++) {
						var elements;
						if (tagName == '*') {
							elements = currentContext[h].getElementsByTagName('*');
						} else {
							elements = currentContext[h].getElementsByTagName(tagName);
						}
						for (var j = 0; j < elements.length; j++) {
							found[foundCount++] = elements[j];
						}
					}
					currentContext = [];
					var currentContextIndex = 0;
					for (var k = 0; k < found.length; k++) {
						if (found[k].className && found[k].className.match(new RegExp('(\\s|^)'+className+'(\\s|$)'))) {
							currentContext[currentContextIndex++] = found[k];
						}
					}
					continue;
				}
				if (token.match(/^(\w*)\[(\w+)([=~\|\^\$\*]?)=?"?([^\]"]*)"?\]$/)) {
					var tagName = RegExp.$1 || '*', attrName = RegExp.$2, attrOperator = RegExp.$3, attrValue = RegExp.$4;
					if(attrName.toLowerCase() == 'for' && this.browser.msie && this.browser.version < 8) {
						attrName = 'htmlFor';
					}
					var found = [], foundCount = 0;
					for (var h = 0; h < currentContext.length; h++) {
						var elements;
						if (tagName == '*') {
							elements = currentContext[h].getElementsByTagName('*');
						} else {
							elements = currentContext[h].getElementsByTagName(tagName);
						}
						for (var j = 0; j < elements.length; j++) {
							found[foundCount++] = elements[j];
						}
					}
					currentContext = [];
					var currentContextIndex = 0, checkFunction;
					switch (attrOperator) {
						case '=': checkFunction = function(e) { return (e.getAttribute(attrName) == attrValue) }; break;
						case '~': checkFunction = function(e) { return (e.getAttribute(attrName).match(new RegExp('(\\s|^)'+attrValue+'(\\s|$)'))) }; break;
						case '|': checkFunction = function(e) { return (e.getAttribute(attrName).match(new RegExp('^'+attrValue+'-?'))) }; break;
						case '^': checkFunction = function(e) { return (e.getAttribute(attrName).indexOf(attrValue) == 0) }; break;
						case '$': checkFunction = function(e) { return (e.getAttribute(attrName).lastIndexOf(attrValue) == e.getAttribute(attrName).length - attrValue.length) }; break;
						case '*': checkFunction = function(e) { return (e.getAttribute(attrName).indexOf(attrValue) > -1) }; break;
						default : checkFunction = function(e) { return e.getAttribute(attrName) };
					}
					currentContext = [];
					var currentContextIndex = 0;
					for (var k = 0; k < found.length; k++) {
						if (checkFunction(found[k])) {
							currentContext[currentContextIndex++] = found[k];
						}
					}
					continue;
				}
				tagName = token;
				var found = [], foundCount = 0;
				for (var h = 0; h < currentContext.length; h++) {
					var elements = currentContext[h].getElementsByTagName(tagName);
					for (var j = 0; j < elements.length; j++) {
						found[foundCount++] = elements[j];
					}
				}
				currentContext = found;
			}
			resultList = [].concat(resultList,currentContext);
		}
		return resultList;
	},
	scrollSize: (function(){
		var content, hold, sizeBefore, sizeAfter;
		function buildSizer(){
			if(hold) removeSizer();
			content = document.createElement('div');
			hold = document.createElement('div');
			hold.style.cssText = 'position:absolute;overflow:hidden;width:100px;height:100px';
			hold.appendChild(content);
			document.body.appendChild(hold);
		}
		function removeSizer(){
			document.body.removeChild(hold);
			hold = null;
		}
		function calcSize(vertical) {
			buildSizer();
			content.style.cssText = 'height:'+(vertical ? '100%' : '200px');
			sizeBefore = (vertical ? content.offsetHeight : content.offsetWidth);
			hold.style.overflow = 'scroll'; content.innerHTML = 1;
			sizeAfter = (vertical ? content.offsetHeight : content.offsetWidth);
			if(vertical && hold.clientHeight) sizeAfter = hold.clientHeight;
			removeSizer();
			return sizeBefore - sizeAfter;
		}
		return {
			getWidth:function(){
				return calcSize(false);
			},
			getHeight:function(){
				return calcSize(true)
			}
		}
	}()),
	domReady: function (handler){
		var called = false
		function ready() {
			if (called) return;
			called = true;
			handler();
		}
		if (document.addEventListener) {
			document.addEventListener("DOMContentLoaded", ready, false);
		} else if (document.attachEvent) {
			if (document.documentElement.doScroll && window == window.top) {
				function tryScroll(){
					if (called) return
					if (!document.body) return
					try {
						document.documentElement.doScroll("left")
						ready()
					} catch(e) {
						setTimeout(tryScroll, 0)
					}
				}
				tryScroll()
			}
			document.attachEvent("onreadystatechange", function(){
				if (document.readyState === "complete") {
					ready()
				}
			})
		}
		if (window.addEventListener) window.addEventListener('load', ready, false)
		else if (window.attachEvent) window.attachEvent('onload', ready)
	},
	event: (function(){
		var guid = 0;
		function fixEvent(e) {
			e = e || window.event;
			if (e.isFixed) {
				return e;
			}
			e.isFixed = true; 
			e.preventDefault = e.preventDefault || function(){this.returnValue = false}
			e.stopPropagation = e.stopPropagaton || function(){this.cancelBubble = true}
			if (!e.target) {
				e.target = e.srcElement
			}
			if (!e.relatedTarget && e.fromElement) {
				e.relatedTarget = e.fromElement == e.target ? e.toElement : e.fromElement;
			}
			if (e.pageX == null && e.clientX != null) {
				var html = document.documentElement, body = document.body;
				e.pageX = e.clientX + (html && html.scrollLeft || body && body.scrollLeft || 0) - (html.clientLeft || 0);
				e.pageY = e.clientY + (html && html.scrollTop || body && body.scrollTop || 0) - (html.clientTop || 0);
			}
			if (!e.which && e.button) {
				e.which = e.button & 1 ? 1 : (e.button & 2 ? 3 : (e.button & 4 ? 2 : 0));
			}
			if(e.type === "DOMMouseScroll" || e.type === 'mousewheel') {
				e.mWheelDelta = 0;
				if (e.wheelDelta) {
					e.mWheelDelta = e.wheelDelta/120;
				} else if (e.detail) {
					e.mWheelDelta = -e.detail/3;
				}
			}
			return e;
		}
		function commonHandle(event, customScope) {
			event = fixEvent(event);
			var handlers = this.events[event.type];
			for (var g in handlers) {
				var handler = handlers[g];
				var ret = handler.call(customScope || this, event);
				if (ret === false) {
					event.preventDefault()
					event.stopPropagation()
				}
			}
		}
		var publicAPI = {
			add: function(elem, type, handler, forcedScope) {
				if (elem.setInterval && (elem != window && !elem.frameElement)) {
					elem = window;
				}
				if (!handler.guid) {
					handler.guid = ++guid;
				}
				if (!elem.events) {
					elem.events = {};
					elem.handle = function(event) {
						return commonHandle.call(elem, event);
					}
				}
				if (!elem.events[type]) {
					elem.events[type] = {};
					if (elem.addEventListener) elem.addEventListener(type, elem.handle, false);
					else if (elem.attachEvent) elem.attachEvent("on" + type, elem.handle);
					if(type === 'mousewheel') {
						publicAPI.add(elem, 'DOMMouseScroll', handler, forcedScope);
					}
				}
				var fakeHandler = jcf.lib.bind(handler, forcedScope);
				fakeHandler.guid = handler.guid;
				elem.events[type][handler.guid] = forcedScope ? fakeHandler : handler;
			},
			remove: function(elem, type, handler) {
				var handlers = elem.events && elem.events[type];
				if (!handlers) return;
				delete handlers[handler.guid];
				for(var any in handlers) return;
				if (elem.removeEventListener) elem.removeEventListener(type, elem.handle, false);
				else if (elem.detachEvent) elem.detachEvent("on" + type, elem.handle);
				delete elem.events[type];
				for (var any in elem.events) return;
				try {
					delete elem.handle;
					delete elem.events;
				} catch(e) {
					if(elem.removeAttribute) {
						elem.removeAttribute("handle");
						elem.removeAttribute("events");
					}
				}
				if(type === 'mousewheel') {
					publicAPI.remove(elem, 'DOMMouseScroll', handler);
				}
			}
		}
		return publicAPI;
	}())
}



// custom select module
jcf.addModule({
	name:'select',
	selector:'select',
	defaultOptions: {
		handleDropPosition: true,
		wrapperClass:'select-area',
		focusClass:'select-focus',
		dropActiveClass:'select-active',
		selectedClass:'item-selected',
		disabledClass:'select-disabled',
		valueSelector:'span.center',
		optGroupClass:'optgroup',
		openerSelector:'a.select-opener',
		selectStructure:'<span class="left"></span><span class="center"></span><a class="select-opener"></a>',
		selectPrefixClass:'select-',
		dropMaxHeight: 200,
		dropFlippedClass: 'select-options-flipped',
		dropHiddenClass:'options-hidden',
		dropScrollableClass:'options-overflow',
		dropClass:'select-options',
		dropClassPrefix:'drop-',
		dropStructure:'<div class="drop-holder"><div class="drop-list"></div></div>',
		dropSelector:'div.drop-list'
	},
	checkElement: function(el){
		return (!el.size && !el.multiple);
	},
	setupWrapper: function(){
		jcf.lib.addClass(this.fakeElement, this.options.wrapperClass);
		this.realElement.parentNode.insertBefore(this.fakeElement, this.realElement);
		this.fakeElement.innerHTML = this.options.selectStructure;
		this.fakeElement.style.width = this.realElement.offsetWidth + 'px';
		jcf.lib.addClass(this.fakeElement, jcf.lib.getAllClasses(this.realElement.className, this.options.selectPrefixClass, jcf.baseOptions.hiddenClass));

		// create select body
		this.opener = jcf.lib.queryBySelector(this.options.openerSelector, this.fakeElement)[0];
		this.valueText = jcf.lib.queryBySelector(this.options.valueSelector, this.fakeElement)[0];
		this.opener.jcf = this;

		this.createDropdown();
		this.refreshState();
		this.addEvents();
		this.onControlReady(this);
		this.hideDropdown(true);
	},
	addEvents: function(){
		jcf.lib.event.add(this.fakeElement, 'click', this.toggleDropdown, this);
		jcf.lib.event.add(this.realElement, 'change', this.onChange, this);
	},
	onFakeClick: function() {
		// do nothing (drop toggles by toggleDropdown method)
	},
	onFocus: function(){
		// Mac Safari Fix
		if(jcf.lib.browser.safariMac) {
			this.realElement.setAttribute('size','2');
		}
		jcf.modules[this.name].superclass.onFocus.apply(this, arguments);
		jcf.lib.event.add(this.realElement, 'keydown', this.onKeyDown, this);
		if(jcf.activeControl && jcf.activeControl != this) {
			jcf.activeControl.hideDropdown();
			jcf.activeControl = this;
		}
	},
	onBlur: function(){
		// Mac Safari Fix
		if(jcf.lib.browser.safariMac) {
			this.realElement.removeAttribute('size');
		}
		if(!this.isActiveDrop() || !this.isOverDrop()) {
			jcf.modules[this.name].superclass.onBlur.apply(this);
			if(jcf.activeControl === this) jcf.activeControl = null;
			if(!jcf.isTouchDevice) {
				this.hideDropdown();
			}
		}
		jcf.lib.event.remove(this.realElement, 'keydown', this.onKeyDown);
	},
	onChange: function() {
		this.refreshState();
	},
	onKeyDown: function(e){
		jcf.tmpFlag = true;
		setTimeout(function(){jcf.tmpFlag = false},100);
		var context = this;
		context.keyboardFix = true;
		setTimeout(function(){
			context.refreshState();
		},10);
		if(e.keyCode == 13) {
			context.toggleDropdown.apply(context);
			return false;
		}
	},
	onResizeWindow: function(e){
		if(this.isActiveDrop()) {
			this.hideDropdown();
		}
	},
	onScrollWindow: function(e){
		if(this.isActiveDrop()) {
			this.positionDropdown();
		}
	},
	onOptionClick: function(e){
		var opener = e.target && e.target.tagName && e.target.tagName.toLowerCase() == 'li' ? e.target : jcf.lib.getParent(e.target, 'li');
		if(opener) {
			this.realElement.selectedIndex = parseInt(opener.getAttribute('rel'));
			if(jcf.isTouchDevice) {
				this.onFocus();
			} else {
				this.realElement.focus();
			}
			this.refreshState();
			this.hideDropdown();
			jcf.lib.fireEvent(this.realElement, 'change');
		}
		return false;
	},
	onClickOutside: function(e){
		if(jcf.tmpFlag) {
			jcf.tmpFlag = false;
			return;
		}
		if(!jcf.lib.isParent(this.fakeElement, e.target) && !jcf.lib.isParent(this.selectDrop, e.target)) {
			this.hideDropdown();
		}
	},
	onDropHover: function(e){
		if(!this.keyboardFix) {
			this.hoverFlag = true;
			var opener = e.target && e.target.tagName && e.target.tagName.toLowerCase() == 'li' ? e.target : jcf.lib.getParent(e.target, 'li');
			if(opener) {
				this.realElement.selectedIndex = parseInt(opener.getAttribute('rel'));
				this.refreshSelectedClass(parseInt(opener.getAttribute('rel')));
			}
		} else {
			this.keyboardFix = false;
		}
	},
	onDropLeave: function(){
		this.hoverFlag = false;
	},
	isActiveDrop: function(){
		return !jcf.lib.hasClass(this.selectDrop, this.options.dropHiddenClass);
	},
	isOverDrop: function(){
		return this.hoverFlag;
	},
	createDropdown: function(){
		// remove old dropdown if exists
		if(this.selectDrop) {
			this.selectDrop.parentNode.removeChild(this.selectDrop);
		}

		// create dropdown holder
		this.selectDrop = document.createElement('div');
		this.selectDrop.className = this.options.dropClass;
		this.selectDrop.innerHTML = this.options.dropStructure;
		jcf.lib.setStyles(this.selectDrop, {position:'absolute'});
		this.selectList = jcf.lib.queryBySelector(this.options.dropSelector,this.selectDrop)[0];
		jcf.lib.addClass(this.selectDrop, this.options.dropHiddenClass);
		document.body.appendChild(this.selectDrop);
		this.selectDrop.jcf = this;
		jcf.lib.event.add(this.selectDrop, 'click', this.onOptionClick, this);
		jcf.lib.event.add(this.selectDrop, 'mouseover', this.onDropHover, this);
		jcf.lib.event.add(this.selectDrop, 'mouseout', this.onDropLeave, this);
		this.buildDropdown();
	},
	buildDropdown: function() {
		// build select options / optgroups
		this.buildDropdownOptions();

		// position and resize dropdown
		this.positionDropdown();

		// cut dropdown if height exceedes
		this.buildDropdownScroll();
	},
	buildDropdownOptions: function() {
		this.resStructure = '';
		this.optNum = 0;
		for(var i = 0; i < this.realElement.children.length; i++) {
			this.resStructure += this.buildElement(this.realElement.children[i]) +'\n';
		}
		this.selectList.innerHTML = this.resStructure;
	},
	buildDropdownScroll: function() {
		if(this.options.dropMaxHeight) {
			if(this.selectDrop.offsetHeight > this.options.dropMaxHeight) {
				this.selectList.style.height = this.options.dropMaxHeight+'px';
				this.selectList.style.overflow = 'auto';
				this.selectList.style.overflowX = 'hidden';
				jcf.lib.addClass(this.selectDrop, this.options.dropScrollableClass);
			}
		}
		jcf.lib.addClass(this.selectDrop, jcf.lib.getAllClasses(this.realElement.className, this.options.dropClassPrefix, jcf.baseOptions.hiddenClass));
	},
	buildElement: function(obj){
		// build option
		var res = '';
		if(obj.tagName.toLowerCase() == 'option') {
			if(!jcf.lib.prevSibling(obj) || jcf.lib.prevSibling(obj).tagName.toLowerCase() != 'option') {
				res += '<ul>';
			}
			res += '<li rel="'+(this.optNum++)+'" class="'+(obj.className? obj.className : '')+' jcfcalc"><a href="#">'+(obj.title? '<images src="'+obj.title+'" alt="" />' : '')+'<span>' + obj.innerHTML + '</span></a></li>';
			if(!jcf.lib.nextSibling(obj) || jcf.lib.nextSibling(obj).tagName.toLowerCase() != 'option') {
				res += '</ul>';
			}
			return res;
		}
		// build option group with options
		else if(obj.tagName.toLowerCase() == 'optgroup' && obj.label) {
			res += '<div class="'+this.options.optGroupClass+'">';
			res += '<strong class="jcfcalc"><em>'+(obj.label)+'</em></strong>';
			for(var i = 0; i < obj.children.length; i++) {
				res += this.buildElement(obj.children[i]);
			}
			res += '</div>';
			return res;
		}
	},
	positionDropdown: function(){
		var ofs = jcf.lib.getOffset(this.fakeElement), selectAreaHeight = this.fakeElement.offsetHeight, selectDropHeight = this.selectDrop.offsetHeight;
		if(this.options.handleDropPosition && jcf.lib.getScrollTop() + jcf.lib.getWindowHeight() < ofs.top + selectAreaHeight + selectDropHeight) {
			this.selectDrop.style.top = (ofs.top - selectDropHeight)+'px';
			jcf.lib.addClass(this.selectDrop, this.options.dropFlippedClass);
		} else {
			this.selectDrop.style.top = (ofs.top + selectAreaHeight)+'px';
			jcf.lib.removeClass(this.selectDrop, this.options.dropFlippedClass);
		}
		this.selectDrop.style.left = ofs.left+'px';
		this.selectDrop.style.width = this.fakeElement.offsetWidth+'px';
	},
	showDropdown: function(){
		document.body.appendChild(this.selectDrop);
		jcf.lib.removeClass(this.selectDrop, this.options.dropHiddenClass);
		jcf.lib.addClass(this.fakeElement,this.options.dropActiveClass);
		this.positionDropdown();

		// show current dropdown
		jcf.lib.event.add(window, 'resize', this.onResizeWindow, this);
		jcf.lib.event.add(window, 'scroll', this.onScrollWindow, this);
		jcf.lib.event.add(document, jcf.eventPress, this.onClickOutside, this);
		this.positionDropdown();
	},
	hideDropdown: function(partial){
		if(this.selectDrop.parentNode) {
			if(this.selectDrop.offsetWidth) {
				this.selectDrop.parentNode.removeChild(this.selectDrop);
			}
			if(partial) {
				return;
			}
		}
		if(typeof this.origSelectedIndex === 'number') {
			this.realElement.selectedIndex = this.origSelectedIndex;
		}
		jcf.lib.removeClass(this.fakeElement,this.options.dropActiveClass);
		jcf.lib.addClass(this.selectDrop, this.options.dropHiddenClass);
		jcf.lib.event.remove(window, 'resize', this.onResizeWindow);
		jcf.lib.event.remove(window, 'scroll', this.onScrollWindow);
		jcf.lib.event.remove(document.documentElement, jcf.eventPress, this.onClickOutside);
		if(jcf.isTouchDevice) {
			this.onBlur();
		}
	},
	toggleDropdown: function(){
		if(jcf.isTouchDevice) {
			this.onFocus();
		} else {
			this.realElement.focus();
		}
		this.dropOpened = true;
		if(!this.realElement.disabled) {
			if(this.isActiveDrop()) {
				this.hideDropdown();
			} else {
				this.showDropdown();
			}
		}
		this.refreshState();
	},
	scrollToItem: function(){
		if(this.isActiveDrop()) {
			var dropHeight = this.selectList.offsetHeight;
			var offsetTop = this.calcOptionOffset(this.getFakeActiveOption());
			var sTop = this.selectList.scrollTop;
			var oHeight = this.getFakeActiveOption().offsetHeight;
			//offsetTop+=sTop;

			if(offsetTop >= sTop + dropHeight) {
				this.selectList.scrollTop = offsetTop - dropHeight + oHeight;
			} else if(offsetTop < sTop) {
				this.selectList.scrollTop = offsetTop;
			}
		}
	},
	getFakeActiveOption: function(c) {
		return jcf.lib.queryBySelector('li[rel="'+(typeof c === 'number' ? c : this.realElement.selectedIndex) +'"]',this.selectList)[0];
	},
	calcOptionOffset: function(fake) {
		var h = 0;
		var els = jcf.lib.queryBySelector('.jcfcalc',this.selectList);
		for(var i = 0; i < els.length; i++) {
			if(els[i] == fake) break;
			h+=els[i].offsetHeight;
		}
		return h;
	},
	childrenHasItem: function(hold,item) {
		var items = hold.getElementsByTagName('*');
		for(i = 0; i < items.length; i++) {
			if(items[i] == item) return true;
		}
		return false;
	},
	removeSelectedClass: function(){
		var children = jcf.lib.queryBySelector('li',this.selectList);
		for(var i = children.length - 1; i >= 0; i--) {
			jcf.lib.removeClass(children[i], this.options.selectedClass);
		}
	},
	setSelectedClass: function(c){
		jcf.lib.addClass(this.getFakeActiveOption(c), this.options.selectedClass);
	},
	refreshSelectedClass: function(c){
		this.removeSelectedClass(c);
		this.setSelectedClass(c);
		if(this.realElement.disabled) {
			jcf.lib.addClass(this.fakeElement, this.options.disabledClass);
		} else {
			jcf.lib.removeClass(this.fakeElement, this.options.disabledClass);
		}
	},
	refreshSelectedText: function() {
		if(!this.dropOpened && this.realElement.title) {
			this.valueText.innerHTML = this.realElement.title;
		} else {
			if(this.realElement.options[this.realElement.selectedIndex].title) {
				this.valueText.innerHTML = '<images src="'+this.realElement.options[this.realElement.selectedIndex].title+'" alt="" />' + this.realElement.options[this.realElement.selectedIndex].innerHTML;
			} else {
				this.valueText.innerHTML = this.realElement.options[this.realElement.selectedIndex].innerHTML;
			}
		}
	},
	refreshState: function(){
		this.origSelectedIndex = this.realElement.selectedIndex;
		this.refreshSelectedClass();
		this.refreshSelectedText();
		this.positionDropdown();
		if(this.selectDrop.offsetWidth) {
			this.scrollToItem();
		}
	}
});


/**
 * jQuery Roundabout - v2.4.2
 * http://fredhq.com/projects/roundabout
 *
 * Moves list-items of enabled ordered and unordered lists long
 * a chosen path. Includes the default "lazySusan" path, that
 * moves items long a spinning turntable.
 *
 * Terms of Use // jQuery Roundabout
 *
 * Open source under the BSD license
 *
 * Copyright (c) 2011-2012, Fred LeBlanc
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above
 *     copyright notice, this list of conditions and the following
 *     disclaimer in the documentation and/or other materials provided
 *     with the distribution.
 *   - Neither the name of the author nor the names of its contributors
 *     may be used to endorse or promote products derived from this
 *     software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
(function(a){"use strict";var b,c,d;a.extend({roundaboutShapes:{def:"lazySusan",lazySusan:function(a,b,c){return{x:Math.sin(a+b),y:Math.sin(a+3*Math.PI/2+b)/8*c,z:(Math.cos(a+b)+1)/2,scale:Math.sin(a+Math.PI/2+b)/2+.5}}}});b={bearing:0,tilt:0,minZ:100,maxZ:280,minOpacity:.4,maxOpacity:1,minScale:.4,maxScale:1,duration:600,btnNext:null,btnNextCallback:function(){},btnPrev:null,btnPrevCallback:function(){},btnToggleAutoplay:null,btnStartAutoplay:null,btnStopAutoplay:null,easing:"swing",clickToFocus:true,clickToFocusCallback:function(){},focusBearing:0,shape:"lazySusan",debug:false,childSelector:"li",startingChild:null,reflect:false,floatComparisonThreshold:.001,autoplay:false,autoplayDuration:1e3,autoplayPauseOnHover:false,autoplayCallback:function(){},autoplayInitialDelay:0,enableDrag:false,dropDuration:600,dropEasing:"swing",dropAnimateTo:"nearest",dropCallback:function(){},dragAxis:"x",dragFactor:4,triggerFocusEvents:true,triggerBlurEvents:true,responsive:false};c={autoplayInterval:null,autoplayIsRunning:false,autoplayStartTimeout:null,animating:false,childInFocus:-1,touchMoveStartPosition:null,stopAnimation:false,lastAnimationStep:false};d={init:function(e,f,g){var h,i=(new Date).getTime();e=typeof e==="object"?e:{};f=a.isFunction(f)?f:function(){};f=a.isFunction(e)?e:f;h=a.extend({},b,e,c);return this.each(function(){var b=a(this),c=b.children(h.childSelector).length,e=360/c,i=h.startingChild&&h.startingChild>c-1?c-1:h.startingChild,j=h.startingChild===null?h.bearing:360-i*e,k=b.css("position")!=="static"?b.css("position"):"relative";b.css({padding:0,position:k}).addClass("roundabout-holder").data("roundabout",a.extend({},h,{startingChild:i,bearing:j,oppositeOfFocusBearing:d.normalize.apply(null,[h.focusBearing-180]),dragBearing:j,period:e}));if(g){b.unbind(".roundabout").children(h.childSelector).unbind(".roundabout")}else{if(h.responsive){a(window).bind("resize",function(){d.stopAutoplay.apply(b);d.relayoutChildren.apply(b)})}}if(h.clickToFocus){b.children(h.childSelector).each(function(c){a(this).bind("click.roundabout",function(){var e=d.getPlacement.apply(b,[c]);if(!d.isInFocus.apply(b,[e])){d.stopAnimation.apply(a(this));if(!b.data("roundabout").animating){d.animateBearingToFocus.apply(b,[e,b.data("roundabout").clickToFocusCallback])}return false}})})}if(h.btnNext){a(h.btnNext).bind("click.roundabout",function(){if(!b.data("roundabout").animating){d.animateToNextChild.apply(b,[b.data("roundabout").btnNextCallback])}return false})}if(h.btnPrev){a(h.btnPrev).bind("click.roundabout",function(){d.animateToPreviousChild.apply(b,[b.data("roundabout").btnPrevCallback]);return false})}if(h.btnToggleAutoplay){a(h.btnToggleAutoplay).bind("click.roundabout",function(){d.toggleAutoplay.apply(b);return false})}if(h.btnStartAutoplay){a(h.btnStartAutoplay).bind("click.roundabout",function(){d.startAutoplay.apply(b);return false})}if(h.btnStopAutoplay){a(h.btnStopAutoplay).bind("click.roundabout",function(){d.stopAutoplay.apply(b);return false})}if(h.autoplayPauseOnHover){b.bind("mouseenter.roundabout.autoplay",function(){d.stopAutoplay.apply(b,[true])}).bind("mouseleave.roundabout.autoplay",function(){d.startAutoplay.apply(b)})}if(h.enableDrag){if(!a.isFunction(b.drag)){if(h.debug){alert("You do not have the drag plugin loaded.")}}else if(!a.isFunction(b.drop)){if(h.debug){alert("You do not have the drop plugin loaded.")}}else{b.drag(function(a,c){var e=b.data("roundabout"),f=e.dragAxis.toLowerCase()==="x"?"deltaX":"deltaY";d.stopAnimation.apply(b);d.setBearing.apply(b,[e.dragBearing+c[f]/e.dragFactor])}).drop(function(a){var c=b.data("roundabout"),e=d.getAnimateToMethod(c.dropAnimateTo);d.allowAnimation.apply(b);d[e].apply(b,[c.dropDuration,c.dropEasing,c.dropCallback]);c.dragBearing=c.period*d.getNearestChild.apply(b)})}b.each(function(){var b=a(this).get(0),c=a(this).data("roundabout"),e=c.dragAxis.toLowerCase()==="x"?"pageX":"pageY",f=d.getAnimateToMethod(c.dropAnimateTo);if(b.addEventListener){b.addEventListener("touchstart",function(a){c.touchMoveStartPosition=a.touches[0][e]},false);b.addEventListener("touchmove",function(b){var f=(b.touches[0][e]-c.touchMoveStartPosition)/c.dragFactor;b.preventDefault();d.stopAnimation.apply(a(this));d.setBearing.apply(a(this),[c.dragBearing+f])},false);b.addEventListener("touchend",function(b){b.preventDefault();d.allowAnimation.apply(a(this));f=d.getAnimateToMethod(c.dropAnimateTo);d[f].apply(a(this),[c.dropDuration,c.dropEasing,c.dropCallback]);c.dragBearing=c.period*d.getNearestChild.apply(a(this))},false)}})}d.initChildren.apply(b,[f,g])})},initChildren:function(b,c){var e=a(this),f=e.data("roundabout");b=b||function(){};e.children(f.childSelector).each(function(b){var f,g,h,i=d.getPlacement.apply(e,[b]);if(c&&a(this).data("roundabout")){f=a(this).data("roundabout").startWidth;g=a(this).data("roundabout").startHeight;h=a(this).data("roundabout").startFontSize}a(this).addClass("roundabout-moveable-item").css("position","absolute");a(this).data("roundabout",{startWidth:f||a(this).width(),startHeight:g||a(this).height(),startFontSize:h||parseInt(a(this).css("font-size"),10),degrees:i,backDegrees:d.normalize.apply(null,[i-180]),childNumber:b,currentScale:1,parent:e})});d.updateChildren.apply(e);if(f.autoplay){f.autoplayStartTimeout=setTimeout(function(){d.startAutoplay.apply(e)},f.autoplayInitialDelay)}e.trigger("ready");b.apply(e);return e},updateChildren:function(){return this.each(function(){var b=a(this),c=b.data("roundabout"),e=-1,f={bearing:c.bearing,tilt:c.tilt,stage:{width:Math.floor(a(this).width()*.9),height:Math.floor(a(this).height()*.9)},animating:c.animating,inFocus:c.childInFocus,focusBearingRadian:d.degToRad.apply(null,[c.focusBearing]),shape:a.roundaboutShapes[c.shape]||a.roundaboutShapes[a.roundaboutShapes.def]};f.midStage={width:f.stage.width/2,height:f.stage.height/2};f.nudge={width:f.midStage.width+f.stage.width*.05,height:f.midStage.height+f.stage.height*.05};f.zValues={min:c.minZ,max:c.maxZ,diff:c.maxZ-c.minZ};f.opacity={min:c.minOpacity,max:c.maxOpacity,diff:c.maxOpacity-c.minOpacity};f.scale={min:c.minScale,max:c.maxScale,diff:c.maxScale-c.minScale};b.children(c.childSelector).each(function(g){if(d.updateChild.apply(b,[a(this),f,g,function(){a(this).trigger("ready")}])&&(!f.animating||c.lastAnimationStep)){e=g;a(this).addClass("roundabout-in-focus")}else{a(this).removeClass("roundabout-in-focus")}});if(e!==f.inFocus){if(c.triggerBlurEvents){b.children(c.childSelector).eq(f.inFocus).trigger("blur")}c.childInFocus=e;if(c.triggerFocusEvents&&e!==-1){b.children(c.childSelector).eq(e).trigger("focus")}}b.trigger("childrenUpdated")})},updateChild:function(b,c,e,f){var g,h=this,i=a(b),j=i.data("roundabout"),k=[],l=d.degToRad.apply(null,[360-j.degrees+c.bearing]);f=f||function(){};l=d.normalizeRad.apply(null,[l]);g=c.shape(l,c.focusBearingRadian,c.tilt);g.scale=g.scale>1?1:g.scale;g.adjustedScale=(c.scale.min+c.scale.diff*g.scale).toFixed(4);g.width=(g.adjustedScale*j.startWidth).toFixed(4);g.height=(g.adjustedScale*j.startHeight).toFixed(4);i.css({left:(g.x*c.midStage.width+c.nudge.width-g.width/2).toFixed(0)+"px",top:(g.y*c.midStage.height+c.nudge.height-g.height/2).toFixed(0)+"px",width:g.width+"px",height:g.height+"px",opacity:(c.opacity.min+c.opacity.diff*g.scale).toFixed(2),zIndex:Math.round(c.zValues.min+c.zValues.diff*g.z),fontSize:(g.adjustedScale*j.startFontSize).toFixed(1)+"px"});j.currentScale=g.adjustedScale;if(h.data("roundabout").debug){k.push('<div style="font-weight: normal; font-size: 10px; padding: 2px; width: '+i.css("width")+'; background-color: #ffc;">');k.push('<strong style="font-size: 12px; white-space: nowrap;">Child '+e+"</strong><br />");k.push("<strong>left:</strong> "+i.css("left")+"<br />");k.push("<strong>top:</strong> "+i.css("top")+"<br />");k.push("<strong>width:</strong> "+i.css("width")+"<br />");k.push("<strong>opacity:</strong> "+i.css("opacity")+"<br />");k.push("<strong>height:</strong> "+i.css("height")+"<br />");k.push("<strong>z-index:</strong> "+i.css("z-index")+"<br />");k.push("<strong>font-size:</strong> "+i.css("font-size")+"<br />");k.push("<strong>scale:</strong> "+i.data("roundabout").currentScale);k.push("</div>");i.html(k.join(""))}i.trigger("reposition");f.apply(h);return d.isInFocus.apply(h,[j.degrees])},setBearing:function(b,c){c=c||function(){};b=d.normalize.apply(null,[b]);this.each(function(){var c,e,f,g=a(this),h=g.data("roundabout"),i=h.bearing;h.bearing=b;g.trigger("bearingSet");d.updateChildren.apply(g);c=Math.abs(i-b);if(!h.animating||c>180){return}c=Math.abs(i-b);g.children(h.childSelector).each(function(c){var e;if(d.isChildBackDegreesBetween.apply(a(this),[b,i])){e=i>b?"Clockwise":"Counterclockwise";a(this).trigger("move"+e+"ThroughBack")}})});c.apply(this);return this},adjustBearing:function(b,c){c=c||function(){};if(b===0){return this}this.each(function(){d.setBearing.apply(a(this),[a(this).data("roundabout").bearing+b])});c.apply(this);return this},setTilt:function(b,c){c=c||function(){};this.each(function(){a(this).data("roundabout").tilt=b;d.updateChildren.apply(a(this))});c.apply(this);return this},adjustTilt:function(b,c){c=c||function(){};this.each(function(){d.setTilt.apply(a(this),[a(this).data("roundabout").tilt+b])});c.apply(this);return this},animateToBearing:function(b,c,e,f,g){var h=(new Date).getTime();g=g||function(){};if(a.isFunction(f)){g=f;f=null}else if(a.isFunction(e)){g=e;e=null}else if(a.isFunction(c)){g=c;c=null}this.each(function(){var i,j,k,l=a(this),m=l.data("roundabout"),n=!c?m.duration:c,o=e?e:m.easing||"swing";if(!f){f={timerStart:h,start:m.bearing,totalTime:n}}i=h-f.timerStart;if(m.stopAnimation){d.allowAnimation.apply(l);m.animating=false;return}if(i<n){if(!m.animating){l.trigger("animationStart")}m.animating=true;if(typeof a.easing.def==="string"){j=a.easing[o]||a.easing[a.easing.def];k=j(null,i,f.start,b-f.start,f.totalTime)}else{k=a.easing[o](i/f.totalTime,i,f.start,b-f.start,f.totalTime)}if(d.compareVersions.apply(null,[a().jquery,"1.7.2"])>=0&&!a.easing["easeOutBack"]){k=f.start+(b-f.start)*k}k=d.normalize.apply(null,[k]);m.dragBearing=k;d.setBearing.apply(l,[k,function(){setTimeout(function(){d.animateToBearing.apply(l,[b,n,o,f,g])},0)}])}else{m.lastAnimationStep=true;b=d.normalize.apply(null,[b]);d.setBearing.apply(l,[b,function(){l.trigger("animationEnd")}]);m.animating=false;m.lastAnimationStep=false;m.dragBearing=b;g.apply(l)}});return this},animateToNearbyChild:function(b,c){var e=b[0],f=b[1],g=b[2]||function(){};if(a.isFunction(f)){g=f;f=null}else if(a.isFunction(e)){g=e;e=null}return this.each(function(){var b,h,i=a(this),j=i.data("roundabout"),k=!j.reflect?j.bearing%360:j.bearing,l=i.children(j.childSelector).length;if(!j.animating){if(j.reflect&&c==="previous"||!j.reflect&&c==="next"){k=Math.abs(k)<j.floatComparisonThreshold?360:k;for(b=0;b<l;b+=1){h={lower:j.period*b,upper:j.period*(b+1)};h.upper=b===l-1?360:h.upper;if(k<=Math.ceil(h.upper)&&k>=Math.floor(h.lower)){if(l===2&&k===360){d.animateToDelta.apply(i,[-180,e,f,g])}else{d.animateBearingToFocus.apply(i,[h.lower,e,f,g])}break}}}else{k=Math.abs(k)<j.floatComparisonThreshold||360-Math.abs(k)<j.floatComparisonThreshold?0:k;for(b=l-1;b>=0;b-=1){h={lower:j.period*b,upper:j.period*(b+1)};h.upper=b===l-1?360:h.upper;if(k>=Math.floor(h.lower)&&k<Math.ceil(h.upper)){if(l===2&&k===360){d.animateToDelta.apply(i,[180,e,f,g])}else{d.animateBearingToFocus.apply(i,[h.upper,e,f,g])}break}}}}})},animateToNearestChild:function(b,c,e){e=e||function(){};if(a.isFunction(c)){e=c;c=null}else if(a.isFunction(b)){e=b;b=null}return this.each(function(){var f=d.getNearestChild.apply(a(this));d.animateToChild.apply(a(this),[f,b,c,e])})},animateToChild:function(b,c,e,f){f=f||function(){};if(a.isFunction(e)){f=e;e=null}else if(a.isFunction(c)){f=c;c=null}return this.each(function(){var g,h=a(this),i=h.data("roundabout");if(i.childInFocus!==b&&!i.animating){g=h.children(i.childSelector).eq(b);d.animateBearingToFocus.apply(h,[g.data("roundabout").degrees,c,e,f])}})},animateToNextChild:function(a,b,c){return d.animateToNearbyChild.apply(this,[arguments,"next"])},animateToPreviousChild:function(a,b,c){return d.animateToNearbyChild.apply(this,[arguments,"previous"])},animateToDelta:function(b,c,e,f){f=f||function(){};if(a.isFunction(e)){f=e;e=null}else if(a.isFunction(c)){f=c;c=null}return this.each(function(){var g=a(this).data("roundabout").bearing+b;d.animateToBearing.apply(a(this),[g,c,e,f])})},animateBearingToFocus:function(b,c,e,f){f=f||function(){};if(a.isFunction(e)){f=e;e=null}else if(a.isFunction(c)){f=c;c=null}return this.each(function(){var g=a(this).data("roundabout").bearing-b;g=Math.abs(360-g)<Math.abs(g)?360-g:-g;g=g>180?-(360-g):g;if(g!==0){d.animateToDelta.apply(a(this),[g,c,e,f])}})},stopAnimation:function(){return this.each(function(){a(this).data("roundabout").stopAnimation=true})},allowAnimation:function(){return this.each(function(){a(this).data("roundabout").stopAnimation=false})},startAutoplay:function(b){return this.each(function(){var c=a(this),e=c.data("roundabout");b=b||e.autoplayCallback||function(){};clearInterval(e.autoplayInterval);e.autoplayInterval=setInterval(function(){d.animateToNextChild.apply(c,[b])},e.autoplayDuration);e.autoplayIsRunning=true;c.trigger("autoplayStart")})},stopAutoplay:function(b){return this.each(function(){clearInterval(a(this).data("roundabout").autoplayInterval);a(this).data("roundabout").autoplayInterval=null;a(this).data("roundabout").autoplayIsRunning=false;if(!b){a(this).unbind(".autoplay")}a(this).trigger("autoplayStop")})},toggleAutoplay:function(b){return this.each(function(){var c=a(this),e=c.data("roundabout");b=b||e.autoplayCallback||function(){};if(!d.isAutoplaying.apply(a(this))){d.startAutoplay.apply(a(this),[b])}else{d.stopAutoplay.apply(a(this),[b])}})},isAutoplaying:function(){return this.data("roundabout").autoplayIsRunning},changeAutoplayDuration:function(b){return this.each(function(){var c=a(this),e=c.data("roundabout");e.autoplayDuration=b;if(d.isAutoplaying.apply(c)){d.stopAutoplay.apply(c);setTimeout(function(){d.startAutoplay.apply(c)},10)}})},normalize:function(a){var b=a%360;return b<0?360+b:b},normalizeRad:function(a){while(a<0){a+=Math.PI*2}while(a>Math.PI*2){a-=Math.PI*2}return a},isChildBackDegreesBetween:function(b,c){var d=a(this).data("roundabout").backDegrees;if(b>c){return d>=c&&d<b}else{return d<c&&d>=b}},getAnimateToMethod:function(a){a=a.toLowerCase();if(a==="next"){return"animateToNextChild"}else if(a==="previous"){return"animateToPreviousChild"}return"animateToNearestChild"},relayoutChildren:function(){return this.each(function(){var b=a(this),c=a.extend({},b.data("roundabout"));c.startingChild=b.data("roundabout").childInFocus;d.init.apply(b,[c,null,true])})},getNearestChild:function(){var b=a(this),c=b.data("roundabout"),d=b.children(c.childSelector).length;if(!c.reflect){return(d-Math.round(c.bearing/c.period)%d)%d}else{return Math.round(c.bearing/c.period)%d}},degToRad:function(a){return d.normalize.apply(null,[a])*Math.PI/180},getPlacement:function(a){var b=this.data("roundabout");return!b.reflect?360-b.period*a:b.period*a},isInFocus:function(a){var b,c=this,e=c.data("roundabout"),f=d.normalize.apply(null,[e.bearing]);a=d.normalize.apply(null,[a]);b=Math.abs(f-a);return b<=e.floatComparisonThreshold||b>=360-e.floatComparisonThreshold},getChildInFocus:function(){var b=a(this).data("roundabout");return b.childInFocus>-1?b.childInFocus:false},compareVersions:function(a,b){var c,d=a.split(/\./i),e=b.split(/\./i),f=d.length>e.length?d.length:e.length;for(c=0;c<=f;c++){if(d[c]&&!e[c]&&parseInt(d[c],10)!==0){return 1}else if(e[c]&&!d[c]&&parseInt(e[c],10)!==0){return-1}else if(d[c]===e[c]){continue}if(d[c]&&e[c]){if(parseInt(d[c],10)>parseInt(e[c],10)){return 1}else{return-1}}}return 0}};a.fn.roundabout=function(b){if(d[b]){return d[b].apply(this,Array.prototype.slice.call(arguments,1))}else if(typeof b==="object"||a.isFunction(b)||!b){return d.init.apply(this,arguments)}else{a.error("Method "+b+" does not exist for jQuery.roundabout.")}}})(jQuery)




 /*
 * FancyBox - jQuery Plugin
 * Simple and fancy lightbox alternative
 *
 * Examples and documentation at: http://fancybox.net
 * 
 * Copyright (c) 2008 - 2010 Janis Skarnelis
 * That said, it is hardly a one-person project. Many people have submitted bugs, code, and offered their advice freely. Their support is greatly appreciated.
 *
 * Version: 1.3.4 (11/11/2010)
 * Requires: jQuery v1.3+
 *
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 */
;
/*
(function(B){var L,T,Q,M,d,m,J,A,O,z,C=0,H={},j=[],e=0,G={},y=[],f=null,o=new Image(),i=/\.(jpg|gif|png|bmp|jpeg)(.*)?$/i,k=/[^\.]\.(swf)\s*$/i,p,N=1,h=0,t="",b,c,P=false,s=B.extend(B("<div/>")[0],{prop:0}),S=B.browser.msie&&B.browser.version<7&&!window.XMLHttpRequest,r=function(){T.hide();o.onerror=o.onload=null;if(f){f.abort()}L.empty()},x=function(){if(false===H.onError(j,C,H)){T.hide();P=false;return}H.titleShow=false;H.width="auto";H.height="auto";L.html('<p id="fancybox-error">The requested content cannot be loaded.<br />Please try again later.</p>');n()},w=function(){var Z=j[C],W,Y,ab,aa,V,X;r();H=B.extend({},B.fn.fancybox.defaults,(typeof B(Z).data("fancybox")=="undefined"?H:B(Z).data("fancybox")));X=H.onStart(j,C,H);if(X===false){P=false;return}else{if(typeof X=="object"){H=B.extend(H,X)}}ab=H.title||(Z.nodeName?B(Z).attr("title"):Z.title)||"";if(Z.nodeName&&!H.orig){H.orig=B(Z).children("images:first").length?B(Z).children("images:first"):B(Z)}if(ab===""&&H.orig&&H.titleFromAlt){ab=H.orig.attr("alt")}W=H.href||(Z.nodeName?B(Z).attr("href"):Z.href)||null;if((/^(?:javascript)/i).test(W)||W=="#"){W=null}if(H.type){Y=H.type;if(!W){W=H.content}}else{if(H.content){Y="html"}else{if(W){if(W.match(i)){Y="image"}else{if(W.match(k)){Y="swf"}else{if(B(Z).hasClass("iframe")){Y="iframe"}else{if(W.indexOf("#")===0){Y="inline"}else{Y="ajax"}}}}}}}if(!Y){x();return}if(Y=="inline"){Z=W.substr(W.indexOf("#"));Y=B(Z).length>0?"inline":"ajax"}H.type=Y;H.href=W;H.title=ab;if(H.autoDimensions){if(H.type=="html"||H.type=="inline"||H.type=="ajax"){H.width="auto";H.height="auto"}else{H.autoDimensions=false}}if(H.modal){H.overlayShow=true;H.hideOnOverlayClick=false;H.hideOnContentClick=false;H.enableEscapeButton=false;H.showCloseButton=false}H.padding=parseInt(H.padding,10);H.margin=parseInt(H.margin,10);L.css("padding",(H.padding+H.margin));B(".fancybox-inline-tmp").unbind("fancybox-cancel").bind("fancybox-change",function(){B(this).replaceWith(m.children())});switch(Y){case"html":L.html(H.content);n();break;case"inline":if(B(Z).parent().is("#fancybox-content")===true){P=false;return}B('<div class="fancybox-inline-tmp" />').hide().insertBefore(B(Z)).bind("fancybox-cleanup",function(){B(this).replaceWith(m.children())}).bind("fancybox-cancel",function(){B(this).replaceWith(L.children())});B(Z).appendTo(L);n();break;case"image":P=false;B.fancybox.showActivity();o=new Image();o.onerror=function(){x()};o.onload=function(){P=true;o.onerror=o.onload=null;F()};o.src=W;break;case"swf":H.scrolling="no";aa='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="'+H.width+'" height="'+H.height+'"><param name="movie" value="'+W+'"></param>';V="";B.each(H.swf,function(ac,ad){aa+='<param name="'+ac+'" value="'+ad+'"></param>';V+=" "+ac+'="'+ad+'"'});aa+='<embed src="'+W+'" type="application/x-shockwave-flash" width="'+H.width+'" height="'+H.height+'"'+V+"></embed></object>";L.html(aa);n();break;case"ajax":P=false;B.fancybox.showActivity();H.ajax.win=H.ajax.success;f=B.ajax(B.extend({},H.ajax,{url:W,data:H.ajax.data||{},dataType:"text",error:function(ac,ae,ad){if(ac.status>0){x()}},success:function(ad,af,ac){var ae=typeof ac=="object"?ac:f;if(ae.status==200||ae.status===0){if(typeof H.ajax.win=="function"){X=H.ajax.win(W,ad,af,ac);if(X===false){T.hide();return}else{if(typeof X=="string"||typeof X=="object"){ad=X}}}L.html(ad);n()}}}));break;case"iframe":E();break}},n=function(){var V=H.width,W=H.height;if(V.toString().indexOf("%")>-1){V=parseInt((B(window).width()-(H.margin*2))*parseFloat(V)/100,10)+"px"}else{V=V=="auto"?"auto":V+"px"}if(W.toString().indexOf("%")>-1){W=parseInt((B(window).height()-(H.margin*2))*parseFloat(W)/100,10)+"px"}else{W=W=="auto"?"auto":W+"px"}L.wrapInner('<div style="width:'+V+";height:"+W+";overflow: "+(H.scrolling=="auto"?"auto":(H.scrolling=="yes"?"scroll":"hidden"))+';position:relative;"></div>');H.width=L.width();H.height=L.height();E()},F=function(){H.width=o.width;H.height=o.height;B("<images />").attr({id:"fancybox-images",src:o.src,alt:H.title}).appendTo(L);E()},E=function(){var W,V;T.hide();if(M.is(":visible")&&false===G.onCleanup(y,e,G)){B.event.trigger("fancybox-cancel");P=false;return}P=true;B(m.add(Q)).unbind();B(window).unbind("resize.fb scroll.fb");B(document).unbind("keydown.fb");if(M.is(":visible")&&G.titlePosition!=="outside"){M.css("height",M.height())}y=j;e=C;G=H;if(G.overlayShow){Q.css({"background-color":G.overlayColor,opacity:G.overlayOpacity,cursor:G.hideOnOverlayClick?"pointer":"auto",height:B(document).height()});if(!Q.is(":visible")){if(S){B("select:not(#fancybox-tmp select)").filter(function(){return this.style.visibility!=="hidden"}).css({visibility:"hidden"}).one("fancybox-cleanup",function(){this.style.visibility="inherit"})}Q.show()}}else{Q.hide()}c=R();l();if(M.is(":visible")){B(J.add(O).add(z)).hide();W=M.position(),b={top:W.top,left:W.left,width:M.width(),height:M.height()};V=(b.width==c.width&&b.height==c.height);m.fadeTo(G.changeFade,0.3,function(){var X=function(){m.html(L.contents()).fadeTo(G.changeFade,1,v)};B.event.trigger("fancybox-change");m.empty().removeAttr("filter").css({"border-width":G.padding,width:c.width-G.padding*2,height:H.autoDimensions?"auto":c.height-h-G.padding*2});if(V){X()}else{s.prop=0;B(s).animate({prop:1},{duration:G.changeSpeed,easing:G.easingChange,step:U,complete:X})}});return}M.removeAttr("style");m.css("border-width",G.padding);if(G.transitionIn=="elastic"){b=I();m.html(L.contents());M.show();if(G.opacity){c.opacity=0}s.prop=0;B(s).animate({prop:1},{duration:G.speedIn,easing:G.easingIn,step:U,complete:v});return}if(G.titlePosition=="inside"&&h>0){A.show()}m.css({width:c.width-G.padding*2,height:H.autoDimensions?"auto":c.height-h-G.padding*2}).html(L.contents());M.css(c).fadeIn(G.transitionIn=="none"?0:G.speedIn,v)},D=function(V){if(V&&V.length){if(G.titlePosition=="float"){return'<table id="fancybox-title-float-wrap" cellpadding="0" cellspacing="0"><tr><td id="fancybox-title-float-left"></td><td id="fancybox-title-float-main">'+V+'</td><td id="fancybox-title-float-right"></td></tr></table>'}return'<div id="fancybox-title-'+G.titlePosition+'">'+V+"</div>"}return false},l=function(){t=G.title||"";h=0;A.empty().removeAttr("style").removeClass();if(G.titleShow===false){A.hide();return}t=B.isFunction(G.titleFormat)?G.titleFormat(t,y,e,G):D(t);if(!t||t===""){A.hide();return}A.addClass("fancybox-title-"+G.titlePosition).html(t).appendTo("body").show();switch(G.titlePosition){case"inside":A.css({width:c.width-(G.padding*2),marginLeft:G.padding,marginRight:G.padding});h=A.outerHeight(true);A.appendTo(d);c.height+=h;break;case"over":A.css({marginLeft:G.padding,width:c.width-(G.padding*2),bottom:G.padding}).appendTo(d);break;case"float":A.css("left",parseInt((A.width()-c.width-40)/2,10)*-1).appendTo(M);break;default:A.css({width:c.width-(G.padding*2),paddingLeft:G.padding,paddingRight:G.padding}).appendTo(M);break}A.hide()},g=function(){if(G.enableEscapeButton||G.enableKeyboardNav){B(document).bind("keydown.fb",function(V){if(V.keyCode==27&&G.enableEscapeButton){V.preventDefault();B.fancybox.close()}else{if((V.keyCode==37||V.keyCode==39)&&G.enableKeyboardNav&&V.target.tagName!=="INPUT"&&V.target.tagName!=="TEXTAREA"&&V.target.tagName!=="SELECT"){V.preventDefault();B.fancybox[V.keyCode==37?"prev":"next"]()}}})}if(!G.showNavArrows){O.hide();z.hide();return}if((G.cyclic&&y.length>1)||e!==0){O.show()}if((G.cyclic&&y.length>1)||e!=(y.length-1)){z.show()}},v=function(){if(!B.support.opacity){m.get(0).style.removeAttribute("filter");M.get(0).style.removeAttribute("filter")}if(H.autoDimensions){m.css("height","auto")}M.css("height","auto");if(t&&t.length){A.show()}if(G.showCloseButton){J.show()}g();if(G.hideOnContentClick){m.bind("click",B.fancybox.close)}if(G.hideOnOverlayClick){Q.bind("click",B.fancybox.close)}B(window).bind("resize.fb",B.fancybox.resize);if(G.centerOnScroll){B(window).bind("scroll.fb",B.fancybox.center)}if(G.type=="iframe"){B('<iframe id="fancybox-frame" name="fancybox-frame'+new Date().getTime()+'" frameborder="0" hspace="0" '+(B.browser.msie?'allowtransparency="true""':"")+' scrolling="'+H.scrolling+'" src="'+G.href+'"></iframe>').appendTo(m)}M.show();P=false;B.fancybox.center();G.onComplete(y,e,G);K()},K=function(){var V,W;if((y.length-1)>e){V=y[e+1].href;if(typeof V!=="undefined"&&V.match(i)){W=new Image();W.src=V}}if(e>0){V=y[e-1].href;if(typeof V!=="undefined"&&V.match(i)){W=new Image();W.src=V}}},U=function(W){var V={width:parseInt(b.width+(c.width-b.width)*W,10),height:parseInt(b.height+(c.height-b.height)*W,10),top:parseInt(b.top+(c.top-b.top)*W,10),left:parseInt(b.left+(c.left-b.left)*W,10)};if(typeof c.opacity!=="undefined"){V.opacity=W<0.5?0.5:W}M.css(V);m.css({width:V.width-G.padding*2,height:V.height-(h*W)-G.padding*2})},u=function(){return[B(window).width()-(G.margin*2),B(window).height()-(G.margin*2),B(document).scrollLeft()+G.margin,B(document).scrollTop()+G.margin]},R=function(){var V=u(),Z={},W=G.autoScale,X=G.padding*2,Y;if(G.width.toString().indexOf("%")>-1){Z.width=parseInt((V[0]*parseFloat(G.width))/100,10)}else{Z.width=G.width+X}if(G.height.toString().indexOf("%")>-1){Z.height=parseInt((V[1]*parseFloat(G.height))/100,10)}else{Z.height=G.height+X}if(W&&(Z.width>V[0]||Z.height>V[1])){if(H.type=="image"||H.type=="swf"){Y=(G.width)/(G.height);if((Z.width)>V[0]){Z.width=V[0];Z.height=parseInt(((Z.width-X)/Y)+X,10)}if((Z.height)>V[1]){Z.height=V[1];Z.width=parseInt(((Z.height-X)*Y)+X,10)}}else{Z.width=Math.min(Z.width,V[0]);Z.height=Math.min(Z.height,V[1])}}Z.top=parseInt(Math.max(V[3]-20,V[3]+((V[1]-Z.height-40)*0.5)),10);Z.left=parseInt(Math.max(V[2]-20,V[2]+((V[0]-Z.width-40)*0.5)),10);return Z},q=function(V){var W=V.offset();W.top+=parseInt(V.css("paddingTop"),10)||0;W.left+=parseInt(V.css("paddingLeft"),10)||0;W.top+=parseInt(V.css("border-top-width"),10)||0;W.left+=parseInt(V.css("border-left-width"),10)||0;W.width=V.width();W.height=V.height();return W},I=function(){var Y=H.orig?B(H.orig):false,X={},W,V;if(Y&&Y.length){W=q(Y);X={width:W.width+(G.padding*2),height:W.height+(G.padding*2),top:W.top-G.padding-20,left:W.left-G.padding-20}}else{V=u();X={width:G.padding*2,height:G.padding*2,top:parseInt(V[3]+V[1]*0.5,10),left:parseInt(V[2]+V[0]*0.5,10)}}return X},a=function(){if(!T.is(":visible")){clearInterval(p);return}B("div",T).css("top",(N*-40)+"px");N=(N+1)%12};B.fn.fancybox=function(V){if(!B(this).length){return this}B(this).data("fancybox",B.extend({},V,(B.metadata?B(this).metadata():{}))).unbind("click.fb").bind("click.fb",function(X){X.preventDefault();if(P){return}P=true;B(this).blur();j=[];C=0;var W=B(this).attr("rel")||"";if(!W||W==""||W==="nofollow"){j.push(this)}else{j=B("a[rel="+W+"], area[rel="+W+"]");C=j.index(this)}w();return});return this};B.fancybox=function(Y){var X;if(P){return}P=true;X=typeof arguments[1]!=="undefined"?arguments[1]:{};j=[];C=parseInt(X.index,10)||0;if(B.isArray(Y)){for(var W=0,V=Y.length;W<V;W++){if(typeof Y[W]=="object"){B(Y[W]).data("fancybox",B.extend({},X,Y[W]))}else{Y[W]=B({}).data("fancybox",B.extend({content:Y[W]},X))}}j=jQuery.merge(j,Y)}else{if(typeof Y=="object"){B(Y).data("fancybox",B.extend({},X,Y))}else{Y=B({}).data("fancybox",B.extend({content:Y},X))}j.push(Y)}if(C>j.length||C<0){C=0}w()};B.fancybox.showActivity=function(){clearInterval(p);T.show();p=setInterval(a,66)};B.fancybox.hideActivity=function(){T.hide()};B.fancybox.next=function(){return B.fancybox.pos(e+1)};B.fancybox.prev=function(){return B.fancybox.pos(e-1)};B.fancybox.pos=function(V){if(P){return}V=parseInt(V);j=y;if(V>-1&&V<y.length){C=V;w()}else{if(G.cyclic&&y.length>1){C=V>=y.length?0:y.length-1;w()}}return};B.fancybox.cancel=function(){if(P){return}P=true;B.event.trigger("fancybox-cancel");r();H.onCancel(j,C,H);P=false};B.fancybox.close=function(){if(P||M.is(":hidden")){return}P=true;if(G&&false===G.onCleanup(y,e,G)){P=false;return}r();B(J.add(O).add(z)).hide();B(m.add(Q)).unbind();B(window).unbind("resize.fb scroll.fb");B(document).unbind("keydown.fb");if(G.type==="iframe"){m.find("iframe").attr("src",S&&/^https/i.test(window.location.href||"")?"javascript:void(false)":"about:blank")}if(G.titlePosition!=="inside"){A.empty()}M.stop();function V(){Q.fadeOut("fast");A.empty().hide();M.hide();B.event.trigger("fancybox-cleanup");m.empty();G.onClosed(y,e,G);y=H=[];e=C=0;G=H={};P=false}if(G.transitionOut=="elastic"){b=I();var W=M.position();c={top:W.top,left:W.left,width:M.width(),height:M.height()};if(G.opacity){c.opacity=1}A.empty().hide();s.prop=1;B(s).animate({prop:0},{duration:G.speedOut,easing:G.easingOut,step:U,complete:V})}else{M.fadeOut(G.transitionOut=="none"?0:G.speedOut,V)}};B.fancybox.resize=function(){if(Q.is(":visible")){Q.css("height",B(document).height())}B.fancybox.center(true)};B.fancybox.center=function(){var V,W;if(P){return}W=arguments[0]===true?1:0;V=u();if(!W&&(M.width()>V[0]||M.height()>V[1])){return}M.stop().animate({top:parseInt(Math.max(V[3]-20,V[3]+((V[1]-m.height()-40)*0.5)-G.padding)),left:parseInt(Math.max(V[2]-20,V[2]+((V[0]-m.width()-40)*0.5)-G.padding))},typeof arguments[0]=="number"?arguments[0]:200)};B.fancybox.init=function(){if(B("#fancybox-wrap").length){return}B("body").append(L=B('<div id="fancybox-tmp"></div>'),T=B('<div id="fancybox-loading"><div></div></div>'),Q=B('<div id="fancybox-overlay"></div>'),M=B('<div id="fancybox-wrap"></div>'));d=B('<div id="fancybox-outer"></div>').append('<div class="fancybox-bg" id="fancybox-bg-n"></div><div class="fancybox-bg" id="fancybox-bg-ne"></div><div class="fancybox-bg" id="fancybox-bg-e"></div><div class="fancybox-bg" id="fancybox-bg-se"></div><div class="fancybox-bg" id="fancybox-bg-s"></div><div class="fancybox-bg" id="fancybox-bg-sw"></div><div class="fancybox-bg" id="fancybox-bg-w"></div><div class="fancybox-bg" id="fancybox-bg-nw"></div>').appendTo(M);d.append(m=B('<div id="fancybox-content"></div>'),J=B('<a id="fancybox-close"></a>'),A=B('<div id="fancybox-title"></div>'),O=B('<a href="javascript:;" id="fancybox-left"><span class="fancy-ico" id="fancybox-left-ico"></span></a>'),z=B('<a href="javascript:;" id="fancybox-right"><span class="fancy-ico" id="fancybox-right-ico"></span></a>'));J.click(B.fancybox.close);T.click(B.fancybox.cancel);O.click(function(V){V.preventDefault();B.fancybox.prev()});z.click(function(V){V.preventDefault();B.fancybox.next()});if(B.fn.mousewheel){M.bind("mousewheel.fb",function(V,W){if(P){V.preventDefault()}else{if(B(V.target).get(0).clientHeight==0||B(V.target).get(0).scrollHeight===B(V.target).get(0).clientHeight){V.preventDefault();B.fancybox[W>0?"prev":"next"]()}}})}if(!B.support.opacity){M.addClass("fancybox-ie")}if(S){T.addClass("fancybox-ie6");M.addClass("fancybox-ie6");B('<iframe id="fancybox-hide-sel-frame" src="'+(/^https/i.test(window.location.href||"")?"javascript:void(false)":"about:blank")+'" scrolling="no" border="0" frameborder="0" tabindex="-1"></iframe>').prependTo(d)}};B.fn.fancybox.defaults={padding:10,margin:40,opacity:false,modal:false,cyclic:false,scrolling:"auto",width:560,height:340,autoScale:true,autoDimensions:true,centerOnScroll:false,ajax:{},swf:{wmode:"transparent"},hideOnOverlayClick:true,hideOnContentClick:false,overlayShow:true,overlayOpacity:0.7,overlayColor:"#777",titleShow:true,titlePosition:"float",titleFormat:null,titleFromAlt:false,transitionIn:"fade",transitionOut:"fade",speedIn:300,speedOut:300,changeSpeed:300,changeFade:"fast",easingIn:"swing",easingOut:"swing",showCloseButton:true,showNavArrows:true,enableEscapeButton:true,enableKeyboardNav:true,onStart:function(){},onCancel:function(){},onComplete:function(){},onCleanup:function(){},onClosed:function(){},onError:function(){}};B(document).ready(function(){B.fancybox.init()})})(jQuery);
*/
/*! fancyBox v2.1.0 fancyapps.com | fancyapps.com/fancybox/#license */
(function(u,p,f,q){var o=f(u),n=f(p),b=f.fancybox=function(){b.open.apply(this,arguments)},z=null,m=p.createTouch!==q,x=function(a){return a&&a.hasOwnProperty&&a instanceof f},s=function(a){return a&&"string"===f.type(a)},C=function(a){return s(a)&&0<a.indexOf("%")},k=function(a,c){var e=parseInt(a,10);c&&C(a)&&(e*=b.getViewport()[c]/100);return Math.ceil(e)},v=function(a,b){return k(a,b)+"px"};f.extend(b,{version:"2.1.0",defaults:{padding:15,margin:20,width:800,height:600,minWidth:100,minHeight:100,
maxWidth:9999,maxHeight:9999,autoSize:!0,autoHeight:!1,autoWidth:!1,autoResize:!m,autoCenter:!m,fitToView:!0,aspectRatio:!1,topRatio:0.5,leftRatio:0.5,scrolling:"auto",wrapCSS:"",arrows:!0,closeBtn:!0,closeClick:!1,nextClick:!1,mouseWheel:!0,autoPlay:!1,playSpeed:3E3,preload:3,modal:!1,loop:!0,ajax:{dataType:"html",headers:{"X-fancyBox":!0}},iframe:{scrolling:"auto",preload:!0},swf:{wmode:"transparent",allowfullscreen:"true",allowscriptaccess:"always"},keys:{next:{13:"left",34:"up",39:"left",40:"up"},
prev:{8:"right",33:"down",37:"right",38:"down"},close:[27],play:[32],toggle:[70]},direction:{next:"left",prev:"right"},scrollOutside:!0,index:0,type:null,href:null,content:null,title:null,tpl:{wrap:'<div class="fancybox-wrap" tabIndex="-1"><div class="fancybox-skin"><div class="fancybox-outer"><div class="fancybox-inner"></div></div></div></div>',image:'<images class="fancybox-image" src="{href}" alt="" />',iframe:'<iframe id="fancybox-frame{rnd}" name="fancybox-frame{rnd}" class="fancybox-iframe" frameborder="0" vspace="0" hspace="0"'+
(f.browser.msie?' allowtransparency="true"':"")+"></iframe>",error:'<p class="fancybox-error">The requested content cannot be loaded.<br/>Please try again later.</p>',closeBtn:'<a title="Close" class="fancybox-item fancybox-close" href="javascript:;"></a>',next:'<a title="Next" class="fancybox-nav fancybox-next" href="javascript:;"><span></span></a>',prev:'<a title="Previous" class="fancybox-nav fancybox-prev" href="javascript:;"><span></span></a>'},openEffect:"fade",openSpeed:250,openEasing:"swing",
openOpacity:!0,openMethod:"zoomIn",closeEffect:"fade",closeSpeed:250,closeEasing:"swing",closeOpacity:!0,closeMethod:"zoomOut",nextEffect:"elastic",nextSpeed:250,nextEasing:"swing",nextMethod:"changeIn",prevEffect:"elastic",prevSpeed:250,prevEasing:"swing",prevMethod:"changeOut",helpers:{overlay:{closeClick:!0,speedOut:200,showEarly:!0,css:{}},title:{type:"float"}},onCancel:f.noop,beforeLoad:f.noop,afterLoad:f.noop,beforeShow:f.noop,afterShow:f.noop,beforeChange:f.noop,beforeClose:f.noop,afterClose:f.noop},
group:{},opts:{},previous:null,coming:null,current:null,isActive:!1,isOpen:!1,isOpened:!1,wrap:null,skin:null,outer:null,inner:null,player:{timer:null,isActive:!1},ajaxLoad:null,imgPreload:null,transitions:{},helpers:{},open:function(a,c){if(a&&(f.isPlainObject(c)||(c={}),!1!==b.close(!0)))return f.isArray(a)||(a=x(a)?f(a).get():[a]),f.each(a,function(e,d){var j={},g,h,i,l,k;"object"===f.type(d)&&(d.nodeType&&(d=f(d)),x(d)?(j={href:d.attr("href"),title:d.attr("title"),isDom:!0,element:d},f.metadata&&
f.extend(!0,j,d.metadata())):j=d);g=c.href||j.href||(s(d)?d:null);h=c.title!==q?c.title:j.title||"";l=(i=c.content||j.content)?"html":c.type||j.type;!l&&j.isDom&&(l=d.data("fancybox-type"),l||(l=(l=d.prop("class").match(/fancybox\.(\w+)/))?l[1]:null));if(s(g)&&(l||(b.isImage(g)?l="image":b.isSWF(g)?l="swf":"#"===g.charAt(0)?l="inline":s(d)&&(l="html",i=d)),"ajax"===l))k=g.split(/\s+/,2),g=k.shift(),k=k.shift();i||("inline"===l?g?i=f(s(g)?g.replace(/.*(?=#[^\s]+$)/,""):g):j.isDom&&(i=d):"html"===l?
i=g:!l&&(!g&&j.isDom)&&(l="inline",i=d));f.extend(j,{href:g,type:l,content:i,title:h,selector:k});a[e]=j}),b.opts=f.extend(!0,{},b.defaults,c),c.keys!==q&&(b.opts.keys=c.keys?f.extend({},b.defaults.keys,c.keys):!1),b.group=a,b._start(b.opts.index)},cancel:function(){var a=b.coming;a&&!1!==b.trigger("onCancel")&&(b.hideLoading(),b.ajaxLoad&&b.ajaxLoad.abort(),b.ajaxLoad=null,b.imgPreload&&(b.imgPreload.onload=b.imgPreload.onerror=null),a.wrap&&a.wrap.stop(!0).trigger("onReset").remove(),b.current||
b.trigger("afterClose"),b.coming=null)},close:function(a){b.cancel();!1!==b.trigger("beforeClose")&&(b.unbindEvents(),!b.isOpen||!0===a?(f(".fancybox-wrap").stop(!0).trigger("onReset").remove(),b._afterZoomOut()):(b.isOpen=b.isOpened=!1,b.isClosing=!0,f(".fancybox-item, .fancybox-nav").remove(),b.wrap.stop(!0,!0).removeClass("fancybox-opened"),"fixed"===b.wrap.css("position")&&b.wrap.css(b._getPosition(!0)),b.transitions[b.current.closeMethod]()))},play:function(a){var c=function(){clearTimeout(b.player.timer)},
e=function(){c();b.current&&b.player.isActive&&(b.player.timer=setTimeout(b.next,b.current.playSpeed))},d=function(){c();f("body").unbind(".player");b.player.isActive=!1;b.trigger("onPlayEnd")};if(!0===a||!b.player.isActive&&!1!==a){if(b.current&&(b.current.loop||b.current.index<b.group.length-1))b.player.isActive=!0,f("body").bind({"afterShow.player onUpdate.player":e,"onCancel.player beforeClose.player":d,"beforeLoad.player":c}),e(),b.trigger("onPlayStart")}else d()},next:function(a){var c=b.current;
c&&(s(a)||(a=c.direction.next),b.jumpto(c.index+1,a,"next"))},prev:function(a){var c=b.current;c&&(s(a)||(a=c.direction.prev),b.jumpto(c.index-1,a,"prev"))},jumpto:function(a,c,e){var d=b.current;if(d&&(a=k(a),b.direction=c||d.direction[a>=d.index?"next":"prev"],b.router=e||"jumpto",d.loop&&(0>a&&(a=d.group.length+a%d.group.length),a%=d.group.length),d.group[a]!==q))b.cancel(),b._start(a)},reposition:function(a,c){var e;b.isOpen&&(e=b._getPosition(c),a&&"scroll"===a.type?(delete e.position,b.wrap.stop(!0,
!0).animate(e,200)):b.wrap.css(e))},update:function(a){var c=a&&a.type,e=!c||"orientationchange"===c;e&&(clearTimeout(z),z=null);if(b.isOpen&&!z){if(e||m)b.wrap.removeAttr("style").addClass("fancybox-tmp"),b.trigger("onUpdate");z=setTimeout(function(){var d=b.current;if(d){b.wrap.removeClass("fancybox-tmp");c!=="scroll"&&b._setDimension();c==="scroll"&&d.canShrink||b.reposition(a);b.trigger("onUpdate");z=null}},m?500:e?20:300)}},toggle:function(a){b.isOpen&&(b.current.fitToView="boolean"===f.type(a)?
a:!b.current.fitToView,b.update())},hideLoading:function(){n.unbind("keypress.fb");f("#fancybox-loading").remove()},showLoading:function(){var a,c;b.hideLoading();n.bind("keypress.fb",function(a){if(27===(a.which||a.keyCode))a.preventDefault(),b.cancel()});a=f('<div id="fancybox-loading"><div></div></div>').click(b.cancel).appendTo("body");b.defaults.fixed||(c=b.getViewport(),a.css({position:"absolute",top:0.5*c.h+c.y,left:0.5*c.w+c.x}))},getViewport:function(){var a=b.current?b.current.locked:!1,
c={x:o.scrollLeft(),y:o.scrollTop()};a?(c.w=a[0].clientWidth,c.h=a[0].clientHeight):(c.w=m&&u.innerWidth?u.innerWidth:o.width(),c.h=m&&u.innerHeight?u.innerHeight:o.height());return c},unbindEvents:function(){b.wrap&&x(b.wrap)&&b.wrap.unbind(".fb");n.unbind(".fb");o.unbind(".fb")},bindEvents:function(){var a=b.current,c;a&&(o.bind("orientationchange.fb"+(m?"":" resize.fb")+(a.autoCenter&&!a.locked?" scroll.fb":""),b.update),(c=a.keys)&&n.bind("keydown.fb",function(e){var d=e.which||e.keyCode,j=e.target||
e.srcElement;!e.ctrlKey&&(!e.altKey&&!e.shiftKey&&!e.metaKey&&(!j||!j.type&&!f(j).is("[contenteditable]")))&&f.each(c,function(c,j){if(1<a.group.length&&j[d]!==q)return b[c](j[d]),e.preventDefault(),!1;if(-1<f.inArray(d,j))return b[c](),e.preventDefault(),!1})}),f.fn.mousewheel&&a.mouseWheel&&b.wrap.bind("mousewheel.fb",function(c,d,j,g){for(var h=f(c.target||null),i=!1;h.length&&!i&&!h.is(".fancybox-skin")&&!h.is(".fancybox-wrap");)i=h[0]&&!(h[0].style.overflow&&"hidden"===h[0].style.overflow)&&
(h[0].clientWidth&&h[0].scrollWidth>h[0].clientWidth||h[0].clientHeight&&h[0].scrollHeight>h[0].clientHeight),h=f(h).parent();if(0!==d&&!i&&1<b.group.length&&!a.canShrink){if(0<g||0<j)b.prev(0<g?"down":"left");else if(0>g||0>j)b.next(0>g?"up":"right");c.preventDefault()}}))},trigger:function(a,c){var e,d=c||b.coming||b.current;if(d){f.isFunction(d[a])&&(e=d[a].apply(d,Array.prototype.slice.call(arguments,1)));if(!1===e)return!1;"onCancel"===a&&!b.isOpened&&(b.isActive=!1);d.helpers&&f.each(d.helpers,
function(c,e){if(e&&b.helpers[c]&&f.isFunction(b.helpers[c][a]))b.helpers[c][a](e,d)});f.event.trigger(a+".fb")}},isImage:function(a){return s(a)&&a.match(/\.(jp(e|g|eg)|gif|png|bmp|webp)((\?|#).*)?$/i)},isSWF:function(a){return s(a)&&a.match(/\.(swf)((\?|#).*)?$/i)},_start:function(a){var c={},e,d,a=k(a);e=b.group[a]||null;if(!e)return!1;c=f.extend(!0,{},b.opts,e);e=c.margin;d=c.padding;"number"===f.type(e)&&(c.margin=[e,e,e,e]);"number"===f.type(d)&&(c.padding=[d,d,d,d]);c.modal&&f.extend(!0,c,
{closeBtn:!1,closeClick:!1,nextClick:!1,arrows:!1,mouseWheel:!1,keys:null,helpers:{overlay:{closeClick:!1}}});c.autoSize&&(c.autoWidth=c.autoHeight=!0);"auto"===c.width&&(c.autoWidth=!0);"auto"===c.height&&(c.autoHeight=!0);c.group=b.group;c.index=a;b.coming=c;if(!1===b.trigger("beforeLoad"))b.coming=null;else{d=c.type;e=c.href;if(!d)return b.coming=null,b.current&&b.router&&"jumpto"!==b.router?(b.current.index=a,b[b.router](b.direction)):!1;b.isActive=!0;if("image"===d||"swf"===d)c.autoHeight=c.autoWidth=
!1,c.scrolling="visible";"image"===d&&(c.aspectRatio=!0);"iframe"===d&&m&&(c.scrolling="scroll");c.wrap=f(c.tpl.wrap).addClass("fancybox-"+(m?"mobile":"desktop")+" fancybox-type-"+d+" fancybox-tmp "+c.wrapCSS).appendTo(c.parent);f.extend(c,{skin:f(".fancybox-skin",c.wrap),outer:f(".fancybox-outer",c.wrap),inner:f(".fancybox-inner",c.wrap)});f.each(["Top","Right","Bottom","Left"],function(a,b){c.skin.css("padding"+b,v(c.padding[a]))});b.trigger("onReady");if("inline"===d||"html"===d){if(!c.content||
!c.content.length)return b._error("content")}else if(!e)return b._error("href");"image"===d?b._loadImage():"ajax"===d?b._loadAjax():"iframe"===d?b._loadIframe():b._afterLoad()}},_error:function(a){f.extend(b.coming,{type:"html",autoWidth:!0,autoHeight:!0,minWidth:0,minHeight:0,scrolling:"no",hasError:a,content:b.coming.tpl.error});b._afterLoad()},_loadImage:function(){var a=b.imgPreload=new Image;a.onload=function(){this.onload=this.onerror=null;b.coming.width=this.width;b.coming.height=this.height;
b._afterLoad()};a.onerror=function(){this.onload=this.onerror=null;b._error("image")};a.src=b.coming.href;(a.complete===q||!a.complete)&&b.showLoading()},_loadAjax:function(){var a=b.coming;b.showLoading();b.ajaxLoad=f.ajax(f.extend({},a.ajax,{url:a.href,error:function(a,e){b.coming&&"abort"!==e?b._error("ajax",a):b.hideLoading()},success:function(c,e){"success"===e&&(a.content=c,b._afterLoad())}}))},_loadIframe:function(){var a=b.coming,c=f(a.tpl.iframe.replace(/\{rnd\}/g,(new Date).getTime())).attr("scrolling",
m?"auto":a.iframe.scrolling).attr("src",a.href);f(a.wrap).bind("onReset",function(){try{f(this).find("iframe").hide().attr("src","//about:blank").end().empty()}catch(a){}});a.iframe.preload&&(b.showLoading(),c.one("load",function(){f(this).data("ready",1);m||f(this).bind("load.fb",b.update);f(this).parents(".fancybox-wrap").width("100%").removeClass("fancybox-tmp").show();b._afterLoad()}));a.content=c.appendTo(a.inner);a.iframe.preload||b._afterLoad()},_preloadImages:function(){var a=b.group,c=b.current,
e=a.length,d=c.preload?Math.min(c.preload,e-1):0,f,g;for(g=1;g<=d;g+=1)f=a[(c.index+g)%e],"image"===f.type&&f.href&&((new Image).src=f.href)},_afterLoad:function(){var a=b.coming,c=b.current,e,d,j,g,h;b.hideLoading();if(a&&!1!==b.isActive)if(!1===b.trigger("afterLoad",a,c))a.wrap.stop(!0).trigger("onReset").remove(),b.coming=null;else{c&&(b.trigger("beforeChange",c),c.wrap.stop(!0).removeClass("fancybox-opened").find(".fancybox-item, .fancybox-nav").remove(),"fixed"===c.wrap.css("position")&&c.wrap.css(b._getPosition(!0)));
b.unbindEvents();e=a.content;d=a.type;j=a.scrolling;f.extend(b,{wrap:a.wrap,skin:a.skin,outer:a.outer,inner:a.inner,current:a,previous:c});g=a.href;switch(d){case "inline":case "ajax":case "html":a.selector?e=f("<div>").html(e).find(a.selector):x(e)&&(e.data("fancybox-placeholder")||e.data("fancybox-placeholder",f('<div class="fancybox-placeholder"></div>').insertAfter(e).hide()),e=e.show().detach(),a.wrap.bind("onReset",function(){f(this).find(e).length&&e.hide().replaceAll(e.data("fancybox-placeholder")).data("fancybox-placeholder",
false)}));break;case "image":e=a.tpl.image.replace("{href}",g);break;case "swf":e='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="100%"><param name="movie" value="'+g+'"></param>',h="",f.each(a.swf,function(a,b){e=e+('<param name="'+a+'" value="'+b+'"></param>');h=h+(" "+a+'="'+b+'"')}),e+='<embed src="'+g+'" type="application/x-shockwave-flash" width="100%" height="100%"'+h+"></embed></object>"}(!x(e)||!e.parent().is(a.inner))&&a.inner.append(e);b.trigger("beforeShow");
a.inner.css("overflow","yes"===j?"scroll":"no"===j?"hidden":j);b._setDimension();a.wrap.removeClass("fancybox-tmp");a.pos=f.extend({},a.dim,b._getPosition(!0));b.isOpen=!1;b.coming=null;b.bindEvents();if(b.isOpened){if(c.prevMethod)b.transitions[c.prevMethod]()}else f(".fancybox-wrap").not(a.wrap).stop(!0).trigger("onReset").remove();b.transitions[b.isOpened?a.nextMethod:a.openMethod]();b._preloadImages()}},_setDimension:function(){var a=b.getViewport(),c=0,e=!1,d=!1,e=b.wrap,j=b.skin,g=b.inner,h=
b.current,d=h.width,i=h.height,l=h.minWidth,t=h.minHeight,m=h.maxWidth,n=h.maxHeight,s=h.scrolling,q=h.scrollOutside?h.scrollbarWidth:0,w=h.margin,o=w[1]+w[3],p=w[0]+w[2],x,r,u,A,y,D,z,B,E;e.add(j).add(g).width("auto").height("auto");w=j.outerWidth(!0)-j.width();x=j.outerHeight(!0)-j.height();r=o+w;u=p+x;A=C(d)?(a.w-r)*k(d)/100:d;y=C(i)?(a.h-u)*k(i)/100:i;if("iframe"===h.type){if(E=h.content,h.autoHeight&&1===E.data("ready"))try{E[0].contentWindow.document.location&&(g.width(A).height(9999),D=E.contents().find("body"),
q&&D.css("overflow-x","hidden"),y=D.height())}catch(F){}}else if(h.autoWidth||h.autoHeight)g.addClass("fancybox-tmp"),h.autoWidth||g.width(A),h.autoHeight||g.height(y),h.autoWidth&&(A=g.width()),h.autoHeight&&(y=g.height()),g.removeClass("fancybox-tmp");d=k(A);i=k(y);B=A/y;l=k(C(l)?k(l,"w")-r:l);m=k(C(m)?k(m,"w")-r:m);t=k(C(t)?k(t,"h")-u:t);n=k(C(n)?k(n,"h")-u:n);D=m;z=n;o=a.w-o;p=a.h-p;if(h.aspectRatio){if(d>m&&(d=m,i=d/B),i>n&&(i=n,d=i*B),d<l&&(d=l,i=d/B),i<t)i=t,d=i*B}else d=Math.max(l,Math.min(d,
m)),i=Math.max(t,Math.min(i,n));if(h.fitToView)if(m=Math.min(a.w-r,m),n=Math.min(a.h-u,n),g.width(k(d)).height(k(i)),e.width(k(d+w)),a=e.width(),r=e.height(),h.aspectRatio)for(;(a>o||r>p)&&(d>l&&i>t)&&!(19<c++);)i=Math.max(t,Math.min(n,i-10)),d=i*B,d<l&&(d=l,i=d/B),d>m&&(d=m,i=d/B),g.width(k(d)).height(k(i)),e.width(k(d+w)),a=e.width(),r=e.height();else d=Math.max(l,Math.min(d,d-(a-o))),i=Math.max(t,Math.min(i,i-(r-p)));q&&("auto"===s&&i<y&&d+w+q<o)&&(d+=q);g.width(k(d)).height(k(i));e.width(k(d+
w));a=e.width();r=e.height();e=(a>o||r>p)&&d>l&&i>t;d=h.aspectRatio?d<D&&i<z&&d<A&&i<y:(d<D||i<z)&&(d<A||i<y);f.extend(h,{dim:{width:v(a),height:v(r)},origWidth:A,origHeight:y,canShrink:e,canExpand:d,wPadding:w,hPadding:x,wrapSpace:r-j.outerHeight(!0),skinSpace:j.height()-i});!E&&(h.autoHeight&&i>t&&i<n&&!d)&&g.height("auto")},_getPosition:function(a){var c=b.current,e=b.getViewport(),d=c.margin,f=b.wrap.width()+d[1]+d[3],g=b.wrap.height()+d[0]+d[2],d={position:"absolute",top:d[0],left:d[3]};c.autoCenter&&
c.fixed&&!a&&g<=e.h&&f<=e.w?d.position="fixed":c.locked||(d.top+=e.y,d.left+=e.x);d.top=v(Math.max(d.top,d.top+(e.h-g)*c.topRatio));d.left=v(Math.max(d.left,d.left+(e.w-f)*c.leftRatio));return d},_afterZoomIn:function(){var a=b.current;a&&((b.isOpen=b.isOpened=!0,b.wrap.addClass("fancybox-opened").css("overflow","visible"),b.reposition(),(a.closeClick||a.nextClick)&&b.inner.css("cursor","pointer").bind("click.fb",function(c){if(!f(c.target).is("a")&&!f(c.target).parent().is("a"))b[a.closeClick?"close":
"next"]()}),a.closeBtn&&f(a.tpl.closeBtn).appendTo(b.skin).bind("click.fb",b.close),a.arrows&&1<b.group.length&&((a.loop||0<a.index)&&f(a.tpl.prev).appendTo(b.outer).bind("click.fb",b.prev),(a.loop||a.index<b.group.length-1)&&f(a.tpl.next).appendTo(b.outer).bind("click.fb",b.next)),b.trigger("afterShow"),!a.loop&&a.index===a.group.length-1)?b.play(!1):b.opts.autoPlay&&!b.player.isActive&&(b.opts.autoPlay=!1,b.play()))},_afterZoomOut:function(){var a=b.current;f(".fancybox-wrap").stop(!0).trigger("onReset").remove();
f.extend(b,{group:{},opts:{},router:!1,current:null,isActive:!1,isOpened:!1,isOpen:!1,isClosing:!1,wrap:null,skin:null,outer:null,inner:null});b.trigger("afterClose",a)}});b.transitions={getOrigPosition:function(){var a=b.current,c=a.element,e=a.orig,d={},f=50,g=50,h=a.hPadding,i=a.wPadding,l=b.getViewport();!e&&(a.isDom&&c.is(":visible"))&&(e=c.find("img:first"),e.length||(e=c));x(e)?(d=e.offset(),e.is("img")&&(f=e.outerWidth(),g=e.outerHeight())):(d.top=l.y+(l.h-g)*a.topRatio,d.left=l.x+(l.w-f)*
a.leftRatio);a.locked&&(d.top-=l.y,d.left-=l.x);return d={top:v(d.top-h*a.topRatio),left:v(d.left-i*a.leftRatio),width:v(f+i),height:v(g+h)}},step:function(a,c){var e,d,f=c.prop;d=b.current;var g=d.wrapSpace,h=d.skinSpace;if("width"===f||"height"===f)e=c.end===c.start?1:(a-c.start)/(c.end-c.start),b.isClosing&&(e=1-e),d="width"===f?d.wPadding:d.hPadding,d=a-d,b.skin[f](k("width"===f?d:d-g*e)),b.inner[f](k("width"===f?d:d-g*e-h*e))},zoomIn:function(){var a=b.current,c=a.pos,e=a.openEffect,d="elastic"===
e,j=f.extend({opacity:1},c);delete j.position;d?(c=this.getOrigPosition(),a.openOpacity&&(c.opacity=0.1)):"fade"===e&&(c.opacity=0.1);b.wrap.css(c).animate(j,{duration:"none"===e?0:a.openSpeed,easing:a.openEasing,step:d?this.step:null,complete:b._afterZoomIn})},zoomOut:function(){var a=b.current,c=a.closeEffect,e="elastic"===c,d={opacity:0.1};e&&(d=this.getOrigPosition(),a.closeOpacity&&(d.opacity=0.1));b.wrap.animate(d,{duration:"none"===c?0:a.closeSpeed,easing:a.closeEasing,step:e?this.step:null,
complete:b._afterZoomOut})},changeIn:function(){var a=b.current,c=a.nextEffect,e=a.pos,d={opacity:1},f=b.direction,g;e.opacity=0.1;"elastic"===c&&(g="down"===f||"up"===f?"top":"left","down"===f||"right"===f?(e[g]=v(k(e[g])-200),d[g]="+=200px"):(e[g]=v(k(e[g])+200),d[g]="-=200px"));"none"===c?b._afterZoomIn():b.wrap.css(e).animate(d,{duration:a.nextSpeed,easing:a.nextEasing,complete:b._afterZoomIn})},changeOut:function(){var a=b.previous,c=a.prevEffect,e={opacity:0.1},d=b.direction;"elastic"===c&&
(e["down"===d||"up"===d?"top":"left"]=("up"===d||"left"===d?"-":"+")+"=200px");a.wrap.animate(e,{duration:"none"===c?0:a.prevSpeed,easing:a.prevEasing,complete:function(){f(this).trigger("onReset").remove()}})}};b.helpers.overlay={overlay:null,update:function(){var a="100%",b;this.overlay.width(a).height("100%");f.browser.msie?(b=Math.max(p.documentElement.offsetWidth,p.body.offsetWidth),n.width()>b&&(a=n.width())):n.width()>o.width()&&(a=n.width());this.overlay.width(a).height(n.height())},onReady:function(a,
b){f(".fancybox-overlay").stop(!0,!0);this.overlay||f.extend(this,{overlay:f('<div class="fancybox-overlay"></div>').appendTo(b.parent),margin:n.height()>o.height()||"scroll"===f("body").css("overflow-y")?f("body").css("margin-right"):!1,el:p.all&&!p.querySelector?f("html"):f("body")});b.fixed&&!m&&(this.overlay.addClass("fancybox-overlay-fixed"),b.autoCenter&&(this.overlay.append(b.wrap),b.locked=this.overlay));!0===a.showEarly&&this.beforeShow.apply(this,arguments)},beforeShow:function(a,c){var e=
this.overlay.unbind(".fb").width("auto").height("auto").css(a.css);a.closeClick&&e.bind("click.fb",function(a){f(a.target).hasClass("fancybox-overlay")&&b.close()});c.fixed&&!m?c.locked&&(this.el.addClass("fancybox-lock"),!1!==this.margin&&f("body").css("margin-right",k(this.margin)+c.scrollbarWidth)):this.update();e.show()},onUpdate:function(a,b){(!b.fixed||m)&&this.update()},afterClose:function(a){var c=this,a=a.speedOut||0;c.overlay&&!b.isActive&&c.overlay.fadeOut(a||0,function(){f("body").css("margin-right",
c.margin);c.el.removeClass("fancybox-lock");c.overlay.remove();c.overlay=null})}};b.helpers.title={beforeShow:function(a){var c=b.current.title,e=a.type;if(s(c)&&""!==f.trim(c)){c=f('<div class="fancybox-title fancybox-title-'+e+'-wrap">'+c+"</div>");switch(e){case "inside":e=b.skin;break;case "outside":e=b.wrap;break;case "over":e=b.inner;break;default:e=b.skin,c.appendTo("body").width(c.width()).wrapInner('<span class="child"></span>'),b.current.margin[2]+=Math.abs(k(c.css("margin-bottom")))}"top"===
a.position?c.prependTo(e):c.appendTo(e)}}};f.fn.fancybox=function(a){var c,e=f(this),d=this.selector||"",j=function(g){var h=f(this).blur(),i=c,j,k;!g.ctrlKey&&(!g.altKey&&!g.shiftKey&&!g.metaKey)&&!h.is(".fancybox-wrap")&&(j=a.groupAttr||"data-fancybox-group",k=h.attr(j),k||(j="rel",k=h.get(0)[j]),k&&(""!==k&&"nofollow"!==k)&&(h=d.length?f(d):e,h=h.filter("["+j+'="'+k+'"]'),i=h.index(this)),a.index=i,!1!==b.open(h,a)&&g.preventDefault())},a=a||{};c=a.index||0;!d||!1===a.live?e.unbind("click.fb-start").bind("click.fb-start",
j):n.undelegate(d,"click.fb-start").delegate(d+":not('.fancybox-item, .fancybox-nav')","click.fb-start",j);return this};n.ready(function(){f.scrollbarWidth===q&&(f.scrollbarWidth=function(){var a=f('<div style="width:50px;height:50px;overflow:auto"><div/></div>').appendTo("body"),b=a.children(),b=b.innerWidth()-b.height(99).innerWidth();a.remove();return b});if(f.support.fixedPosition===q){var a=f.support,c=f('<div style="position:fixed;top:20px;"></div>').appendTo("body"),e=20===c[0].offsetTop||
15===c[0].offsetTop;c.remove();a.fixedPosition=e}f.extend(b.defaults,{scrollbarWidth:f.scrollbarWidth(),fixed:f.support.fixedPosition,parent:f("body")})})})(window,document,jQuery);