package com.sulake.habbo.notifications
{
   public class HabboNotificationItem
   {
       
      
      private var var_75:HabboNotificationItemStyle;
      
      private var var_149:String;
      
      private var _component:HabboNotifications;
      
      public function HabboNotificationItem(param1:String, param2:HabboNotificationItemStyle, param3:HabboNotifications)
      {
         super();
         this.var_149 = param1;
         this.var_75 = param2;
         this._component = param3;
      }
      
      public function ExecuteUiLinks() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_75.componentLinks;
         for each(_loc2_ in _loc1_)
         {
            if(this._component != null)
            {
               this._component.onExecuteLink(_loc2_);
            }
         }
      }
      
      public function get style() : HabboNotificationItemStyle
      {
         return this.var_75;
      }
      
      public function get content() : String
      {
         return this.var_149;
      }
   }
}
