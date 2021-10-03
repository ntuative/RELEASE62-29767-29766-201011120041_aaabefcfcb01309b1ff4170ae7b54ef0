package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerPreviewMessage extends RoomWidgetMessage
   {
      
      public static const const_720:String = "RWDPM_PREVIEW_DIMMER_PRESET";
       
      
      private var var_1076:int;
      
      private var _color:uint;
      
      private var var_2074:Boolean;
      
      public function RoomWidgetDimmerPreviewMessage(param1:uint, param2:int, param3:Boolean)
      {
         super(const_720);
         this._color = param1;
         this.var_1076 = param2;
         this.var_2074 = param3;
      }
      
      public function get brightness() : int
      {
         return this.var_1076;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get bgOnly() : Boolean
      {
         return this.var_2074;
      }
   }
}
