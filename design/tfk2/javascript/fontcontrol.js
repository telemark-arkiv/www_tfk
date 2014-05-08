var FontSizer = {
	orgSize : '10',
	highContrast : false,
	set : function (size) {
		FontSizer.change(size);
		if (FontSizer.orgSize != size) {
			Kook.create('fsz',size,7);
		}
		else {
			Kook.erase('fsz');
		}
	},
	change : function (size) {
		var $ = jQuery;
		var body = $('body'); 
		body.css('font-size',size+'px');
		
		if (this.orgSize==size) {
			body.removeClass('resized')	
		}
		else {
			body.addClass('resized');
		}
		
		$('#size-10')[0].className = (size==10)?('selected'):('');
		$('#size-15')[0].className = (size==15)?('selected'):('');
		$('#size-20')[0].className = (size==20)?('selected'):('');
	},
	toggleContrast : function (activate) {
		var $ = jQuery;
		if (!FontSizer.highContrast) {
			$('head').append('<link id="high-contrast-css" rel="stylesheet" href="/extension/ezflow_fk/design/ezflow/stylesheets/high_contrast.css" type="text/css" />');
			$('#high-contrast').html('Vanlig kontrast');
			Kook.create('hctr',1,7);
			FontSizer.highContrast = true;
		}
		else {
			$('#high-contrast-css').remove();
			$('#high-contrast').html('H&oslash;ykontrast');
			Kook.erase('hctr');
			FontSizer.highContrast = false;
		}
	},
	init : function () {
		var fsz = Kook.read('fsz');
		if (fsz) {
			FontSizer.change(fsz);
		}
		var hctr = Kook.read('hctr');
		if (hctr) {
			FontSizer.toggleContrast();
		}		
	}
}
var Kook = {
	create : function (name, value, days) {
		var expires = "";
		if (days) {
			var d = new Date();
			d.setTime(d.getTime() + (days * 24 * 60 * 60 * 1000));
			expires = "; expires=" + d.toGMTString();
		}
		document.cookie = name + "=" + value + expires + "; path=/";
	},
	read: function (name) {
		var nameEQ = name + "=", ca = document.cookie.split(';');
		for (var i = 0, c; i < ca.length; i++) {
			c = ca[i];
			while (c.charAt(0) === ' ') {
				c = c.substring(1, c.length);
			}
			if (c.indexOf(nameEQ) === 0) {
				return c.substring(nameEQ.length, c.length);
			}
		}
		return null;
	},
	erase : function (name) {
		Kook.create(name, "", -1);
	}
};
jQuery(document).ready(function() {
	FontSizer.init();
});