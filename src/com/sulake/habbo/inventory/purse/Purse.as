package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2363:Boolean = false;
      
      private var var_2364:int = 0;
      
      private var var_1433:int = 0;
      
      private var var_2365:int = 0;
      
      private var var_1936:Boolean = false;
      
      private var var_1481:int = 0;
      
      private var var_1434:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         this.var_1481 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2364;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2363;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2363 = param1;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_1936;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2364 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1433 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return this.var_1481;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_1936 = param1;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         this.var_2365 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return this.var_1433;
      }
      
      public function get pixelBalance() : int
      {
         return this.var_2365;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1434 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1434;
      }
   }
}
