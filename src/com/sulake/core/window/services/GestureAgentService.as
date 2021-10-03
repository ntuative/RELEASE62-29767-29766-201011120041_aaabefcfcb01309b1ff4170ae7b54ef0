package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.events.WindowEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GestureAgentService implements IGestureAgentService, IDisposable
   {
       
      
      protected var var_1132:int;
      
      private var _disposed:Boolean = false;
      
      protected var var_170:Timer;
      
      protected var var_1377:uint = 0;
      
      protected var _window:IWindow;
      
      protected var var_250:Function;
      
      protected var _working:Boolean;
      
      protected var var_1133:int;
      
      public function GestureAgentService()
      {
         super();
      }
      
      private function clientWindowDestroyed(param1:WindowEvent) : void
      {
         this.end(this._window);
      }
      
      protected function operate(param1:TimerEvent) : void
      {
         this.var_1133 *= 0.75;
         this.var_1132 *= 0.75;
         if(Math.abs(this.var_1133) <= 1 && Math.abs(this.var_1132) <= 1)
         {
            this.end(this._window);
         }
         else if(this.var_250 != null)
         {
            this.var_250(this.var_1133,this.var_1132);
         }
      }
      
      public function end(param1:IWindow) : IWindow
      {
         var _loc2_:IWindow = this._window;
         if(this.var_170)
         {
            this.var_170.stop();
            this.var_170.removeEventListener(TimerEvent.TIMER,this.operate);
            this.var_170 = null;
         }
         if(this._working)
         {
            if(this._window == param1)
            {
               if(!this._window.disposed)
               {
                  this._window.removeEventListener(WindowEvent.const_276,this.clientWindowDestroyed);
               }
               this._window = null;
               this._working = false;
            }
         }
         return _loc2_;
      }
      
      public function dispose() : void
      {
         this.end(this._window);
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function begin(param1:IWindow, param2:Function, param3:uint, param4:int, param5:int) : IWindow
      {
         this.var_1377 = param3;
         var _loc6_:IWindow = this._window;
         if(this._window != null)
         {
            this.end(this._window);
         }
         if(param1 && !param1.disposed)
         {
            this._window = param1;
            this._window.addEventListener(WindowEvent.const_276,this.clientWindowDestroyed);
            this.var_250 = param2;
            this._working = true;
            this.var_1133 = param4;
            this.var_1132 = param5;
            this.var_170 = new Timer(40,0);
            this.var_170.addEventListener(TimerEvent.TIMER,this.operate);
            this.var_170.start();
         }
         return _loc6_;
      }
   }
}
