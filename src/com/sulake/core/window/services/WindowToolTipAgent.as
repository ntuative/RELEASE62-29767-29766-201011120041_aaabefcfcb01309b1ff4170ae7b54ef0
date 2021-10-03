package com.sulake.core.window.services
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IToolTipAgentService
   {
       
      
      protected var var_338:Timer;
      
      protected var var_1147:String;
      
      protected var var_1381:uint;
      
      protected var var_1148:Point;
      
      protected var var_248:IToolTipWindow;
      
      protected var var_1146:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         this.var_1148 = new Point();
         this.var_1146 = new Point(20,20);
         this.var_1381 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(this.var_338 != null)
         {
            this.var_338.stop();
            this.var_338.removeEventListener(TimerEvent.TIMER,this.showToolTip);
            this.var_338 = null;
         }
         this.hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,this.var_1148);
            if(this.var_248 != null && !this.var_248.disposed)
            {
               this.var_248.x = param1 + this.var_1146.x;
               this.var_248.y = param2 + this.var_1146.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(this.var_338 != null)
         {
            this.var_338.reset();
         }
         if(_window && true)
         {
            if(this.var_248 == null || this.var_248.disposed)
            {
               this.var_248 = _window.context.create("undefined::ToolTip",this.var_1147,WindowType.const_307,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            this.var_248.x = _loc2_.x + this.var_1148.x + this.var_1146.x;
            this.var_248.y = _loc2_.y + this.var_1148.y + this.var_1146.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               this.var_1147 = IInteractiveWindow(param1).toolTipCaption;
               this.var_1381 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               this.var_1147 = param1.caption;
               this.var_1381 = 500;
            }
            _mouse.x = var_127.mouseX;
            _mouse.y = var_127.mouseY;
            getMousePositionRelativeTo(param1,_mouse,this.var_1148);
            if(this.var_1147 != null && this.var_1147 != "")
            {
               if(this.var_338 == null)
               {
                  this.var_338 = new Timer(this.var_1381,1);
                  this.var_338.addEventListener(TimerEvent.TIMER,this.showToolTip);
               }
               this.var_338.reset();
               this.var_338.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(this.var_248 != null && !this.var_248.disposed)
         {
            this.var_248.destroy();
            this.var_248 = null;
         }
      }
   }
}
