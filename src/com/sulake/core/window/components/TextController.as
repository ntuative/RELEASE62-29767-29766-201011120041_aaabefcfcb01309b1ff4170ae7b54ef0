package com.sulake.core.window.components
{
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.utils.Map;
   import com.sulake.core.utils.XMLVariableParser;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import com.sulake.core.window.graphics.IGraphicContext;
   import com.sulake.core.window.graphics.WindowRedrawFlag;
   import com.sulake.core.window.utils.IMargins;
   import com.sulake.core.window.utils.ITextFieldContainer;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.core.window.utils.TextMargins;
   import com.sulake.core.window.utils.TextStyle;
   import com.sulake.core.window.utils.TextStyleManager;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.Font;
   import flash.text.FontStyle;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextLineMetrics;
   import flash.utils.Dictionary;
   
   public class TextController extends WindowController implements ITextWindow, ITextFieldContainer, ILocalizable
   {
      
      protected static const const_1089:Dictionary = createPropertySetterTable();
      
      protected static const ZERO_RECT:Rectangle = new Rectangle();
       
      
      protected var var_493:Boolean;
      
      private var var_1272:Boolean = false;
      
      protected var var_76:TextMargins;
      
      protected var _autoSize:String = "none";
      
      protected var var_737:Number;
      
      private var var_308:TextStyle;
      
      protected var var_492:Number;
      
      protected var _field:TextField;
      
      protected var var_912:Boolean = false;
      
      public function TextController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         this.var_308 = new TextStyle();
         this.var_76 = new TextMargins(0,0,0,0,this.setTextMargins);
         this.var_493 = false;
         this.var_737 = 0;
         this.var_492 = 0;
         if(this._field == null)
         {
            this._field = new TextField();
            this._field.width = param6.width;
            this._field.height = param6.height;
            this._field.mouseWheelEnabled = false;
         }
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         setTextFormatting(this._field,param3,this.var_308);
         TextStyleManager.events.addEventListener(Event.CHANGE,this.onTextStyleChanged);
         if(this._field.autoSize == TextFieldAutoSize.NONE)
         {
            this._field.width = param6.width;
            this._field.height = param6.height;
         }
      }
      
      private static function setFontSize(param1:TextController, param2:uint) : void
      {
         var _loc3_:TextFormat = param1.defaultTextFormat;
         _loc3_.size = param2;
         param1.setTextFormat(new TextFormat(_loc3_.font,_loc3_.size,_loc3_.color,_loc3_.bold,_loc3_.italic,_loc3_.underline,_loc3_.url,_loc3_.target,_loc3_.align,_loc3_.leftMargin,_loc3_.rightMargin,_loc3_.indent,_loc3_.leading));
         param1.defaultTextFormat = _loc3_;
         param1.var_308.fontSize = param2;
      }
      
      private static function setGridFitType(param1:TextController, param2:String) : void
      {
         param1._field.gridFitType = param2;
         param1.refreshTextImage();
      }
      
      private static function setMarginTop(param1:TextController, param2:int) : void
      {
         param1.margins.top = param2;
      }
      
      private static function setBold(param1:TextController, param2:Boolean) : void
      {
         var _loc3_:TextFormat = param1.defaultTextFormat;
         _loc3_.bold = param2;
         param1.setTextFormat(new TextFormat(_loc3_.font,_loc3_.size,_loc3_.color,_loc3_.bold,_loc3_.italic,_loc3_.underline,_loc3_.url,_loc3_.target,_loc3_.align,_loc3_.leftMargin,_loc3_.rightMargin,_loc3_.indent,_loc3_.leading));
         param1.defaultTextFormat = _loc3_;
         param1.var_308.fontWeight = TextStyle.BOLD;
      }
      
      private static function setSpacing(param1:TextController, param2:Number) : void
      {
         var _loc3_:TextFormat = param1.defaultTextFormat;
         _loc3_.letterSpacing = param2;
         var _loc4_:TextFormat = new TextFormat(_loc3_.font,_loc3_.size,_loc3_.color,_loc3_.bold,_loc3_.italic,_loc3_.underline,_loc3_.url,_loc3_.target,_loc3_.align,_loc3_.leftMargin,_loc3_.rightMargin,_loc3_.indent,_loc3_.leading);
         _loc4_.letterSpacing = param2;
         param1.setTextFormat(_loc4_);
         param1.defaultTextFormat = _loc3_;
         param1.var_308.letterSpacing = param2;
      }
      
      private static function setCondenseWhite(param1:TextController, param2:Boolean) : void
      {
         param1._field.condenseWhite = param2;
         param1.refreshTextImage();
      }
      
      private static function setMarginRight(param1:TextController, param2:int) : void
      {
         param1.margins.right = param2;
      }
      
      private static function setDisplayAsPassword(param1:TextController, param2:Boolean) : void
      {
         param1._field.displayAsPassword = param2;
         param1.refreshTextImage();
      }
      
      private static function setFontFace(param1:TextController, param2:String) : void
      {
         var _loc5_:* = null;
         var _loc3_:TextFormat = param1.defaultTextFormat;
         _loc3_.font = param2;
         param1.setTextFormat(new TextFormat(_loc3_.font,_loc3_.size,_loc3_.color,_loc3_.bold,_loc3_.italic,_loc3_.underline,_loc3_.url,_loc3_.target,_loc3_.align,_loc3_.leftMargin,_loc3_.rightMargin,_loc3_.indent,_loc3_.leading));
         param1._field.embedFonts = false;
         var _loc4_:Array = Font.enumerateFonts(false);
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.fontName == param2)
            {
               param1._field.embedFonts = true;
               break;
            }
         }
         param1.defaultTextFormat = _loc3_;
         param1.var_308.fontFamily = param2;
      }
      
      private static function setKerning(param1:TextController, param2:Boolean) : void
      {
         var _loc3_:TextFormat = param1.defaultTextFormat;
         _loc3_.kerning = param2;
         var _loc4_:TextFormat = new TextFormat(_loc3_.font,_loc3_.size,_loc3_.color,_loc3_.bold,_loc3_.italic,_loc3_.underline,_loc3_.url,_loc3_.target,_loc3_.align,_loc3_.leftMargin,_loc3_.rightMargin,_loc3_.indent,_loc3_.leading);
         _loc4_.kerning = param2;
         param1.setTextFormat(_loc4_);
         param1.defaultTextFormat = _loc3_;
         param1.var_308.kerning = param2;
      }
      
      private static function setAutoSize(param1:TextController, param2:String) : void
      {
         param1._autoSize = param2;
         param1._field.autoSize = param2 != TextFieldAutoSize.NONE ? "null" : TextFieldAutoSize.NONE;
         param1.refreshTextImage();
      }
      
      private static function setThickness(param1:TextController, param2:Number) : void
      {
         param1._field.thickness = param2;
         param1.refreshTextImage();
      }
      
      private static function setBorderColor(param1:TextController, param2:uint) : void
      {
         param1._field.borderColor = param2;
         param1.refreshTextImage();
      }
      
      private static function setRestrict(param1:TextController, param2:String) : void
      {
         param1._field.restrict = param2;
      }
      
      private static function setMarginLeft(param1:TextController, param2:int) : void
      {
         param1.margins.left = param2;
      }
      
      private static function setSelectable(param1:TextController, param2:Boolean) : void
      {
         param1._field.selectable = param2;
      }
      
      protected static function createPropertySetterTable() : Dictionary
      {
         var _loc1_:Dictionary = new Dictionary();
         _loc1_["antialias_type"] = setAntiAliasType;
         _loc1_["always_show_selection"] = setAlwaysShowSelection;
         _loc1_["auto_size"] = setAutoSize;
         _loc1_["background"] = setTextBackground;
         _loc1_["background_color"] = setTextBackgroundColor;
         _loc1_["bold"] = setBold;
         _loc1_["border"] = setBorder;
         _loc1_["border_color"] = setBorderColor;
         _loc1_["condense_white"] = setCondenseWhite;
         _loc1_["display_as_password"] = setDisplayAsPassword;
         _loc1_["default_text_format"] = setDefaultTextFormat;
         _loc1_["embed_fonts"] = setEmbedFonts;
         _loc1_["font_face"] = setFontFace;
         _loc1_["font_size"] = setFontSize;
         _loc1_["grid_fit_type"] = setGridFitType;
         _loc1_["html_text"] = setHtmlText;
         _loc1_["italic"] = setItalic;
         _loc1_["kerning"] = setKerning;
         _loc1_["max_chars"] = setMaxChars;
         _loc1_["mouse_wheel_enabled"] = setMouseWheelEnabled;
         _loc1_["multiline"] = setMultiline;
         _loc1_["restrict"] = setRestrict;
         _loc1_["selectable"] = setSelectable;
         _loc1_["spacing"] = setSpacing;
         _loc1_["sharpness"] = setSharpness;
         _loc1_["style_sheet"] = setStyleSheet;
         _loc1_["text_color"] = setTextColor;
         _loc1_["thickness"] = setThickness;
         _loc1_["underline"] = setUnderline;
         _loc1_["word_wrap"] = setWordWrap;
         _loc1_["margin_left"] = setMarginLeft;
         _loc1_["margin_top"] = setMarginTop;
         _loc1_["margin_right"] = setMarginRight;
         _loc1_["margin_bottom"] = setMarginBottom;
         _loc1_["margins"] = setTextMarginMap;
         return _loc1_;
      }
      
      private static function setTextMarginMap(param1:TextController, param2:Map) : void
      {
         param1.var_76.dispose();
         param1.var_76 = new TextMargins(int(param2["left"]),int(param2["top"]),int(param2["right"]),int(param2["bottom"]),param1.setTextMargins);
         param1.refreshTextImage();
      }
      
      private static function setTextColor(param1:TextController, param2:uint) : void
      {
         param1._field.textColor = param2;
         param1.refreshTextImage();
         param1.var_308.color = param2;
      }
      
      private static function setDefaultTextFormat(param1:TextController, param2:TextFormat) : void
      {
         param1._field.defaultTextFormat = param2;
         param1.refreshTextImage();
      }
      
      private static function setTextBackgroundColor(param1:TextController, param2:uint) : void
      {
         param1.color = param2;
      }
      
      protected static function setTextFormatting(param1:TextField, param2:uint, param3:TextStyle) : void
      {
         var _loc7_:* = null;
         var _loc4_:TextStyle = TextStyleManager.getStyleWithIndex(param2);
         var _loc5_:TextFormat = param1.defaultTextFormat;
         if(!param3.fontFamily)
         {
            _loc5_.font = _loc4_.fontFamily;
         }
         if(!param3.fontSize)
         {
            _loc5_.size = _loc4_.fontSize;
         }
         if(!param3.color)
         {
            _loc5_.color = _loc4_.color;
         }
         if(!param3.fontWeight)
         {
            _loc5_.bold = _loc4_.fontWeight == FontStyle.BOLD ? true : null;
         }
         if(!param3.fontStyle)
         {
            _loc5_.italic = _loc4_.fontStyle == FontStyle.ITALIC ? true : null;
         }
         if(!param3.textDecoration)
         {
            _loc5_.underline = _loc4_.textDecoration == TextStyle.const_957 ? true : null;
         }
         if(!param3.fontFamily)
         {
            _loc5_.indent = _loc4_.textIndent;
         }
         if(!param3.textIndent)
         {
            _loc5_.leading = _loc4_.leading;
         }
         if(!param3.kerning)
         {
            _loc5_.kerning = _loc4_.kerning;
         }
         if(!param3.letterSpacing)
         {
            _loc5_.letterSpacing = _loc4_.letterSpacing;
         }
         param1.setTextFormat(_loc5_);
         param1.embedFonts = false;
         var _loc6_:Array = Font.enumerateFonts(false);
         for each(_loc7_ in _loc6_)
         {
            if(_loc7_.fontName == _loc5_.font)
            {
               param1.embedFonts = true;
               break;
            }
         }
         param1.defaultTextFormat = _loc5_;
      }
      
      private static function setMouseWheelEnabled(param1:TextController, param2:Boolean) : void
      {
         param1._field.mouseWheelEnabled = param2;
      }
      
      private static function setMaxChars(param1:TextController, param2:int) : void
      {
         param1._field.maxChars = param2;
         param1.refreshTextImage();
      }
      
      private static function setMultiline(param1:TextController, param2:Boolean) : void
      {
         param1._field.multiline = param2;
         param1.refreshTextImage();
      }
      
      private static function setUnderline(param1:TextController, param2:Boolean) : void
      {
         var _loc3_:TextFormat = param1.defaultTextFormat;
         _loc3_.underline = param2;
         param1.setTextFormat(new TextFormat(_loc3_.font,_loc3_.size,_loc3_.color,_loc3_.bold,_loc3_.italic,_loc3_.underline,_loc3_.url,_loc3_.target,_loc3_.align,_loc3_.leftMargin,_loc3_.rightMargin,_loc3_.indent,_loc3_.leading));
         param1.defaultTextFormat = _loc3_;
         param1.var_308.textDecoration = !!param2 ? "null" : TextStyle.NONE;
      }
      
      private static function setAntiAliasType(param1:TextController, param2:String) : void
      {
         param1._field.antiAliasType = param2;
         param1.refreshTextImage();
      }
      
      private static function setBorder(param1:TextController, param2:Boolean) : void
      {
         param1._field.border = param2;
         param1.refreshTextImage();
      }
      
      private static function setWordWrap(param1:TextController, param2:Boolean) : void
      {
         param1._field.wordWrap = param2;
         param1.refreshTextImage();
      }
      
      private static function setStyleSheet(param1:TextController, param2:Object) : void
      {
         if(param2 is StyleSheet)
         {
            param1._field.styleSheet = StyleSheet(param2);
         }
         else if(param2 is String)
         {
            param1._field.styleSheet.parseCSS(unescape(String(param2)));
         }
         param1.refreshTextImage();
      }
      
      private static function setItalic(param1:TextController, param2:Boolean) : void
      {
         var _loc3_:TextFormat = param1.defaultTextFormat;
         _loc3_.italic = param2;
         param1.setTextFormat(new TextFormat(_loc3_.font,_loc3_.size,_loc3_.color,_loc3_.bold,_loc3_.italic,_loc3_.underline,_loc3_.url,_loc3_.target,_loc3_.align,_loc3_.leftMargin,_loc3_.rightMargin,_loc3_.indent,_loc3_.leading));
         param1.defaultTextFormat = _loc3_;
         param1.var_308.fontStyle = !!param2 ? "null" : TextStyle.NORMAL;
      }
      
      private static function setEmbedFonts(param1:TextController, param2:Boolean) : void
      {
         param1._field.embedFonts = param2;
      }
      
      private static function setHtmlText(param1:TextController, param2:String) : void
      {
         param1._field.htmlText = param2;
         param1.refreshTextImage();
      }
      
      private static function setMarginBottom(param1:TextController, param2:int) : void
      {
         param1.margins.bottom = param2;
      }
      
      private static function setTextBackground(param1:TextController, param2:Boolean) : void
      {
         param1.background = param2;
      }
      
      private static function setAlwaysShowSelection(param1:TextController, param2:Boolean) : void
      {
         param1._field.alwaysShowSelection = param2;
      }
      
      private static function setSharpness(param1:TextController, param2:Number) : void
      {
         param1._field.sharpness = param2;
         param1.refreshTextImage();
      }
      
      public function replaceText(param1:int, param2:int, param3:String) : void
      {
         this._field.replaceText(param1,param2,param3);
         this.refreshTextImage();
      }
      
      public function get visibleRegion() : Rectangle
      {
         return new Rectangle(this.var_737 * this.maxScrollH,this.var_492 * this.maxScrollV,width,height);
      }
      
      public function set kerning(param1:Boolean) : void
      {
         setKerning(this,param1);
      }
      
      override public function dispose() : void
      {
         TextStyleManager.events.removeEventListener(Event.CHANGE,this.onTextStyleChanged);
         if(this.var_912)
         {
            context.removeLocalizationListener(var_246,this);
         }
         if(this.var_76 != null)
         {
            this.var_76.dispose();
            this.var_76 = null;
         }
         this._field = null;
         super.dispose();
      }
      
      public function get border() : Boolean
      {
         return this._field.border;
      }
      
      public function get styleSheet() : StyleSheet
      {
         return this._field.styleSheet;
      }
      
      public function get scrollStepH() : Number
      {
         return 10;
      }
      
      public function get italic() : Boolean
      {
         return this._field.defaultTextFormat.italic;
      }
      
      public function get textColor() : uint
      {
         return this._field.textColor;
      }
      
      public function getFirstCharInParagraph(param1:int) : int
      {
         return this._field.getFirstCharInParagraph(param1);
      }
      
      public function get textBackground() : Boolean
      {
         return background;
      }
      
      public function get scrollStepV() : Number
      {
         return this._field.textHeight / this._field.numLines;
      }
      
      public function get spacing() : Number
      {
         return Number(this._field.defaultTextFormat.letterSpacing);
      }
      
      public function set scrollH(param1:Number) : void
      {
         this.var_737 = param1;
         this._field.scrollH = this.var_737 * Number(this._field.maxScrollH);
         this.refreshTextImage();
      }
      
      public function get autoSize() : String
      {
         return this._autoSize;
      }
      
      public function set scrollV(param1:Number) : void
      {
         if(param1 > this.var_492)
         {
            this.var_492 = param1;
            this._field.scrollV = Math.max(this._field.scrollV,param1 * this._field.maxScrollV + 1);
            this.refreshTextImage();
         }
         else if(param1 < this.var_492)
         {
            this.var_492 = param1;
            this._field.scrollV = Math.min(this._field.scrollV,param1 * this._field.maxScrollV - 1);
            this.refreshTextImage();
         }
      }
      
      public function set border(param1:Boolean) : void
      {
         setBorder(this,param1);
      }
      
      public function set text(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_912)
         {
            context.removeLocalizationListener(var_246,this);
            this.var_912 = false;
         }
         var_246 = param1;
         if(var_246.charAt(0) == "$" && var_246.charAt(1) == "{")
         {
            context.registerLocalizationListener(var_246.slice(2,var_246.indexOf("}")),this);
            this.var_912 = true;
         }
         else if(this._field != null)
         {
            this._field.text = var_246;
            this.refreshTextImage();
         }
      }
      
      public function set styleSheet(param1:StyleSheet) : void
      {
         setStyleSheet(this,param1);
      }
      
      public function get selectable() : Boolean
      {
         return this._field.selectable;
      }
      
      public function set scrollStepH(param1:Number) : void
      {
      }
      
      public function set italic(param1:Boolean) : void
      {
         setItalic(this,param1);
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         this.var_493 = true;
         for each(_loc3_ in param1)
         {
            _loc2_ = const_1089[_loc3_.key];
            if(_loc2_ != null)
            {
               _loc2_(this,_loc3_.value);
            }
         }
         this.var_493 = false;
         super.properties = param1;
         this.refreshTextImage();
      }
      
      public function get antiAliasType() : String
      {
         return this._field.antiAliasType;
      }
      
      override public function set background(param1:Boolean) : void
      {
         super.background = param1;
         this._field.background = param1;
         this.refreshTextImage();
      }
      
      public function set textColor(param1:uint) : void
      {
         setTextColor(this,param1);
      }
      
      public function get wordWrap() : Boolean
      {
         return this._field.wordWrap;
      }
      
      public function set textBackground(param1:Boolean) : void
      {
         setTextBackground(this,param1);
      }
      
      public function set scrollStepV(param1:Number) : void
      {
      }
      
      public function get bottomScrollV() : int
      {
         return this._field.bottomScrollV;
      }
      
      public function set sharpness(param1:Number) : void
      {
         setSharpness(this,param1);
      }
      
      public function getLineIndexOfChar(param1:int) : int
      {
         return this._field.getLineIndexOfChar(param1);
      }
      
      public function get bold() : Boolean
      {
         return this._field.defaultTextFormat.bold;
      }
      
      public function set spacing(param1:Number) : void
      {
         setSpacing(this,param1);
      }
      
      public function get margins() : IMargins
      {
         return this.var_76;
      }
      
      public function get borderColor() : uint
      {
         return this._field.borderColor;
      }
      
      public function set fontFace(param1:String) : void
      {
         setFontFace(this,param1);
      }
      
      public function get textWidth() : Number
      {
         return this._field.textWidth;
      }
      
      public function get immediateClickMode() : Boolean
      {
         return this.var_1272;
      }
      
      public function set autoSize(param1:String) : void
      {
         setAutoSize(this,param1);
      }
      
      public function get embedFonts() : Boolean
      {
         return this._field.embedFonts;
      }
      
      public function get defaultTextFormat() : TextFormat
      {
         return this._field.defaultTextFormat;
      }
      
      public function set selectable(param1:Boolean) : void
      {
         this._field.selectable = param1;
      }
      
      public function get multiline() : Boolean
      {
         return this._field.multiline;
      }
      
      public function set displayAsPassword(param1:Boolean) : void
      {
         setDisplayAsPassword(this,param1);
      }
      
      public function getLineText(param1:int) : String
      {
         return this._field.getLineText(param1);
      }
      
      public function get textHeight() : Number
      {
         return this._field.textHeight;
      }
      
      public function get restrict() : String
      {
         return this._field.restrict;
      }
      
      override public function set color(param1:uint) : void
      {
         super.color = param1;
         this._field.backgroundColor = param1;
         this.refreshTextImage();
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         if(!this.var_493)
         {
            if(param2.type == WindowNotifyEvent.const_167)
            {
               this.refreshTextImage();
            }
         }
         return super.update(param1,param2);
      }
      
      public function get gridFitType() : String
      {
         return this._field.gridFitType;
      }
      
      public function set antiAliasType(param1:String) : void
      {
         setAntiAliasType(this,param1);
      }
      
      public function get underline() : Boolean
      {
         return this._field.defaultTextFormat.underline;
      }
      
      public function setTextMargins(param1:IMargins) : void
      {
         if(param1 != this.var_76)
         {
            this.var_76.dispose();
            this.var_76 = new TextMargins(param1.left,param1.top,param1.right,param1.bottom,this.setTextMargins);
         }
         this.refreshTextImage();
      }
      
      public function get maxChars() : int
      {
         return this._field.maxChars;
      }
      
      public function get length() : int
      {
         return this._field.length;
      }
      
      public function set thickness(param1:Number) : void
      {
         setThickness(this,param1);
      }
      
      private function immediateClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         getRelativeMousePosition(_loc2_);
         dispatchEvent(new WindowMouseEvent(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this,null,_loc2_.x,_loc2_.y,param1.stageX,param1.stageY,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown,param1.delta,false,false));
         param1.stopImmediatePropagation();
      }
      
      public function set wordWrap(param1:Boolean) : void
      {
         setWordWrap(this,param1);
      }
      
      public function getLineMetrics(param1:int) : TextLineMetrics
      {
         return this._field.getLineMetrics(param1);
      }
      
      public function get fontSize() : uint
      {
         return this._field.defaultTextFormat.size == null ? 12 : uint(uint(this._field.defaultTextFormat.size));
      }
      
      public function set bold(param1:Boolean) : void
      {
         setBold(this,param1);
      }
      
      public function get kerning() : Boolean
      {
         return this._field.defaultTextFormat.kerning;
      }
      
      public function set htmlText(param1:String) : void
      {
         setHtmlText(this,param1);
      }
      
      public function get maxScrollH() : int
      {
         return this._field.maxScrollH;
      }
      
      public function get scrollH() : Number
      {
         return this.var_737;
      }
      
      public function get numLines() : int
      {
         return this._field.numLines;
      }
      
      public function get maxScrollV() : int
      {
         return Math.max(this._field.textHeight - height,0);
      }
      
      public function get scrollV() : Number
      {
         return this.var_492;
      }
      
      public function get text() : String
      {
         return this._field != null ? this._field.text : "";
      }
      
      public function set localization(param1:String) : void
      {
         if(param1 != null && this._field != null)
         {
            this._field.text = param1;
            this.refreshTextImage();
         }
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         var _loc2_:Object = TextStyleManager.getStyleWithIndex(style);
         _loc1_.push(new PropertyStruct("font_face",this.defaultTextFormat.font,PropertyStruct.const_91,this.defaultTextFormat.font != _loc2_.fontFamily));
         _loc1_.push(new PropertyStruct("font_size",this.defaultTextFormat.size,PropertyStruct.const_253,this.defaultTextFormat.size != _loc2_.fontSize));
         _loc1_.push(new PropertyStruct("text_color",this._field.textColor,PropertyStruct.const_170,this._field.textColor != _loc2_.color));
         _loc1_.push(new PropertyStruct("antialias_type",this._field.antiAliasType,PropertyStruct.const_91,this._field.antiAliasType != "normal"));
         _loc1_.push(new PropertyStruct("always_show_selection",this._field.alwaysShowSelection,PropertyStruct.const_49,this._field.alwaysShowSelection != false));
         _loc1_.push(new PropertyStruct("border",this._field.border,PropertyStruct.const_49,this._field.border == true));
         _loc1_.push(new PropertyStruct("border_color",this._field.borderColor,PropertyStruct.const_170,this._field.borderColor != 0));
         _loc1_.push(new PropertyStruct("condense_white",this._field.condenseWhite,PropertyStruct.const_49,this._field.condenseWhite != false));
         _loc1_.push(new PropertyStruct("display_as_password",this._field.displayAsPassword,PropertyStruct.const_49,this._field.displayAsPassword != false));
         _loc1_.push(new PropertyStruct("embed_fonts",this._field.embedFonts,PropertyStruct.const_49,this._field.embedFonts != false));
         _loc1_.push(new PropertyStruct("grid_fit_type",this._field.gridFitType,PropertyStruct.const_91,this._field.gridFitType != "pixel"));
         _loc1_.push(new PropertyStruct("max_chars",this._field.maxChars,PropertyStruct.const_54,this._field.maxChars != 0));
         _loc1_.push(new PropertyStruct("mouse_wheel_enabled",this._field.mouseWheelEnabled,PropertyStruct.const_49,this._field.mouseWheelEnabled != false));
         _loc1_.push(new PropertyStruct("multiline",this._field.multiline,PropertyStruct.const_49,this._field.multiline != false));
         _loc1_.push(new PropertyStruct("restrict",this._field.restrict,PropertyStruct.const_91,this._field.restrict != null));
         _loc1_.push(new PropertyStruct("sharpness",this._field.sharpness,PropertyStruct.const_230,this._field.sharpness != 0));
         _loc1_.push(new PropertyStruct("style_sheet",this._field.styleSheet,PropertyStruct.const_91,this._field.styleSheet != null));
         _loc1_.push(new PropertyStruct("thickness",this._field.thickness,PropertyStruct.const_230,this._field.thickness != 0));
         _loc1_.push(new PropertyStruct("word_wrap",this._field.wordWrap,PropertyStruct.const_49,this._field.wordWrap != false));
         _loc1_.push(new PropertyStruct("margin_left",this.var_76.left,PropertyStruct.const_54,this.var_76.left != 0));
         _loc1_.push(new PropertyStruct("margin_top",this.var_76.top,PropertyStruct.const_54,this.var_76.top != 0));
         _loc1_.push(new PropertyStruct("margin_right",this.var_76.right,PropertyStruct.const_54,this.var_76.right != 0));
         _loc1_.push(new PropertyStruct("margin_bottom",this.var_76.bottom,PropertyStruct.const_54,this.var_76.bottom != 0));
         _loc1_.push(new PropertyStruct("auto_size",this._autoSize,PropertyStruct.const_91,this._autoSize != TextFieldAutoSize.NONE));
         _loc1_.push(new PropertyStruct("bold",this._field.defaultTextFormat.bold != false,PropertyStruct.const_49,this._field.defaultTextFormat.bold != false && _loc2_.fontWeight != FontStyle.BOLD));
         _loc1_.push(new PropertyStruct("italic",this._field.defaultTextFormat.italic != false,PropertyStruct.const_49,this._field.defaultTextFormat.italic != false && _loc2_.fontStyle != FontStyle.ITALIC));
         _loc1_.push(new PropertyStruct("underline",this._field.defaultTextFormat.underline != false,PropertyStruct.const_49,this._field.defaultTextFormat.underline != false && _loc2_.textDecoration != "underline"));
         _loc1_.push(new PropertyStruct("kerning",this._field.defaultTextFormat.kerning != false,PropertyStruct.const_49,this._field.defaultTextFormat.kerning != false && !_loc2_.kerning));
         _loc1_.push(new PropertyStruct("spacing",this._field.defaultTextFormat.letterSpacing,PropertyStruct.const_230,this._field.defaultTextFormat.letterSpacing != 0));
         return _loc1_;
      }
      
      public function set borderColor(param1:uint) : void
      {
         setBorderColor(this,param1);
      }
      
      public function set immediateClickMode(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(param1 != this.var_1272)
         {
            this.var_1272 = param1;
            _loc2_ = getGraphicContext(false);
            if(_loc2_)
            {
               if(this.var_1272)
               {
                  _loc2_.mouse = true;
                  _loc2_.addEventListener(MouseEvent.CLICK,this.immediateClickHandler);
               }
               else
               {
                  _loc2_.mouse = false;
                  _loc2_.removeEventListener(MouseEvent.CLICK,this.immediateClickHandler);
               }
            }
         }
      }
      
      public function getImageReference(param1:String) : DisplayObject
      {
         return this._field.getImageReference(param1);
      }
      
      public function get sharpness() : Number
      {
         return this._field.sharpness;
      }
      
      public function set defaultTextFormat(param1:TextFormat) : void
      {
         setDefaultTextFormat(this,param1);
      }
      
      public function get fontFace() : String
      {
         return this._field.defaultTextFormat.font;
      }
      
      public function set multiline(param1:Boolean) : void
      {
         setMultiline(this,param1);
      }
      
      override public function clone() : IWindow
      {
         var _loc1_:TextController = super.clone() as TextController;
         var _loc2_:TextField = _loc1_._field;
         _loc2_.backgroundColor = color;
         _loc2_.background = background;
         _loc1_.var_737 = this.var_737;
         _loc1_.var_492 = this.var_492;
         _loc1_.var_76 = this.var_76.clone(_loc1_.setTextMargins);
         _loc1_._autoSize = this._autoSize;
         _loc1_.var_912 = this.var_912;
         return _loc1_;
      }
      
      public function get displayAsPassword() : Boolean
      {
         return this._field.displayAsPassword;
      }
      
      public function set embedFonts(param1:Boolean) : void
      {
         setEmbedFonts(this,param1);
      }
      
      public function appendText(param1:String) : void
      {
         this._field.appendText(param1);
         this.refreshTextImage();
      }
      
      public function get thickness() : Number
      {
         return this._field.thickness;
      }
      
      public function getLineIndexAtPoint(param1:Number, param2:Number) : int
      {
         return this._field.getLineIndexAtPoint(param1,param2);
      }
      
      public function get htmlText() : String
      {
         return this._field.htmlText;
      }
      
      public function getCharBoundaries(param1:int) : Rectangle
      {
         return this._field.getCharBoundaries(param1);
      }
      
      public function get scrollableRegion() : Rectangle
      {
         return new Rectangle(0,0,this.maxScrollH + width,this.maxScrollV + height);
      }
      
      public function getTextFormat(param1:int = -1, param2:int = -1) : TextFormat
      {
         return this._field.getTextFormat(param1,param2);
      }
      
      public function setTextFormat(param1:TextFormat, param2:int = -1, param3:int = -1) : void
      {
         this._field.setTextFormat(param1,param2,param3);
         this.refreshTextImage();
      }
      
      public function set restrict(param1:String) : void
      {
         setRestrict(this,param1);
      }
      
      private function onTextStyleChanged(param1:Event) : void
      {
         setTextFormatting(this._field,style,this.var_308);
         this.refreshTextImage();
      }
      
      public function set gridFitType(param1:String) : void
      {
         setGridFitType(this,param1);
      }
      
      protected function refreshTextImage() : void
      {
         if(this.var_493)
         {
            return;
         }
         this.var_493 = true;
         var _loc1_:int = this.var_76.left + this.var_76.right;
         var _loc2_:int = this.var_76.top + this.var_76.bottom;
         var _loc3_:int = 0 - _loc1_;
         var _loc4_:int = 0 - _loc2_;
         var _loc5_:int = Math.floor(this._field.width) + (!!this._field.border ? 1 : 0);
         var _loc6_:int = Math.floor(this._field.height) + (!!this._field.border ? 1 : 0);
         var _loc7_:Boolean = false;
         if(_loc5_ != _loc3_)
         {
            if(this._autoSize == TextFieldAutoSize.LEFT)
            {
               setRectangle(var_11.x,var_11.y,_loc5_ + _loc1_,Math.floor(this._field.height) + _loc2_);
               _loc7_ = true;
            }
            else if(this._autoSize == TextFieldAutoSize.RIGHT)
            {
               setRectangle(var_11.x,var_11.y,_loc5_ + _loc1_,Math.floor(this._field.height) + _loc2_);
               _loc7_ = true;
            }
            else if(this._autoSize != TextFieldAutoSize.CENTER)
            {
               this._field.width = _loc3_ - (!!this._field.border ? 1 : 0);
               this._field.height = _loc4_ - (!!this._field.border ? 1 : 0);
            }
         }
         if(this._field.height + (!!this._field.border ? 1 : 0) < _loc4_)
         {
            this._field.height = _loc4_ - (!!this._field.border ? 1 : 0);
         }
         else if(this._field.height + (!!this._field.border ? 1 : 0) > _loc4_)
         {
            if(this._autoSize != TextFieldAutoSize.NONE)
            {
               setRectangle(var_11.x,var_11.y,_loc5_ + _loc1_,Math.floor(this._field.height) + _loc2_);
               _loc7_ = true;
            }
         }
         this.var_493 = false;
         var_17.invalidate(this,var_11,WindowRedrawFlag.const_76);
         if(!_loc7_)
         {
            dispatchEvent(new WindowEvent(WindowEvent.const_45,this,null));
         }
      }
      
      public function set underline(param1:Boolean) : void
      {
         setUnderline(this,param1);
      }
      
      protected function parseVariableSet(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 != null)
         {
            _loc4_ = new Map();
            XMLVariableParser.parseVariableList(param1.children(),_loc4_);
            this.var_493 = true;
            for(_loc2_ in _loc4_)
            {
               _loc3_ = const_1089[_loc2_];
               if(_loc3_ != null)
               {
                  _loc3_(this,_loc4_[_loc2_]);
               }
            }
            this.var_493 = false;
         }
      }
      
      public function getLineOffset(param1:int) : int
      {
         return this._field.getLineOffset(param1);
      }
      
      public function set maxChars(param1:int) : void
      {
         setMaxChars(this,param1);
      }
      
      public function getParagraphLength(param1:int) : int
      {
         return this._field.getParagraphLength(param1);
      }
      
      override public function set caption(param1:String) : void
      {
         this.text = param1;
      }
      
      public function get textField() : TextField
      {
         return this._field;
      }
      
      public function set textBackgroundColor(param1:uint) : void
      {
         setTextBackgroundColor(this,param1);
      }
      
      public function getCharIndexAtPoint(param1:Number, param2:Number) : int
      {
         return this._field.getCharIndexAtPoint(param1,param2);
      }
      
      public function set fontSize(param1:uint) : void
      {
         setFontSize(this,param1);
      }
      
      public function get textBackgroundColor() : uint
      {
         return color;
      }
      
      public function getLineLength(param1:int) : int
      {
         return this._field.getLineLength(param1);
      }
   }
}
