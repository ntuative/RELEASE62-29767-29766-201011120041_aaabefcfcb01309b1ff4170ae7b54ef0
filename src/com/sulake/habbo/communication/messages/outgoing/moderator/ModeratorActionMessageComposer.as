package com.sulake.habbo.communication.messages.outgoing.moderator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class ModeratorActionMessageComposer implements IMessageComposer, IDisposable
   {
      
      public static const const_1361:int = 1;
      
      public static const const_1340:int = 4;
      
      public static const const_1534:int = 2;
      
      public static const const_1351:int = 1;
      
      public static const const_1251:int = 0;
      
      public static const const_1528:int = 0;
      
      public static const const_1274:int = 3;
       
      
      private var var_30:Array;
      
      public function ModeratorActionMessageComposer(param1:int, param2:int, param3:String, param4:String, param5:String, param6:int = 0)
      {
         this.var_30 = new Array();
         super();
         this.var_30.push(param1);
         this.var_30.push(param2);
         this.var_30.push(param3);
         this.var_30.push(param4);
         this.var_30.push(param5);
         this.var_30.push(param6);
         this.var_30.push(false);
         this.var_30.push(false);
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
