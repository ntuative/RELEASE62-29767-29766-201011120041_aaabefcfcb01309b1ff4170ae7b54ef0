package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   
   public class TextMargins implements IMargins, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_1008:int;
      
      private var _right:int;
      
      private var var_1010:int;
      
      private var var_1009:int;
      
      private var var_250:Function;
      
      public function TextMargins(param1:int, param2:int, param3:int, param4:int, param5:Function)
      {
         super();
         this.var_1010 = param1;
         this.var_1009 = param2;
         this._right = param3;
         this.var_1008 = param4;
         this.var_250 = param5 != null ? param5 : this.nullCallback;
      }
      
      public function set bottom(param1:int) : void
      {
         this.var_1008 = param1;
         this.var_250(this);
      }
      
      public function get left() : int
      {
         return this.var_1010;
      }
      
      public function get isZeroes() : Boolean
      {
         return this.var_1010 == 0 && this._right == 0 && this.var_1009 == 0 && this.var_1008 == 0;
      }
      
      public function get right() : int
      {
         return this._right;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function set top(param1:int) : void
      {
         this.var_1009 = param1;
         this.var_250(this);
      }
      
      public function get top() : int
      {
         return this.var_1009;
      }
      
      public function set left(param1:int) : void
      {
         this.var_1010 = param1;
         this.var_250(this);
      }
      
      public function get bottom() : int
      {
         return this.var_1008;
      }
      
      public function clone(param1:Function) : TextMargins
      {
         return new TextMargins(this.var_1010,this.var_1009,this._right,this.var_1008,param1);
      }
      
      public function dispose() : void
      {
         this.var_250 = null;
         this._disposed = true;
      }
      
      public function set right(param1:int) : void
      {
         this._right = param1;
         this.var_250(this);
      }
      
      private function nullCallback(param1:IMargins) : void
      {
      }
   }
}
