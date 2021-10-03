package com.sulake.habbo.communication.messages.outgoing.room.action
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class KickBotMessageComposer implements IMessageComposer
   {
       
      
      private var var_2286:int;
      
      public function KickBotMessageComposer(param1:int)
      {
         super();
         this.var_2286 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2286];
      }
      
      public function dispose() : void
      {
      }
   }
}
