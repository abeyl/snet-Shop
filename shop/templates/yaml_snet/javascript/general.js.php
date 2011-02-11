<?php
/* -----------------------------------------------------------------------------------------
   $Id: general.js.php 1262 2005-09-30 10:00:32Z mz $

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   Released under the GNU General Public License
   ---------------------------------------------------------------------------------------*/


   // this javascriptfile get includes at every template page in shop, you can add your template specific
   // js scripts here
/*
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* JsPopUp 1.0
* Opening Browser-Windows the unobtrusive way
* Dirk Ginader
* www.ginader.de
* dirk@ginader.de
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* degrades nicely, unbobtrusive
* succesfully testet in:
* Windows
* * Firefox 2.0
* * Firefox 1.5
* * IE 7
* * IE 6
* * IE 5.5
* * IE 5.01
* * Opera 8.02
* MAC OS X
* * Firefox 1.5
* * Safari 2.03
* * IE 5.02 MAC
* Linux (Ubuntu)
* * Firefox 1.07
* License:
* This file is entirely BSD licensed.

* More information:
* http://blog.ginader.de/dev/popup.html
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* CHANGELOG:
1.0 Initial Version
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

?>


<script type="text/javascript"><!--

PopUp = function(autoapply){
	this.types = [];
	this.defaults = {
		width:800,
		height:600,
		top:0,
		left:0,
		location:false,
		resizable:false,
		scrollbars:false,
		status:false,
		toolbar:false,
		menubar:false,
		center:true,
		title:"Dieser Link wird in einem neuen Fenster geöffnet"
	}
	this.addType({
		name:"standard",
		location:true,
		resizable:true,
		scrollbars:true,
		status:true,
		toolbar:true,
		menubar:true
	});
	if(autoapply) this.apply();
}
o = PopUp.prototype;
o.apply = function(){
	var links = document.getElementsByTagName("a");
	if(!links) return;
	for(var i=0;i<links.length;i++){
		var l = links[i];
		if(l.className.indexOf("popup") > -1){
			this.attachBehavior(l,this.getType(l));
		}
	}
}
o.addType = function(type){
	for(var prop in this.defaults){
		if(type[prop] == undefined) type[prop] = this.defaults[prop];
	}
	this.types[type.name] = type;
}
o.getType = function(l){
	for(var type in this.types){
		if(l.className.indexOf(type) > -1) return type;
	}
	return "standard";
}
o.attachBehavior = function(l,type){
	var t = this.types[type];
	l.title = t.title;
	l.popupProperties = {
		type: type,
		ref: this
	};
	l.onclick = function(){
		this.popupProperties.ref.open(this.href,this.popupProperties.type);
		return false;
	}
}
o.booleanToWord = function(bool){
	if(bool) return "yes";
	return "no";
}
o.getTopLeftCentered = function(typeObj){
	var t = typeObj;
	var r = {left:t.left, top:t.top};
	var sh = screen.availHeight-20;
	var sw = screen.availWidth-10;
	if(!sh || !sw) return r;
	r.left = (sw/2)-(t.width/2);
	r.top = (sh/2)-(t.height/2);
	return r;
}
o.getParamsOfType = function(typeObj){
	var t = typeObj;
	var c = this.booleanToWord;
	if(t.center){
		var tc = this.getTopLeftCentered(typeObj);
		t.left = tc.left;
		t.top = tc.top;
	}
	var p = "width="+t.width;
	p+=",height="+t.height;
	p+=",left="+t.left;
	p+=",top="+t.top;
	p+=",location="+c(t.location);
	p+=",resizable="+c(t.resizable);
	p+=",scrollbars="+c(t.scrollbars);
	p+=",status="+c(t.status);
	p+=",toolbar="+c(t.toolbar);
	p+=",menubar="+c(t.menubar);
	return p;
}
o.open = function(url,type){
	if(!type) type = "standard";
	var t = this.types[type];
	var p = this.getParamsOfType(t);
	var w = window.open(url,t.name,p);
	if(w) w.focus();
	return false;
}
//--></script>
