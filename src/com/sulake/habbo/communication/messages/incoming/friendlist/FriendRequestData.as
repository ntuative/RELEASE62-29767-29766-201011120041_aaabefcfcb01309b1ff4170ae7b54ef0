package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_2168:int;
      
      private var var_2167:String;
      
      private var var_939:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_939 = param1.readInteger();
         this.var_2167 = param1.readString();
         this.var_2168 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_939;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2168;
      }
      
      public function get requesterName() : String
      {
         return this.var_2167;
      }
   }
}
