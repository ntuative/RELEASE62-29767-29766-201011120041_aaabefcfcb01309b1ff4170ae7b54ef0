package com.sulake.habbo.widget.chatinput
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.messages.RoomWidgetChatMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetChatTypingMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   public class RoomChatInputView
   {
      
      private static const const_1493:int = 5;
      
      private static const const_537:int = 16;
      
      private static const const_1118:int = 20;
      
      private static const const_536:int = 10;
      
      private static const const_1119:int = 40;
       
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_970:String;
      
      private var _window:IWindowContainer;
      
      private var _chatModeIdSpeak:String;
      
      private var var_782:Boolean = false;
      
      private var var_416:Number = 600;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1998:String;
      
      private var var_2567:int = 0;
      
      private var var_1463:Boolean = false;
      
      private var var_423:String = "";
      
      private var var_781:Timer;
      
      private var var_969:Timer;
      
      private var _widget:RoomChatInputWidget;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_1997:Number = 0;
      
      public function RoomChatInputView(param1:RoomChatInputWidget, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager)
      {
         super();
         this._widget = param1;
         this._windowManager = param2;
         this._assetLibrary = param3;
         this._localization = param4;
         this.var_970 = this._localization.getKey("widgets.chatinput.mode.whisper",":tell");
         this.var_1998 = this._localization.getKey("widgets.chatinput.mode.shout",":shout");
         this._chatModeIdSpeak = this._localization.getKey("widgets.chatinput.mode.speak",":speak");
         this.var_781 = new Timer(1000,1);
         this.var_781.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTypingTimerComplete);
         this.var_969 = new Timer(5000,1);
         this.var_969.addEventListener(TimerEvent.TIMER_COMPLETE,this.onIdleTimerComplete);
         this.createWindow();
         this.refreshView();
      }
      
      public function hideView() : void
      {
         if(this._window != null)
         {
            this._window.dispose();
         }
         this._window = null;
      }
      
      private function onInputChanged(param1:WindowEvent) : void
      {
         var _loc2_:ITextFieldWindow = param1.window as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         this.var_969.reset();
         var _loc3_:* = _loc2_.text.length == 0;
         if(_loc3_)
         {
            this.var_782 = false;
            this.var_781.start();
         }
         else
         {
            if(!this._widget.allowPaste && _loc2_.text.length > this.var_423.length + 1)
            {
               _loc2_.text = "";
            }
            this.var_423 = _loc2_.text;
            if(!this.var_782)
            {
               this.var_782 = true;
               this.var_781.reset();
               this.var_781.start();
            }
            this.var_969.start();
         }
      }
      
      private function onIdleTimerComplete(param1:TimerEvent) : void
      {
         this.var_782 = false;
         this.sendTypingMessage();
      }
      
      private function createWindow() : void
      {
         if(this._window != null)
         {
            this.refreshView();
            return;
         }
         var _loc2_:XmlAsset = this._assetLibrary.getAssetByName("chatinput_window") as XmlAsset;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.content == null)
         {
            return;
         }
         this._window = this._windowManager.createWindow("chatinput_widget_window","",HabboWindowType.const_57,HabboWindowStyle.const_36,0 | 0,new Rectangle(300,400,400,30),null) as IWindowContainer;
         this._window.buildFromXML(_loc2_.content as XML);
         this._window.tags.push("room_widget_chatinput");
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName("left") as IBitmapWrapperWindow;
         var _loc4_:ITextFieldWindow = this._window.findChildByName("chat_input") as ITextFieldWindow;
         var _loc5_:IBitmapWrapperWindow = this._window.findChildByName("middle") as IBitmapWrapperWindow;
         var _loc6_:IBitmapWrapperWindow = this._window.findChildByName("right") as IBitmapWrapperWindow;
         this.addEventListenerToChild(_loc3_);
         this.addEventListenerToChild(_loc4_);
         this.addEventListenerToChild(_loc5_);
         this.addEventListenerToChild(_loc6_);
         _loc4_.addEventListener(WindowKeyboardEvent.const_141,this.windowKeyEventProcessor);
         _loc4_.addEventListener(WindowEvent.const_45,this.onInputFieldResized);
         _loc4_.addEventListener(WindowEvent.const_102,this.onInputChanged);
         this._window.addEventListener(WindowEvent.const_312,this.onWindowMoved);
         this.var_1463 = true;
         this.var_423 = "";
      }
      
      private function onTypingTimerComplete(param1:TimerEvent) : void
      {
         this.sendTypingMessage();
      }
      
      private function windowMouseEventProcessor(param1:Event = null, param2:IWindow = null) : void
      {
         this.setInputFieldFocus();
      }
      
      public function dispose() : void
      {
         if(this._window != null)
         {
            this._window.dispose();
         }
         this._window = null;
         this._widget = null;
         this._windowManager = null;
         this._assetLibrary = null;
         this.var_781 = null;
         this.var_969 = null;
      }
      
      private function setInputFieldFocus() : void
      {
         var _loc1_:ITextFieldWindow = this._window.findChildByName("chat_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         if(this.var_1463)
         {
            _loc1_.text = "";
            _loc1_.textColor = 0;
            this.var_1463 = false;
            this.var_423 = "";
         }
         _loc1_.focus();
      }
      
      private function refreshView() : void
      {
         var _loc15_:* = null;
         var _loc16_:* = null;
         if(this._window == null)
         {
            return;
         }
         var _loc1_:BitmapDataAsset = this._assetLibrary.getAssetByName("chatinput_bubble_left") as BitmapDataAsset;
         var _loc2_:BitmapData = (_loc1_.content as BitmapData).clone();
         var _loc3_:BitmapDataAsset = this._assetLibrary.getAssetByName("chatinput_bubble_middle") as BitmapDataAsset;
         var _loc4_:BitmapData = (_loc3_.content as BitmapData).clone();
         var _loc5_:BitmapDataAsset = this._assetLibrary.getAssetByName("chatinput_bubble_right") as BitmapDataAsset;
         var _loc6_:BitmapData = (_loc5_.content as BitmapData).clone();
         var _loc7_:IBitmapWrapperWindow = this._window.findChildByName("left") as IBitmapWrapperWindow;
         var _loc8_:ITextFieldWindow = this._window.findChildByName("chat_input") as ITextFieldWindow;
         var _loc9_:IBitmapWrapperWindow = this._window.findChildByName("middle") as IBitmapWrapperWindow;
         var _loc10_:IBitmapWrapperWindow = this._window.findChildByName("right") as IBitmapWrapperWindow;
         var _loc11_:Number = _loc2_.height;
         var _loc12_:* = 0;
         var _loc13_:* = 0;
         this.var_1997 = _loc2_.width + const_537 + _loc6_.width + const_1118;
         if(_loc7_ != null)
         {
            _loc12_ = Number(_loc7_.width);
            _loc7_.bitmap = _loc2_;
         }
         if(_loc8_ != null)
         {
            _loc13_ = Number(Math.max(const_1119,_loc8_.width) + const_537);
            _loc8_.x = _loc12_;
            _loc8_.background = false;
            _loc8_.invalidate();
         }
         if(_loc9_ != null)
         {
            _loc9_.width = _loc13_;
            _loc12_ += _loc13_;
            _loc15_ = new Matrix();
            _loc15_.scale(_loc9_.width / _loc4_.width,1);
            _loc16_ = new BitmapData(_loc9_.width,_loc9_.height,true);
            _loc16_.draw(_loc4_,_loc15_);
            _loc9_.bitmap = new BitmapData(_loc9_.width,_loc4_.height,false);
            _loc9_.bitmap.copyPixels(_loc16_,_loc16_.rect,new Point(0,0));
         }
         if(_loc10_ != null)
         {
            _loc10_.bitmap = _loc6_;
            _loc10_.x = _loc12_;
            _loc12_ += _loc10_.width;
         }
         this._window.width = _loc12_;
         this._window.height = _loc11_;
         var _loc14_:IWindow = this._window.getChildByName("bubblecont");
         if(_loc14_ != null)
         {
            _loc14_.width = _loc12_;
            _loc14_.height = _loc11_;
         }
      }
      
      private function onInputFieldResized(param1:WindowEvent) : void
      {
         this.checkInputFieldLimits();
         this.refreshView();
      }
      
      private function setInputFieldUnFocus() : void
      {
         var _loc1_:ITextFieldWindow = this._window.findChildByName("chat_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.unfocus();
      }
      
      private function checkInputFieldLimits() : void
      {
         var _loc1_:ITextFieldWindow = this._window.findChildByName("chat_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc1_.textWidth >= this.var_416)
         {
            if(_loc1_.autoSize != TextFieldAutoSize.NONE)
            {
               _loc1_.autoSize = TextFieldAutoSize.NONE;
            }
         }
         else if(_loc1_.autoSize != TextFieldAutoSize.LEFT)
         {
            _loc1_.autoSize = TextFieldAutoSize.LEFT;
         }
      }
      
      public function hideFloodBlocking() : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc1_:ITextFieldWindow = this._window.findChildByName("chat_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.enable();
         _loc1_.selectable = true;
         _loc1_.text = "";
         this.var_423 = "";
         this.setInputFieldFocus();
         this.checkInputFieldLimits();
      }
      
      private function anotherFieldHasFocus() : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:ITextFieldWindow = this._window.findChildByName("chat_input") as ITextFieldWindow;
         if(_loc1_ != null)
         {
            if(_loc1_.focused)
            {
               return false;
            }
         }
         var _loc2_:DisplayObject = this._window.context.getDesktopWindow().getDisplayObject();
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.stage;
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.focus;
               if(_loc4_ == null)
               {
                  return false;
               }
               if(_loc4_ is TextField)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      private function checkSpecialKeywordForInput() : void
      {
         var _loc1_:ITextFieldWindow = this._window.findChildByName("chat_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc1_.text == "")
         {
            return;
         }
         var _loc2_:String = _loc1_.text;
         var _loc3_:String = this._widget.selectedUserName;
         if(_loc2_ == this.var_970)
         {
            if(_loc3_.length > 0)
            {
               _loc1_.text += " " + this._widget.selectedUserName;
               _loc1_.setSelection(_loc1_.text.length,_loc1_.text.length);
               this.var_423 = _loc1_.text;
            }
         }
      }
      
      private function sendChatFromInputField(param1:int) : void
      {
         var _loc2_:ITextFieldWindow = this._window.findChildByName("chat_input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.text == "")
         {
            return;
         }
         var _loc3_:String = _loc2_.text;
         var _loc4_:Array = _loc3_.split(" ");
         var _loc5_:String = "";
         var _loc6_:* = "";
         switch(_loc4_[0])
         {
            case this.var_970:
               param1 = 0;
               _loc5_ = _loc4_[1];
               _loc6_ = this.var_970 + " " + _loc5_ + " ";
               _loc4_.shift();
               _loc4_.shift();
               break;
            case this.var_1998:
               param1 = 0;
               _loc4_.shift();
               break;
            case this._chatModeIdSpeak:
               param1 = 0;
               _loc4_.shift();
         }
         _loc3_ = _loc4_.join(" ");
         if(this._widget != null)
         {
            this._widget.sendChat(_loc3_,param1,_loc5_);
            this.var_782 = false;
            this.sendTypingMessage();
         }
         _loc2_.text = _loc6_;
         this.var_423 = _loc6_;
         this.refreshView();
      }
      
      private function windowKeyEventProcessor(param1:Event = null, param2:IWindow = null) : void
      {
         var _loc4_:* = 0;
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(this._window == null || this._widget == null || this._widget.floodBlocked)
         {
            return;
         }
         if(this.anotherFieldHasFocus())
         {
            return;
         }
         var _loc3_:int = this.var_2567;
         this.setInputFieldFocus();
         if(param1 is WindowKeyboardEvent)
         {
            _loc6_ = param1 as WindowKeyboardEvent;
            _loc4_ = uint(_loc6_.charCode);
            _loc5_ = _loc6_.shiftKey;
         }
         if(param1 is KeyboardEvent)
         {
            _loc7_ = param1 as KeyboardEvent;
            _loc4_ = uint(_loc7_.charCode);
            _loc5_ = _loc7_.shiftKey;
         }
         if(_loc7_ == null && _loc6_ == null)
         {
            return;
         }
         if(_loc5_)
         {
            _loc3_ = 0;
         }
         if(_loc4_ == Keyboard.SPACE)
         {
            this.checkSpecialKeywordForInput();
         }
         if(_loc4_ == Keyboard.ENTER)
         {
            this.sendChatFromInputField(_loc3_);
         }
         if(_loc4_ == Keyboard.BACKSPACE)
         {
            _loc8_ = this._window.findChildByName("chat_input") as ITextFieldWindow;
            if(_loc8_ != null)
            {
               _loc9_ = _loc8_.text;
               _loc10_ = _loc9_.split(" ");
               if(_loc10_[0] == this.var_970 && _loc10_.length == 3 && _loc10_[2] == "")
               {
                  _loc8_.text = "";
                  this.var_423 = "";
               }
            }
         }
         this.checkInputFieldLimits();
      }
      
      public function setMaxWidth(param1:Number) : void
      {
         this.var_416 = param1 - this.var_1997;
         var _loc2_:ITextFieldWindow = this._window.findChildByName("chat_input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Number = _loc2_.width;
         if(int(_loc2_.textWidth) > _loc2_.width)
         {
            _loc3_ = Math.min(int(_loc2_.textWidth),this.var_416);
         }
         else
         {
            _loc3_ = Math.min(_loc3_,this.var_416);
         }
         if(_loc3_ != _loc2_.width)
         {
            _loc2_.width = _loc3_;
         }
         this.checkInputFieldLimits();
         this.refreshView();
      }
      
      private function onWindowMoved(param1:WindowEvent) : void
      {
         if(this._window == null)
         {
            return;
         }
         this.setMaxWidth(this._window.context.getDesktopWindow().width - this._window.x);
      }
      
      private function addEventListenerToChild(param1:IWindow) : void
      {
         if(param1 != null)
         {
            param1.setParamFlag(HabboWindowParam.const_38,true);
            param1.addEventListener(WindowMouseEvent.const_39,this.windowMouseEventProcessor);
         }
      }
      
      public function showFloodBlocking(param1:int) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc2_:ITextFieldWindow = this._window.findChildByName("chat_input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.disable();
         _loc2_.selectable = false;
         this._localization.registerParameter("chat.input.alert.flood","time",param1.toString());
         var _loc3_:ILocalization = this._localization.getLocalization("chat.input.alert.flood");
         var _loc4_:String = "";
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.value;
         }
         _loc2_.text = _loc4_;
         this.setInputFieldUnFocus();
         this.refreshView();
      }
      
      private function sendTypingMessage() : void
      {
         if(this._widget == null)
         {
            return;
         }
         if(this._widget.floodBlocked)
         {
            return;
         }
         var _loc1_:RoomWidgetChatTypingMessage = new RoomWidgetChatTypingMessage(this.var_782);
         this._widget.messageListener.processWidgetMessage(_loc1_);
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function displaySpecialChatMessage(param1:String, param2:String = "") : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc3_:ITextFieldWindow = this._window.findChildByName("chat_input") as ITextFieldWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.enable();
         _loc3_.selectable = true;
         _loc3_.text = "";
         this.setInputFieldFocus();
         _loc3_.text += param1 + " ";
         if(param2.length > 0)
         {
            _loc3_.text += param2 + " ";
         }
         _loc3_.setSelection(_loc3_.text.length,_loc3_.text.length);
         this.var_423 = _loc3_.text;
         this.checkInputFieldLimits();
      }
   }
}
