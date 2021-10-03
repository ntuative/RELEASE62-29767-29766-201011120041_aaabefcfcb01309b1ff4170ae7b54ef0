package com.sulake.core.utils
{
   import com.sulake.core.runtime.IDisposable;
   import flash.utils.Dictionary;
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   
   public class Map extends Proxy implements IDisposable
   {
       
      
      private var _length:uint;
      
      private var var_270:Array;
      
      private var var_30:Array;
      
      private var var_144:Dictionary;
      
      public function Map()
      {
         super();
         this._length = 0;
         this.var_144 = new Dictionary();
         this.var_30 = [];
         this.var_270 = [];
      }
      
      public function remove(param1:*) : *
      {
         var _loc2_:Object = this.var_144[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:int = this.var_30.indexOf(_loc2_);
         if(_loc3_ >= 0)
         {
            this.var_30.splice(_loc3_,1);
            this.var_270.splice(_loc3_,1);
            --this._length;
         }
         delete this.var_144[param1];
         return _loc2_;
      }
      
      public function unshift(param1:*, param2:*) : Boolean
      {
         if(this.var_144[param1] != null)
         {
            return false;
         }
         this.var_144[param1] = param2;
         this.var_30.unshift(param2);
         this.var_270.unshift(param1);
         ++this._length;
         return true;
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         if(param1 is QName)
         {
            param1 = QName(param1).localName;
         }
         return this.var_144[param1];
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in this.var_144)
         {
            delete this.var_144[_loc1_];
         }
         this._length = 0;
         this.var_30 = [];
         this.var_270 = [];
      }
      
      override flash_proxy function nextNameIndex(param1:int) : int
      {
         if(param1 < this.var_270.length)
         {
            return param1 + 1;
         }
         return 0;
      }
      
      override flash_proxy function setProperty(param1:*, param2:*) : void
      {
         if(param1 is QName)
         {
            param1 = QName(param1).localName;
         }
         this.var_144[param1] = param2;
         var _loc3_:int = this.var_270.indexOf(param1);
         if(_loc3_ == -1)
         {
            this.var_30[this._length] = param2;
            this.var_270[this._length] = param1;
            ++this._length;
         }
         else
         {
            this.var_30.splice(_loc3_,1,param2);
         }
      }
      
      public function getValues() : Array
      {
         return this.var_30.slice();
      }
      
      override flash_proxy function nextName(param1:int) : String
      {
         return this.var_270[param1 - 1];
      }
      
      public function add(param1:*, param2:*) : Boolean
      {
         if(this.var_144[param1] != null)
         {
            return false;
         }
         this.var_144[param1] = param2;
         this.var_30[this._length] = param2;
         this.var_270[this._length] = param1;
         ++this._length;
         return true;
      }
      
      override flash_proxy function callProperty(param1:*, ... rest) : *
      {
         var _loc3_:* = null;
         if(param1.localName == "toString")
         {
            return "Map";
         }
         return null;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_144 == null;
      }
      
      public function get length() : uint
      {
         return this._length;
      }
      
      public function getKey(param1:int) : *
      {
         if(param1 < 0 || param1 >= this._length)
         {
            return null;
         }
         return this.var_270[param1];
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_144 != null)
         {
            for(_loc1_ in this.var_144)
            {
               delete this.var_144[_loc1_];
            }
            this.var_144 = null;
         }
         this._length = 0;
         this.var_30 = null;
         this.var_270 = null;
      }
      
      public function getKeys() : Array
      {
         return this.var_270.slice();
      }
      
      public function getWithIndex(param1:int) : *
      {
         if(param1 < 0 || param1 >= this._length)
         {
            return null;
         }
         return this.var_30[param1];
      }
      
      public function getValue(param1:*) : *
      {
         return this.var_144[param1];
      }
      
      override flash_proxy function nextValue(param1:int) : *
      {
         return this.var_30[param1 - 1];
      }
   }
}
