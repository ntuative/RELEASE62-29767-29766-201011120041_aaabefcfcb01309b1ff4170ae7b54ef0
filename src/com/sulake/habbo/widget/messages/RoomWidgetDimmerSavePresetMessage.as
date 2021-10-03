package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_556:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_2048:int;
      
      private var var_2049:int;
      
      private var var_2250:Boolean;
      
      private var var_1076:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_556);
         this.var_2049 = param1;
         this.var_2048 = param2;
         this._color = param3;
         this.var_1076 = param4;
         this.var_2250 = param5;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2048;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2049;
      }
      
      public function get brightness() : int
      {
         return this.var_1076;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2250;
      }
   }
}
