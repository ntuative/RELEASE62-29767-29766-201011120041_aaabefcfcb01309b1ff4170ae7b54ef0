package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class GenericEventQueue implements IEventQueue, IDisposable
   {
       
      
      protected var _disposed:Boolean = false;
      
      protected var _index:uint = 0;
      
      protected var var_210:IEventDispatcher;
      
      protected var var_397:Array;
      
      public function GenericEventQueue(param1:IEventDispatcher)
      {
         super();
         this.var_397 = new Array();
         this.var_210 = param1;
      }
      
      protected function eventListener(param1:Event) : void
      {
         this.var_397.push(param1);
      }
      
      public function remove() : void
      {
         this.var_397.splice(this._index - 1,1);
         if(this._index > 0)
         {
            --this._index;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function begin() : void
      {
         this._index = 0;
      }
      
      public function end() : void
      {
         this._index = 0;
      }
      
      public function get length() : uint
      {
         return this.var_397.length;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_210 = null;
            this.var_397 = [];
            this._disposed = true;
         }
      }
      
      public function flush() : void
      {
         this.var_397.splice(0,this.var_397.length);
         this._index = 0;
      }
      
      public function next() : Event
      {
         var _loc1_:* = null;
         if(this._index < this.var_397.length)
         {
            _loc1_ = this.var_397[this._index];
            ++this._index;
         }
         return _loc1_;
      }
   }
}
