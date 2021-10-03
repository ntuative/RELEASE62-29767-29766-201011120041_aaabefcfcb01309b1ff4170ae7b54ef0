package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class UniqueIDMessageComposer implements IMessageComposer
   {
       
      
      private var var_1174:String;
      
      public function UniqueIDMessageComposer(param1:String)
      {
         super();
         this.var_1174 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1174];
      }
      
      public function dispose() : void
      {
      }
   }
}
