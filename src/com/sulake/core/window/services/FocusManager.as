package com.sulake.core.window.services
{
   import com.sulake.core.window.components.IFocusWindow;
   import com.sulake.core.window.utils.ChildEntityArrayReader;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.FocusEvent;
   
   public class FocusManager extends ChildEntityArrayReader implements IFocusManagerService
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_199:Stage;
      
      public function FocusManager(param1:DisplayObject)
      {
         this.var_199 = param1.stage;
         this.var_199.addEventListener(Event.ACTIVATE,this.onActivateEvent);
         this.var_199.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusEvent);
         this.var_199.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,this.onFocusEvent);
         this.var_199.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,this.onFocusEvent);
         super();
      }
      
      private function onFocusEvent(param1:FocusEvent) : void
      {
         if(this.var_199.focus == null)
         {
            this.resolveNextFocusTarget();
         }
      }
      
      private function resolveNextFocusTarget() : IFocusWindow
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_-- != 0)
         {
            _loc2_ = var_30[_loc1_] as IFocusWindow;
            if(!_loc2_.disposed)
            {
               _loc2_.focus();
            }
            var_30.splice(_loc1_,1);
         }
         return _loc2_;
      }
      
      public function removeFocusWindow(param1:IFocusWindow) : void
      {
         var _loc2_:int = 0;
         if(param1 != null)
         {
            _loc2_ = var_30.indexOf(param1);
            if(_loc2_ > -1)
            {
               var_30.splice(_loc2_,1);
            }
         }
         if(this.var_199.focus == null)
         {
            this.resolveNextFocusTarget();
         }
      }
      
      private function onActivateEvent(param1:Event) : void
      {
         if(this.var_199.focus == null)
         {
            this.resolveNextFocusTarget();
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function registerFocusWindow(param1:IFocusWindow) : void
      {
         if(param1 != null)
         {
            if(var_30.indexOf(param1) == -1)
            {
               var_30.push(param1);
               if(this.var_199.focus == null)
               {
                  param1.focus();
               }
            }
         }
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_199.removeEventListener(Event.ACTIVATE,this.onActivateEvent);
            this.var_199.removeEventListener(FocusEvent.FOCUS_OUT,this.onFocusEvent);
            this.var_199.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE,this.onFocusEvent);
            this.var_199.removeEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,this.onFocusEvent);
            this.var_199 = null;
            this._disposed = true;
            var_30 = null;
         }
      }
   }
}
