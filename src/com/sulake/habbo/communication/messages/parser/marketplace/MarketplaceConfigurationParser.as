package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1847:int;
      
      private var var_1389:int;
      
      private var var_1842:int;
      
      private var var_1843:int;
      
      private var var_1846:int;
      
      private var var_1388:int;
      
      private var var_1845:int;
      
      private var var_1367:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_1847;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1389;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_1845;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_1843;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return this.var_1846;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1388;
      }
      
      public function get commission() : int
      {
         return this.var_1842;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1367 = param1.readBoolean();
         this.var_1842 = param1.readInteger();
         this.var_1389 = param1.readInteger();
         this.var_1388 = param1.readInteger();
         this.var_1843 = param1.readInteger();
         this.var_1847 = param1.readInteger();
         this.var_1846 = param1.readInteger();
         this.var_1845 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1367;
      }
   }
}
