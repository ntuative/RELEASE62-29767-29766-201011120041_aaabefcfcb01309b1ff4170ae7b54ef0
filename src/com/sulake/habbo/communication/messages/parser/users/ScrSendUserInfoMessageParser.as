package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1226:int = 2;
      
      public static const const_1618:int = 1;
       
      
      private var var_2393:int;
      
      private var var_2392:int;
      
      private var var_2386:int;
      
      private var var_1936:Boolean;
      
      private var var_2389:int;
      
      private var var_831:String;
      
      private var var_2387:Boolean;
      
      private var var_1939:int;
      
      private var var_2390:int;
      
      private var var_2391:int;
      
      private var var_2388:Boolean;
      
      private var var_1937:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_831 = param1.readString();
         this.var_2392 = param1.readInteger();
         this.var_2389 = param1.readInteger();
         this.var_2391 = param1.readInteger();
         this.var_2393 = param1.readInteger();
         this.var_2387 = param1.readBoolean();
         this.var_1936 = param1.readBoolean();
         this.var_1937 = param1.readInteger();
         this.var_1939 = param1.readInteger();
         this.var_2388 = param1.readBoolean();
         this.var_2390 = param1.readInteger();
         this.var_2386 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2392;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2386;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_1936;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2389;
      }
      
      public function get productName() : String
      {
         return this.var_831;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2391;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2387;
      }
      
      public function get responseType() : int
      {
         return this.var_2393;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_1939;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2390;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_1937;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2388;
      }
   }
}
