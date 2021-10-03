package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_2282:int;
      
      private var var_1251:int;
      
      private var var_666:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1251 = param1.readInteger();
         this.var_2282 = param1.readInteger();
         this.var_666 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_666.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get probabilityDenominator() : int
      {
         return this.var_2282;
      }
      
      public function get prizes() : Array
      {
         return this.var_666;
      }
      
      public function get prizeLevelId() : int
      {
         return this.var_1251;
      }
   }
}
