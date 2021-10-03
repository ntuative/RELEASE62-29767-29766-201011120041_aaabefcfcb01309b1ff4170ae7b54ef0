package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2345:String;
      
      private var var_1170:String;
      
      private var var_2346:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         this.var_2346 = param1;
         this.var_1170 = param2;
         this.var_2345 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2346,this.var_1170,this.var_2345];
      }
      
      public function dispose() : void
      {
      }
   }
}
