package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1538:Array;
      
      private var var_1950:int;
      
      private var var_2133:int;
      
      private var var_2134:int;
      
      private var var_2135:int;
      
      private var _dayOffsets:Array;
      
      private var var_2136:int;
      
      private var var_1537:Array;
      
      public function MarketplaceItemStatsParser()
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
      
      public function get furniTypeId() : int
      {
         return this.var_2133;
      }
      
      public function get historyLength() : int
      {
         return this.var_2135;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2134;
      }
      
      public function get offerCount() : int
      {
         return this.var_2136;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1537;
      }
      
      public function get averagePrice() : int
      {
         return this.var_1950;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1950 = param1.readInteger();
         this.var_2136 = param1.readInteger();
         this.var_2135 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1538 = [];
         this.var_1537 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1538.push(param1.readInteger());
            this.var_1537.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2134 = param1.readInteger();
         this.var_2133 = param1.readInteger();
         return true;
      }
   }
}
