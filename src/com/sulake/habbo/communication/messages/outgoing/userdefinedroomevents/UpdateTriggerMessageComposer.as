package com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class UpdateTriggerMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_30:Array;
      
      public function UpdateTriggerMessageComposer(param1:int, param2:Array, param3:String, param4:Array)
      {
         var _loc5_:int = 0;
         this.var_30 = new Array();
         super();
         this.var_30.push(param1);
         this.var_30.push(param2.length);
         for each(_loc5_ in param2)
         {
            this.var_30.push(_loc5_);
         }
         this.var_30.push(param3);
         this.var_30.push(param4.length);
         for each(param1 in param4)
         {
            this.var_30.push(param1);
         }
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return this.var_30;
      }
      
      public function dispose() : void
      {
         this.var_30 = null;
      }
   }
}
