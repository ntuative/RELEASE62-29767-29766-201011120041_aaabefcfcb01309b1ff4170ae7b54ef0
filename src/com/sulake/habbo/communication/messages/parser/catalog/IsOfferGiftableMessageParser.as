package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class IsOfferGiftableMessageParser implements IMessageParser
   {
       
      
      private var var_2508:Boolean;
      
      private var _offerId:int;
      
      public function IsOfferGiftableMessageParser()
      {
         super();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._offerId = param1.readInteger();
         this.var_2508 = param1.readBoolean();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get isGiftable() : Boolean
      {
         return this.var_2508;
      }
   }
}
