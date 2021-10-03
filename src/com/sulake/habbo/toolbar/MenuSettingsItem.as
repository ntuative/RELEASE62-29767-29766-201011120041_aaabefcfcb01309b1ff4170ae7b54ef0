package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1965:Array;
      
      private var var_1966:String;
      
      private var var_1964:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_1966 = param1;
         this.var_1965 = param2;
         this.var_1964 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_1966;
      }
      
      public function get yieldList() : Array
      {
         return this.var_1965;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_1964;
      }
   }
}
