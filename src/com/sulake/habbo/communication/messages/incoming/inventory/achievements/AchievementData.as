package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var var_1865:int;
      
      private var var_2313:int;
      
      private var var_2312:int;
      
      private var _type:int;
      
      private var var_2311:int;
      
      private var var_717:String;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1865 = param1.readInteger();
         this.var_717 = param1.readString();
         this.var_2313 = param1.readInteger();
         this.var_2312 = param1.readInteger();
         this.var_2311 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1865;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2313;
      }
      
      public function get badgeId() : String
      {
         return this.var_717;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2312;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2311;
      }
   }
}
