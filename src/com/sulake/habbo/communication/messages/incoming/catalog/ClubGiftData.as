package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_2165:Boolean;
      
      private var var_2164:int;
      
      private var _offerId:int;
      
      private var var_1968:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_2165 = param1.readBoolean();
         this.var_2164 = param1.readInteger();
         this.var_1968 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_1968;
      }
      
      public function get isVip() : Boolean
      {
         return this.var_2165;
      }
      
      public function get daysRequired() : int
      {
         return this.var_2164;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
   }
}
