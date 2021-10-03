package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_645:Array;
      
      private var var_1437:int;
      
      private var var_1489:Array;
      
      private var var_644:Array;
      
      private var var_1367:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1367 = _loc2_.isWrappingEnabled;
         this.var_1437 = _loc2_.wrappingPrice;
         this.var_1489 = _loc2_.stuffTypes;
         this.var_644 = _loc2_.boxTypes;
         this.var_645 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_645;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1489;
      }
      
      public function get price() : int
      {
         return this.var_1437;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_644;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1367;
      }
   }
}
