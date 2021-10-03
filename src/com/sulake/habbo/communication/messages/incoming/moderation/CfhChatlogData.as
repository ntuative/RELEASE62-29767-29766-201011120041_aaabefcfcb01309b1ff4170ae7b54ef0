package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_2108:int;
      
      private var var_1353:int;
      
      private var var_2196:int;
      
      private var var_1567:int;
      
      private var var_110:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1567 = param1.readInteger();
         this.var_2196 = param1.readInteger();
         this.var_1353 = param1.readInteger();
         this.var_2108 = param1.readInteger();
         this.var_110 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1567);
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2108;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1353;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2196;
      }
      
      public function get callId() : int
      {
         return this.var_1567;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_110;
      }
   }
}
