package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1741:String;
      
      private var var_2118:int;
      
      private var var_2120:int;
      
      private var var_2119:int;
      
      private var var_2117:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2118 = param1.readInteger();
         this.var_2119 = param1.readInteger();
         this.var_2120 = param1.readInteger();
         this.var_2117 = param1.readString();
         this.var_1741 = param1.readString();
      }
      
      public function get msg() : String
      {
         return this.var_1741;
      }
      
      public function get hour() : int
      {
         return this.var_2118;
      }
      
      public function get minute() : int
      {
         return this.var_2119;
      }
      
      public function get chatterName() : String
      {
         return this.var_2117;
      }
      
      public function get chatterId() : int
      {
         return this.var_2120;
      }
   }
}
