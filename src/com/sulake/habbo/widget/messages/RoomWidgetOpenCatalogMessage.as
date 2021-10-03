package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_986:String = "RWOCM_CLUB_MAIN";
      
      public static const const_724:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_2458:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_724);
         this.var_2458 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2458;
      }
   }
}
