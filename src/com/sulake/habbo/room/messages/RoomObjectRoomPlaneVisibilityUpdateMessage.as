package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomPlaneVisibilityUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_913:String = "RORPVUM_FLOOR_VISIBILITY";
      
      public static const const_1034:String = "RORPVUM_WALL_VISIBILITY";
       
      
      private var var_336:Boolean = false;
      
      private var _type:String = "";
      
      public function RoomObjectRoomPlaneVisibilityUpdateMessage(param1:String, param2:Boolean)
      {
         super(null,null);
         this._type = param1;
         this.var_336 = param2;
      }
      
      public function get visible() : Boolean
      {
         return this.var_336;
      }
      
      public function get type() : String
      {
         return this._type;
      }
   }
}
