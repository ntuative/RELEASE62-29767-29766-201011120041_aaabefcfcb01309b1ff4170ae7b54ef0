package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_749:int = 2;
      
      public static const const_879:int = 6;
      
      public static const const_783:int = 1;
      
      public static const const_712:int = 3;
      
      public static const const_1013:int = 4;
      
      public static const const_731:int = 5;
       
      
      private var var_2423:String;
      
      private var var_1019:int;
      
      private var var_2268:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1019 = param2;
         this.var_2268 = param3;
         this.var_2423 = param4;
      }
      
      public function get time() : String
      {
         return this.var_2423;
      }
      
      public function get senderId() : int
      {
         return this.var_1019;
      }
      
      public function get messageText() : String
      {
         return this.var_2268;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
