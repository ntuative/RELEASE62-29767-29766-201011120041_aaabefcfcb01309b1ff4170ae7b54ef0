package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_697:String = "RORUM_ROOM_FLOOR_UPDATE";
      
      public static const const_644:String = "RORUM_ROOM_LANDSCAPE_UPDATE";
      
      public static const const_790:String = "RORUM_ROOM_WALL_UPDATE";
       
      
      private var _type:String = "";
      
      private var var_156:String = "";
      
      public function RoomObjectRoomUpdateMessage(param1:String, param2:String)
      {
         super(null,null);
         this._type = param1;
         this.var_156 = param2;
      }
      
      public function get value() : String
      {
         return this.var_156;
      }
      
      public function get type() : String
      {
         return this._type;
      }
   }
}
