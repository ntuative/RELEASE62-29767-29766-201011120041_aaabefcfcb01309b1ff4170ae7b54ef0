package com.sulake.habbo.session.events
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionQueueEvent extends RoomSessionEvent
   {
      
      public static const const_509:String = "RSQE_QUEUE_STATUS";
      
      public static const const_975:int = 2;
      
      public static const const_963:String = "c";
      
      public static const const_1468:String = "d";
      
      public static const const_866:int = 1;
       
      
      private var var_1249:Map;
      
      private var _name:String;
      
      private var var_2605:String;
      
      private var var_354:Boolean;
      
      private var _target:int;
      
      public function RoomSessionQueueEvent(param1:IRoomSession, param2:String, param3:int, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_509,param1,param5,param6);
         this._name = param2;
         this._target = param3;
         this.var_1249 = new Map();
         this.var_354 = param4;
      }
      
      public function getQueueSize(param1:String) : int
      {
         return this.var_1249.getValue(param1);
      }
      
      public function get queueTypes() : Array
      {
         return this.var_1249.getKeys();
      }
      
      public function get queueSetTarget() : int
      {
         return this._target;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_354;
      }
      
      public function get queueSetName() : String
      {
         return this._name;
      }
      
      public function addQueue(param1:String, param2:int) : void
      {
         this.var_1249.add(param1,param2);
      }
   }
}
