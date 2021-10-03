package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GenerateSecretKeyMessageComposer implements IMessageComposer
   {
       
      
      private var var_1942:String;
      
      public function GenerateSecretKeyMessageComposer(param1:String)
      {
         super();
         this.var_1942 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1942];
      }
      
      public function dispose() : void
      {
      }
   }
}
