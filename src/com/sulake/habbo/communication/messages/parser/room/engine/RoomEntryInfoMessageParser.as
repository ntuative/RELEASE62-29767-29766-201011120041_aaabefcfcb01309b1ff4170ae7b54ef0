package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2290:int;
      
      private var var_373:Boolean;
      
      private var var_1646:Boolean;
      
      private var var_1048:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1646 = param1.readBoolean();
         if(this.var_1646)
         {
            this.var_2290 = param1.readInteger();
            this.var_373 = param1.readBoolean();
         }
         else
         {
            this.var_1048 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1048 != null)
         {
            this.var_1048.dispose();
            this.var_1048 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2290;
      }
      
      public function get owner() : Boolean
      {
         return this.var_373;
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1646;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1048;
      }
   }
}
