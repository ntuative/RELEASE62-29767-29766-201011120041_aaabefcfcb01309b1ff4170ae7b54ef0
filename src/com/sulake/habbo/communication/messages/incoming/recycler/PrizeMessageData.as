package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeMessageData
   {
       
      
      private var var_1522:int;
      
      private var var_2090:String;
      
      public function PrizeMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2090 = param1.readString();
         this.var_1522 = param1.readInteger();
      }
      
      public function get productItemTypeId() : int
      {
         return this.var_1522;
      }
      
      public function get productItemType() : String
      {
         return this.var_2090;
      }
   }
}
