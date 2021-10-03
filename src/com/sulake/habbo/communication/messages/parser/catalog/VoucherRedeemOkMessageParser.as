package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoucherRedeemOkMessageParser implements IMessageParser
   {
       
      
      private var var_831:String = "";
      
      private var var_1042:String = "";
      
      public function VoucherRedeemOkMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1042 = "";
         this.var_831 = "";
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_831;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1042 = param1.readString();
         this.var_831 = param1.readString();
         return true;
      }
      
      public function get productDescription() : String
      {
         return this.var_1042;
      }
   }
}
