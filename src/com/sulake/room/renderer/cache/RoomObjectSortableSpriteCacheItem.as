package com.sulake.room.renderer.cache
{
   import com.sulake.room.renderer.utils.SortableSprite;
   
   public class RoomObjectSortableSpriteCacheItem
   {
       
      
      private var var_1599:Boolean = false;
      
      private var var_2249:int = -1;
      
      private var var_173:Array;
      
      private var var_2248:int = -1;
      
      public function RoomObjectSortableSpriteCacheItem()
      {
         this.var_173 = [];
         super();
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_1599;
      }
      
      public function addSprite(param1:SortableSprite) : void
      {
         this.var_173.push(param1);
      }
      
      public function get spriteCount() : int
      {
         return this.var_173.length;
      }
      
      public function needsUpdate(param1:int, param2:int) : Boolean
      {
         if(param1 != this.var_2249 || param2 != this.var_2248)
         {
            this.var_2249 = param1;
            this.var_2248 = param2;
            return true;
         }
         return false;
      }
      
      public function setSpriteCount(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(param1 < this.var_173.length)
         {
            _loc2_ = param1;
            while(_loc2_ < this.var_173.length)
            {
               _loc3_ = this.getSprite(_loc2_);
               if(_loc3_)
               {
                  _loc3_.dispose();
               }
               _loc2_++;
            }
            this.var_173.splice(param1,this.var_173.length - param1);
         }
         if(this.var_173.length == 0)
         {
            this.var_1599 = true;
         }
         else
         {
            this.var_1599 = false;
         }
      }
      
      public function getSprite(param1:int) : SortableSprite
      {
         return this.var_173[param1];
      }
      
      public function dispose() : void
      {
         this.setSpriteCount(0);
      }
   }
}
