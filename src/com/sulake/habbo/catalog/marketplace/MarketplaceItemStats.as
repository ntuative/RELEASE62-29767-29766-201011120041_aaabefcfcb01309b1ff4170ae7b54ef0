package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1538:Array;
      
      private var var_1950:int;
      
      private var var_2133:int;
      
      private var var_2135:int;
      
      private var var_2134:int;
      
      private var _dayOffsets:Array;
      
      private var var_2136:int;
      
      private var var_1537:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get method_2() : Array
      {
         return this.var_1538;
      }
      
      public function set method_2(param1:Array) : void
      {
         this.var_1538 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2133;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1537 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         this.var_1950 = param1;
      }
      
      public function get historyLength() : int
      {
         return this.var_2135;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2134;
      }
      
      public function get offerCount() : int
      {
         return this.var_2136;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2136 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1537;
      }
      
      public function get averagePrice() : int
      {
         return this.var_1950;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2134 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2135 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2133 = param1;
      }
   }
}
