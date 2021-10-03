package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_808:int = 3;
       
      
      private var var_1889:Boolean = false;
      
      private var var_1886:Boolean = false;
      
      private var var_1164:int = 0;
      
      private var var_344:Vector3d = null;
      
      private var var_1887:int = 0;
      
      private var var_1892:int = 0;
      
      private var var_1891:Boolean = false;
      
      private var var_1893:int = -2;
      
      private var var_1885:Boolean = false;
      
      private var var_1890:int = 0;
      
      private var var_1894:int = -1;
      
      private var var_289:Vector3d = null;
      
      private var var_1888:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return this.var_1887;
      }
      
      public function get targetId() : int
      {
         return this.var_1894;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_1890 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_1887 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_1889 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_1894 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_1886 = param1;
      }
      
      public function dispose() : void
      {
         this.var_289 = null;
         this.var_344 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_289 == null)
         {
            this.var_289 = new Vector3d();
         }
         if(this.var_289.x != param1.x || this.var_289.y != param1.y || this.var_289.z != param1.z)
         {
            this.var_289.assign(param1);
            this.var_1164 = 0;
         }
      }
      
      public function get targetCategory() : int
      {
         return this.var_1893;
      }
      
      public function get screenHt() : int
      {
         return this.var_1888;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_1892 = param1;
      }
      
      public function get location() : IVector3d
      {
         return this.var_344;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_1888 = param1;
      }
      
      public function get roomHt() : int
      {
         return this.var_1890;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_1889;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_1886;
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_289 != null && this.var_344 != null)
         {
            ++this.var_1164;
            _loc4_ = Vector3d.dif(this.var_289,this.var_344);
            if(_loc4_.length <= param2)
            {
               this.var_344 = this.var_289;
               this.var_289 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_808 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1164 <= const_808)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_344 = Vector3d.sum(this.var_344,_loc4_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_1891 = param1;
      }
      
      public function get screenWd() : int
      {
         return this.var_1892;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_1885 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_1893 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_344 != null)
         {
            return;
         }
         this.var_344 = new Vector3d();
         this.var_344.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_1891;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_1885;
      }
   }
}
