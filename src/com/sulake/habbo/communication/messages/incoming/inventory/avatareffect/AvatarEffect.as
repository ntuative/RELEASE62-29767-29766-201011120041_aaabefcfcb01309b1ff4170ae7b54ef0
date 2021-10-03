package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
   public class AvatarEffect
   {
       
      
      private var var_2450:int;
      
      private var var_1422:int;
      
      private var _type:int;
      
      private var var_2451:int;
      
      public function AvatarEffect()
      {
         super();
      }
      
      public function get inactiveEffectsInInventory() : int
      {
         return this.var_2451;
      }
      
      public function set secondsLeftIfActive(param1:int) : void
      {
         this.var_2450 = param1;
      }
      
      public function get duration() : int
      {
         return this.var_1422;
      }
      
      public function set inactiveEffectsInInventory(param1:int) : void
      {
         this.var_2451 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         this.var_1422 = param1;
      }
      
      public function get secondsLeftIfActive() : int
      {
         return this.var_2450;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
   }
}
