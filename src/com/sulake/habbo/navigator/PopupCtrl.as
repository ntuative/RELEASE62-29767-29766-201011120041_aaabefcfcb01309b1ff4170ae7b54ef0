package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class PopupCtrl
   {
       
      
      private var var_378:Timer;
      
      private var _navigator:HabboNavigator;
      
      private var _popupIndentLeft:int;
      
      private var var_1926:int;
      
      private var var_320:Timer;
      
      private var var_1185:String;
      
      private var var_47:IWindowContainer;
      
      public function PopupCtrl(param1:HabboNavigator, param2:int, param3:int, param4:String)
      {
         this.var_378 = new Timer(500,1);
         this.var_320 = new Timer(100,1);
         super();
         this._navigator = param1;
         this.var_1185 = param4;
         this.var_1926 = param2;
         this._popupIndentLeft = param3;
         this.var_378.addEventListener(TimerEvent.TIMER,this.onDisplayTimer);
         this.var_320.addEventListener(TimerEvent.TIMER,this.onHideTimer);
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         if(this.var_47 != null)
         {
            this.var_47.visible = false;
         }
      }
      
      public function hideInstantly() : void
      {
         if(this.var_47 != null)
         {
            this.var_47.visible = false;
         }
         this.var_378.reset();
         this.var_320.reset();
      }
      
      private function onPopup(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 as WindowMouseEvent == null)
         {
            return;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            this.var_320.reset();
         }
         else if(param1.type == WindowMouseEvent.const_26)
         {
            if(!Util.containsMouse(this.var_47))
            {
               this.closePopup();
            }
         }
      }
      
      public function closePopup() : void
      {
         this.var_320.reset();
         this.var_378.reset();
         this.var_320.start();
      }
      
      public function get navigator() : HabboNavigator
      {
         return this._navigator;
      }
      
      public function refreshContent(param1:IWindowContainer) : void
      {
      }
      
      public function dispose() : void
      {
         this._navigator = null;
         if(this.var_378)
         {
            this.var_378.removeEventListener(TimerEvent.TIMER,this.onDisplayTimer);
            this.var_378.reset();
            this.var_378 = null;
         }
         if(this.var_320)
         {
            this.var_320.removeEventListener(TimerEvent.TIMER,this.onHideTimer);
            this.var_320.reset();
            this.var_320 = null;
         }
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.var_47.visible = true;
         this.var_47.activate();
      }
      
      public function showPopup(param1:IWindow) : void
      {
         if(this.var_47 == null)
         {
            this.var_47 = IWindowContainer(this._navigator.getXmlWindow(this.var_1185));
            this.var_47.visible = false;
            this.var_47.setParamFlag(HabboWindowParam.const_38,true);
            this.var_47.procedure = this.onPopup;
         }
         Util.hideChildren(this.var_47);
         this.refreshContent(this.var_47);
         this.var_47.height = Util.getLowestPoint(this.var_47) + 5;
         var _loc2_:Point = new Point();
         param1.getGlobalPosition(_loc2_);
         this.var_47.x = _loc2_.x + this.var_1926 + param1.width;
         this.var_47.y = _loc2_.y - this.var_47.height * 0.5 + param1.height * 0.5;
         var _loc3_:Point = new Point();
         this.var_47.getGlobalPosition(_loc3_);
         if(_loc3_.x + this.var_47.width > this.var_47.desktop.width)
         {
            this.var_47.x = -this.var_47.width + _loc2_.x + this._popupIndentLeft;
            this.refreshPopupArrows(this.var_47,false);
         }
         else
         {
            this.refreshPopupArrows(this.var_47,true);
         }
         if(!this.var_47.visible)
         {
            this.var_378.reset();
            this.var_378.start();
         }
         this.var_320.reset();
         this.var_47.activate();
      }
      
      public function get visible() : Boolean
      {
         return this.var_47 != null && this.var_47.visible;
      }
      
      private function refreshPopupArrow(param1:IWindowContainer, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:String = "popup_arrow_" + (!!param2 ? "left" : "right");
         var _loc5_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName(_loc4_));
         if(!param3)
         {
            if(_loc5_ != null)
            {
               _loc5_.visible = false;
            }
         }
         else
         {
            if(_loc5_ == null)
            {
               _loc5_ = this._navigator.getButton(_loc4_,_loc4_,null);
               _loc5_.setParamFlag(HabboWindowParam.const_60,false);
               param1.addChild(_loc5_);
            }
            _loc5_.visible = true;
            _loc5_.y = param1.height * 0.5 - _loc5_.height * 0.5;
            _loc5_.x = !!param2 ? int(1 - _loc5_.width) : int(param1.width - 1);
         }
      }
      
      private function refreshPopupArrows(param1:IWindowContainer, param2:Boolean) : void
      {
         this.refreshPopupArrow(param1,true,param2);
         this.refreshPopupArrow(param1,false,!param2);
      }
   }
}
