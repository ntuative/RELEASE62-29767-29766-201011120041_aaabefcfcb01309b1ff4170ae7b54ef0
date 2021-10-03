package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStoreSettingsMessage extends RoomWidgetMessage
   {
      
      public static const const_781:String = "RWSSM_STORE_SOUND";
      
      public static const const_768:String = "RWSSM_PREVIEW_SOUND";
      
      public static const const_1321:String = "RWSSM_STORE_SETTINGS";
       
      
      private var var_439:Number;
      
      public function RoomWidgetStoreSettingsMessage(param1:String)
      {
         super(param1);
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_439 = param1;
      }
      
      public function get volume() : Number
      {
         return this.var_439;
      }
   }
}
