package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_791:RoomObjectLocationCacheItem = null;
      
      private var var_173:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_791 = new RoomObjectLocationCacheItem(param1);
         this.var_173 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_791;
      }
      
      public function dispose() : void
      {
         if(this.var_791 != null)
         {
            this.var_791.dispose();
            this.var_791 = null;
         }
         if(this.var_173 != null)
         {
            this.var_173.dispose();
            this.var_173 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_173;
      }
   }
}
