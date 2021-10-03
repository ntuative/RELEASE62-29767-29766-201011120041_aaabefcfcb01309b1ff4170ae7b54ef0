package com.sulake.habbo.widget.messages
{
   import flash.display.BitmapData;
   
   public class RoomWidgetSetToolbarIconMessage extends RoomWidgetMessage
   {
      
      public static const const_1450:String = "me_menu";
      
      public static const const_1079:String = "RWCM_MESSAGE_SET_TOOLBAR_ICON";
       
      
      private var _icon:BitmapData;
      
      private var var_2467:String;
      
      public function RoomWidgetSetToolbarIconMessage(param1:String, param2:BitmapData)
      {
         super(const_1079);
         this.var_2467 = param1;
         this._icon = param2;
      }
      
      public function get icon() : BitmapData
      {
         return this._icon;
      }
      
      public function get widgetType() : String
      {
         return this.var_2467;
      }
   }
}
