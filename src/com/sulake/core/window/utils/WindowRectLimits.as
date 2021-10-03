package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_417:int = -2.147483648E9;
      
      private var var_416:int = 2.147483647E9;
      
      private var var_418:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      private var var_419:int = -2.147483648E9;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         this._target = param1;
      }
      
      public function get maxWidth() : int
      {
         return this.var_416;
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_419 == int.MIN_VALUE && this.var_416 == int.MAX_VALUE && this.var_417 == int.MIN_VALUE && this.var_418 == int.MAX_VALUE;
      }
      
      public function set maxWidth(param1:int) : void
      {
         this.var_416 = param1;
         if(this.var_416 < int.MAX_VALUE && !this._target.disposed && this._target.width > this.var_416)
         {
            this._target.width = this.var_416;
         }
      }
      
      public function setEmpty() : void
      {
         this.var_419 = int.MIN_VALUE;
         this.var_416 = int.MAX_VALUE;
         this.var_417 = int.MIN_VALUE;
         this.var_418 = int.MAX_VALUE;
      }
      
      public function set maxHeight(param1:int) : void
      {
         this.var_418 = param1;
         if(this.var_418 < int.MAX_VALUE && !this._target.disposed && this._target.height > this.var_418)
         {
            this._target.height = this.var_418;
         }
      }
      
      public function get minHeight() : int
      {
         return this.var_417;
      }
      
      public function get minWidth() : int
      {
         return this.var_419;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_419 = this.var_419;
         _loc2_.var_416 = this.var_416;
         _loc2_.var_417 = this.var_417;
         _loc2_.var_418 = this.var_418;
         return _loc2_;
      }
      
      public function set minWidth(param1:int) : void
      {
         this.var_419 = param1;
         if(this.var_419 > int.MIN_VALUE && !this._target.disposed && this._target.width < this.var_419)
         {
            this._target.width = this.var_419;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         this.var_417 = param1;
         if(this.var_417 > int.MIN_VALUE && !this._target.disposed && this._target.height < this.var_417)
         {
            this._target.height = this.var_417;
         }
      }
      
      public function get maxHeight() : int
      {
         return this.var_418;
      }
   }
}
