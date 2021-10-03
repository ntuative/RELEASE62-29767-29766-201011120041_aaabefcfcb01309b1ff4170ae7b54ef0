package com.sulake.habbo.communication.messages.parser.inventory.avatareffect
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffect;
   
   public class AvatarEffectsMessageParser implements IMessageParser
   {
       
      
      private var var_242:Array;
      
      public function AvatarEffectsMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:* = null;
         this.var_242 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new AvatarEffect();
            _loc4_.type = param1.readInteger();
            _loc4_.duration = param1.readInteger();
            _loc4_.inactiveEffectsInInventory = param1.readInteger();
            _loc4_.secondsLeftIfActive = param1.readInteger();
            this.var_242.push(_loc4_);
            _loc3_++;
         }
         return true;
      }
      
      public function get effects() : Array
      {
         return this.var_242;
      }
      
      public function flush() : Boolean
      {
         this.var_242 = null;
         return true;
      }
   }
}
