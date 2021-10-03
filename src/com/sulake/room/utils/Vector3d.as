package com.sulake.room.utils
{
   public class Vector3d implements IVector3d
   {
       
      
      private var _length:Number = NaN;
      
      private var var_162:Number;
      
      private var var_163:Number;
      
      private var _x:Number;
      
      public function Vector3d(param1:Number = 0, param2:Number = 0, param3:Number = 0)
      {
         super();
         this._x = param1;
         this.var_162 = param2;
         this.var_163 = param3;
      }
      
      public static function dif(param1:IVector3d, param2:IVector3d) : Vector3d
      {
         if(param1 == null || param2 == null)
         {
            return null;
         }
         return new Vector3d(param1.x - param2.x,param1.y - param2.y,param1.z - param2.z);
      }
      
      public static function dotProduct(param1:IVector3d, param2:IVector3d) : Number
      {
         if(param1 == null || param2 == null)
         {
            return 0;
         }
         return param1.x * param2.x + param1.y * param2.y + param1.z * param2.z;
      }
      
      public static function isEqual(param1:IVector3d, param2:IVector3d) : Boolean
      {
         if(param1 == null || param2 == null)
         {
            return false;
         }
         if(param1.x == param2.x && param1.y == param2.y && param1.z == param2.z)
         {
            return true;
         }
         return false;
      }
      
      public static function scalarProjection(param1:IVector3d, param2:IVector3d) : Number
      {
         if(param1 == null || param2 == null)
         {
            return -1;
         }
         var _loc3_:Number = param2.length;
         if(_loc3_ > 0)
         {
            return (param1.x * param2.x + param1.y * param2.y + param1.z * param2.z) / _loc3_;
         }
         return -1;
      }
      
      public static function sum(param1:IVector3d, param2:IVector3d) : Vector3d
      {
         if(param1 == null || param2 == null)
         {
            return null;
         }
         return new Vector3d(param1.x + param2.x,param1.y + param2.y,param1.z + param2.z);
      }
      
      public static function cosAngle(param1:IVector3d, param2:IVector3d) : Number
      {
         if(param1 == null || param2 == null)
         {
            return 0;
         }
         var _loc3_:Number = param1.length * param2.length;
         if(_loc3_ == 0)
         {
            return 0;
         }
         return Vector3d.dotProduct(param1,param2) / _loc3_;
      }
      
      public static function product(param1:IVector3d, param2:Number) : Vector3d
      {
         if(param1 == null)
         {
            return null;
         }
         return new Vector3d(param1.x * param2,param1.y * param2,param1.z * param2);
      }
      
      public static function crossProduct(param1:IVector3d, param2:IVector3d) : Vector3d
      {
         if(param1 == null || param2 == null)
         {
            return null;
         }
         return new Vector3d(param1.y * param2.z - param1.z * param2.y,param1.z * param2.x - param1.x * param2.z,param1.x * param2.y - param1.y * param2.x);
      }
      
      public function sub(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         this._x -= param1.x;
         this.var_162 -= param1.y;
         this.var_163 -= param1.z;
         this._length = NaN;
      }
      
      public function negate() : void
      {
         this._x = -this._x;
         this.var_162 = -this.var_162;
         this.var_163 = -this.var_163;
      }
      
      public function mul(param1:Number) : void
      {
         this._x *= param1;
         this.var_162 *= param1;
         this.var_163 *= param1;
         this._length = NaN;
      }
      
      public function div(param1:Number) : void
      {
         if(param1 != 0)
         {
            this._x /= param1;
            this.var_162 /= param1;
            this.var_163 /= param1;
            this._length = NaN;
         }
      }
      
      public function get y() : Number
      {
         return this.var_162;
      }
      
      public function add(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         this._x += param1.x;
         this.var_162 += param1.y;
         this.var_163 += param1.z;
         this._length = NaN;
      }
      
      public function get length() : Number
      {
         if(isNaN(this._length))
         {
            this._length = Math.sqrt(this._x * this._x + this.var_162 * this.var_162 + this.var_163 * this.var_163);
         }
         return this._length;
      }
      
      public function assign(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         this._x = param1.x;
         this.var_162 = param1.y;
         this.var_163 = param1.z;
         this._length = NaN;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
         this._length = NaN;
      }
      
      public function set y(param1:Number) : void
      {
         this.var_162 = param1;
         this._length = NaN;
      }
      
      public function set z(param1:Number) : void
      {
         this.var_163 = param1;
         this._length = NaN;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get z() : Number
      {
         return this.var_163;
      }
   }
}
