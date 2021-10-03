package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1181:int = 80;
       
      
      private var var_471:Map;
      
      private var var_864:String = "";
      
      private var var_1316:Array;
      
      public function UserRegistry()
      {
         this.var_471 = new Map();
         this.var_1316 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(this.var_1316.length > 0)
         {
            _loc1_ = this.var_471.getValue(this.var_1316.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = this.var_864;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(this.var_471.getValue(param1) != null)
         {
            this.var_471.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,this.var_864);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && this.var_864 == "")
         {
            this.var_1316.push(param1);
         }
         this.var_471.add(param1,_loc4_);
         this.purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return this.var_471;
      }
      
      public function unregisterRoom() : void
      {
         this.var_864 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(this.var_471.length > const_1181)
         {
            _loc1_ = this.var_471.getKey(0);
            this.var_471.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         this.var_864 = param1;
         if(this.var_864 != "")
         {
            this.addRoomNameForMissing();
         }
      }
   }
}
