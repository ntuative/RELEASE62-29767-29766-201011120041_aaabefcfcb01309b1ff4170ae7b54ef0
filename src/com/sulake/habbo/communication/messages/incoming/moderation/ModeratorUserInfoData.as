package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_2035:int;
      
      private var var_2033:int;
      
      private var var_2036:int;
      
      private var _userName:String;
      
      private var var_2034:int;
      
      private var var_2032:int;
      
      private var var_2037:int;
      
      private var _userId:int;
      
      private var var_610:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2032 = param1.readInteger();
         this.var_2034 = param1.readInteger();
         this.var_610 = param1.readBoolean();
         this.var_2036 = param1.readInteger();
         this.var_2033 = param1.readInteger();
         this.var_2035 = param1.readInteger();
         this.var_2037 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return this.var_2037;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get online() : Boolean
      {
         return this.var_610;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2034;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2033;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2035;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2036;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2032;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
   }
}
