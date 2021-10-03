package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var var_1865:int = 0;
      
      private var _type:int = 0;
      
      private var var_1866:String = "";
      
      private var var_1867:String = "";
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1865 = param1.readInteger();
         this.var_1867 = param1.readString();
         this.var_1866 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get badgeID() : String
      {
         return this.var_1867;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_1866;
      }
      
      public function get level() : int
      {
         return this.var_1865;
      }
   }
}
