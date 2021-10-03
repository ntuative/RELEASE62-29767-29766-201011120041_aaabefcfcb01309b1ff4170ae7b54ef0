package com.sulake.habbo.avatar.cache
{
   import com.sulake.core.utils.Map;
   import flash.utils.getTimer;
   
   public class AvatarImageActionCache
   {
       
      
      private var var_2324:int;
      
      private var var_212:Map;
      
      public function AvatarImageActionCache()
      {
         super();
         this.var_212 = new Map();
         this.setLastAccessTime(getTimer());
      }
      
      public function setLastAccessTime(param1:int) : void
      {
         this.var_2324 = param1;
      }
      
      private function debugInfo(param1:String) : void
      {
      }
      
      public function getLastAccessTime() : int
      {
         return this.var_2324;
      }
      
      public function getDirectionCache(param1:int) : AvatarImageDirectionCache
      {
         var _loc2_:String = param1.toString();
         return this.var_212.getValue(_loc2_) as AvatarImageDirectionCache;
      }
      
      public function updateDirectionCache(param1:int, param2:AvatarImageDirectionCache) : void
      {
         var _loc3_:String = param1.toString();
         this.var_212.add(_loc3_,param2);
      }
      
      public function dispose() : void
      {
         this.debugInfo("[dispose]");
         if(this.var_212 == null)
         {
            return;
         }
         this.var_212.dispose();
      }
   }
}
