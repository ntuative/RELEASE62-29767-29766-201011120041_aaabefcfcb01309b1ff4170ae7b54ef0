package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_874:String = "inventory_badges";
      
      public static const const_1313:String = "inventory_clothes";
      
      public static const const_1343:String = "inventory_furniture";
      
      public static const const_590:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1085:String = "inventory_effects";
       
      
      private var var_1981:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_590);
         this.var_1981 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_1981;
      }
   }
}
