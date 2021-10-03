package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFlatControlUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1917:String;
      
      private var var_1918:Boolean = false;
      
      public function RoomObjectAvatarFlatControlUpdateMessage(param1:String)
      {
         super();
         this.var_1917 = param1;
         if(param1 != null && param1.indexOf("useradmin") != -1)
         {
            this.var_1918 = true;
         }
      }
      
      public function get rawData() : String
      {
         return this.var_1917;
      }
      
      public function get isAdmin() : Boolean
      {
         return this.var_1918;
      }
   }
}
