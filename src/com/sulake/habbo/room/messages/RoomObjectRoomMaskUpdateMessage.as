package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectRoomMaskUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_1380:String = "door";
      
      public static const const_433:String = "window";
      
      public static const const_588:String = "RORMUM_ADD_MASK";
      
      public static const const_413:String = "RORMUM_ADD_MASK";
      
      public static const const_195:String = "hole";
       
      
      private var var_2447:String = "";
      
      private var var_2449:String = "";
      
      private var var_2446:String = "window";
      
      private var var_2448:Vector3d = null;
      
      private var _type:String = "";
      
      public function RoomObjectRoomMaskUpdateMessage(param1:String, param2:String, param3:String = null, param4:IVector3d = null, param5:String = "window")
      {
         super(null,null);
         this._type = param1;
         this.var_2449 = param2;
         this.var_2447 = param3;
         if(param4 != null)
         {
            this.var_2448 = new Vector3d(param4.x,param4.y,param4.z);
         }
         this.var_2446 = param5;
      }
      
      public function get maskCategory() : String
      {
         return this.var_2446;
      }
      
      public function get maskId() : String
      {
         return this.var_2449;
      }
      
      public function get maskLocation() : IVector3d
      {
         return this.var_2448;
      }
      
      public function get maskType() : String
      {
         return this.var_2447;
      }
      
      public function get type() : String
      {
         return this._type;
      }
   }
}
