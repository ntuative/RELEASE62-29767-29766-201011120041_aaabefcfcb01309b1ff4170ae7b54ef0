package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1938:int = 0;
      
      private var var_1433:int = 0;
      
      private var var_1936:Boolean = false;
      
      private var var_1940:int = 0;
      
      private var var_1939:int = 0;
      
      private var var_1434:int = 0;
      
      private var var_1937:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubDays() : int
      {
         return this.var_1433;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1433 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_1936 = param1;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_1937 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1433 > 0 || this.var_1434 > 0;
      }
      
      public function get credits() : int
      {
         return this.var_1940;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_1939 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1434;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_1936;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_1937;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_1939;
      }
      
      public function set pixels(param1:int) : void
      {
         this.var_1938 = param1;
      }
      
      public function get pixels() : int
      {
         return this.var_1938;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1434 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_1940 = param1;
      }
   }
}
