package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2039:Number;
      
      private var var_791:Number = 0;
      
      private var var_2040:Number;
      
      private var var_790:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2039 = param1;
         this.var_2040 = param2;
      }
      
      public function update() : void
      {
         this.var_790 += this.var_2040;
         this.var_791 += this.var_790;
         if(this.var_791 > 0)
         {
            this.var_791 = 0;
            this.var_790 = this.var_2039 * -1 * this.var_790;
         }
      }
      
      public function reset(param1:int) : void
      {
         this.var_790 = param1;
         this.var_791 = 0;
      }
      
      public function get location() : Number
      {
         return this.var_791;
      }
   }
}
