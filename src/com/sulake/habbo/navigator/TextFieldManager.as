package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var var_2029:Boolean;
      
      private var var_1507:int;
      
      private var var_2030:String = "";
      
      private var var_66:ITextFieldWindow;
      
      private var var_2028:uint;
      
      private var _orgTextBackgroundColor:uint;
      
      private var _navigator:HabboNavigator;
      
      private var var_1218:String = "";
      
      private var var_114:IWindowContainer;
      
      private var var_534:Boolean;
      
      private var var_1506:Function;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         this._navigator = param1;
         this.var_66 = param2;
         this.var_1507 = param3;
         this.var_1506 = param4;
         if(param5 != null)
         {
            this.var_534 = true;
            this.var_1218 = param5;
            this.var_66.text = param5;
         }
         Util.setProcDirectly(this.var_66,this.onInputClick);
         this.var_66.addEventListener(WindowKeyboardEvent.const_141,this.checkEnterPress);
         this.var_66.addEventListener(WindowEvent.const_102,this.checkMaxLen);
         this.var_2029 = this.var_66.textBackground;
         this._orgTextBackgroundColor = this.var_66.textBackgroundColor;
         this.var_2028 = this.var_66.textColor;
      }
      
      private function checkEnterPress(param1:Event) : void
      {
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = WindowKeyboardEvent(param1);
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            if(this.var_1506 != null)
            {
               this.var_1506();
            }
         }
      }
      
      public function goBackToInitialState() : void
      {
         this.clearErrors();
         if(this.var_1218 != null)
         {
            this.var_66.text = this.var_1218;
            this.var_534 = true;
         }
         else
         {
            this.var_66.text = "";
            this.var_534 = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return this.var_66;
      }
      
      public function restoreBackground() : void
      {
         this.var_66.textBackground = this.var_2029;
         this.var_66.textBackgroundColor = this._orgTextBackgroundColor;
         this.var_66.textColor = this.var_2028;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_295)
         {
            return;
         }
         if(!this.var_534)
         {
            return;
         }
         this.var_66.text = this.var_2030;
         this.var_534 = false;
         this.restoreBackground();
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_114 != null)
         {
            this.var_114.visible = false;
         }
      }
      
      public function displayError(param1:String) : void
      {
         this.var_66.textBackground = true;
         this.var_66.textBackgroundColor = 4294021019;
         this.var_66.textColor = 4278190080;
         if(this.var_114 == null)
         {
            this.var_114 = IWindowContainer(this._navigator.getXmlWindow("nav_error_popup"));
            this._navigator.refreshButton(this.var_114,"popup_arrow_down",true,null,0);
            IWindowContainer(this.var_66.parent).addChild(this.var_114);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_114.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         this.var_114.findChildByName("border").width = _loc2_.width + 15;
         this.var_114.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         this.var_66.getLocalPosition(_loc3_);
         this.var_114.x = _loc3_.x;
         this.var_114.y = _loc3_.y - this.var_114.height + 3;
         var _loc4_:IWindow = this.var_114.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_114.width / 2 - _loc4_.width / 2;
         this.var_114.x += (this.var_66.width - this.var_114.width) / 2;
         this.var_114.visible = true;
      }
      
      public function getText() : String
      {
         if(this.var_534)
         {
            return this.var_2030;
         }
         return this.var_66.text;
      }
      
      private function isInputValid() : Boolean
      {
         return !this.var_534 && Util.trim(this.getText()).length > 2;
      }
      
      public function setText(param1:String) : void
      {
         this.var_534 = false;
         this.var_66.text = param1;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!this.isInputValid())
         {
            this.displayError(param1);
            return false;
         }
         this.restoreBackground();
         return true;
      }
      
      private function checkMaxLen(param1:Event) : void
      {
         var _loc2_:String = this.var_66.text;
         if(_loc2_.length > this.var_1507)
         {
            this.var_66.text = _loc2_.substring(0,this.var_1507);
         }
      }
   }
}
