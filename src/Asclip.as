/*
Copyright (c) 2012 Nulab Inc, http://www.nulab.co.jp/

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
package
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class Asclip extends Sprite {
		public function Asclip() {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			imageNormal = createImage(IMAGE_NORMAL);
			if (imageNormal) {
				addChild(imageNormal);
			}

			imageOver = createImage(IMAGE_OVER);
			if (imageOver) {
				imageOver.visible = false;
				addChild(imageOver);
			}
			
			imagePress = createImage(IMAGE_PRESS);
			if (imagePress) {
				imagePress.visible = false;
				addChild(imagePress);
			}

			labelString = createString();
			if (labelString) {
				addChild(labelString);
				labelString.x = (stage.stageWidth - labelString.width)/2;
				labelString.y = (stage.stageHeight - labelString.height)/2;
			}
			
			root.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent):void {
				pressing = false;
				if (imageNormal) imageNormal.visible = true;
				if (imageOver) imageOver.visible = false;
				if (imagePress) imagePress.visible = false;
				Mouse.cursor = MouseCursor.AUTO;
			});
			root.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent):void {
				if (imageNormal) imageNormal.visible = false;
				if (imageOver) imageOver.visible = true;
				if (imagePress) imagePress.visible = false;
				Mouse.cursor = MouseCursor.BUTTON;
			});
			root.addEventListener(MouseEvent.MOUSE_MOVE, function(e:MouseEvent):void {
				if (imageNormal) imageNormal.visible = false;
				if (imageOver) imageOver.visible = pressing ? false : true;
				if (imagePress) imagePress.visible = pressing ? true : false;
			});
			root.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void {
				pressing = true;
				if (imageNormal) imageNormal.visible = false;
				if (imageOver) imageOver.visible = false;
				if (imagePress) imagePress.visible = true;
			});
			root.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent):void {
				pressing = false;
				if (imageOver) imageOver.visible = false;
				if (imageOver) imageOver.visible = true;
				if (imagePress) imagePress.visible = false;
			});

			root.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
				var s:String;
				if (parameters[CALLBACK_GET_CLIPSTRING]) {
					s = ExternalInterface.call(parameters[CALLBACK_GET_CLIPSTRING]);
				} else {
					s = parameters[CLIPSTRING];
				}
				if (s) {
					System.setClipboard(s);
					if (parameters[CALLBACK_COPY_COMPLETED]) ExternalInterface.call(parameters[CALLBACK_COPY_COMPLETED]);
				}
			});

			var l:Sprite = new Sprite();
			addChild(l);
			l.graphics.beginFill(0, 0);
			l.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
		}
		
		private function createImage(name:String, callback:Function = null):Loader {
			var url:String = parameters[name];
			if (url) {
				var loader:Loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event):void {
					if (callback != null) callback();
				});
				var request:URLRequest = new URLRequest(url);
				loader.load(request);
				return loader;
			} else {
				return null;
			}
		}
		
		private function createString():TextField {
			var label:String = parameters[LABEL_STRING];
			if (label) {
				var fmt:TextFormat = new TextFormat();
				fmt.color = 0x000000;
				fmt.size = parameters[LABEL_SIZE] ? int(parameters[LABEL_SIZE]) : 12;
				fmt.font = parameters[LABEL_FONT] ? parameters[LABEL_FONT] : "Arial";
	
				var tf:TextField = new TextField();
				tf.multiline = false;
				tf.selectable = false;
				tf.autoSize = TextFieldAutoSize.CENTER;
				tf.text = label;
				tf.setTextFormat(fmt);
	
				return tf;
			} else {
				return null;
			}
		}
		
		private function get parameters():Object {
			return LoaderInfo(this.root.loaderInfo).parameters;
		}
		
		private var imageNormal:Loader;
		private var imageOver:Loader;
		private var imagePress:Loader;
		
		private var labelString:TextField;
		
		private var pressing:Boolean = false;
		
		private static const IMAGE_NORMAL:String = "imageNormal";
		private static const IMAGE_OVER:String = "imageOver";
		private static const IMAGE_PRESS:String = "imagePress";
		
		private static const LABEL_STRING:String = "labelString";
		private static const LABEL_SIZE:String = "labelSize";
		private static const LABEL_FONT:String = "labelFont";

		private static const CLIPSTRING:String = "clipString";
		private static const CALLBACK_GET_CLIPSTRING:String = "getClipString";
		private static const CALLBACK_COPY_COMPLETED:String = "onCopyCompleted";
	}
}