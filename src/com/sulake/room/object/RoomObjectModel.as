package com.sulake.room.object
{
   import flash.utils.Dictionary;
   
   public class RoomObjectModel implements IRoomObjectModelController
   {
       
      
      private var _updateID:int;
      
      private var _stringArrayReadOnlyList:Array;
      
      private var _numberArrayReadOnlyList:Array;
      
      private var var_565:Dictionary;
      
      private var var_564:Dictionary;
      
      private var var_1176:Array;
      
      private var var_511:Dictionary;
      
      private var var_1177:Array;
      
      private var var_510:Dictionary;
      
      public function RoomObjectModel()
      {
         super();
         this.var_511 = new Dictionary();
         this.var_510 = new Dictionary();
         this.var_564 = new Dictionary();
         this.var_565 = new Dictionary();
         this.var_1176 = [];
         this.var_1177 = [];
         this._numberArrayReadOnlyList = [];
         this._stringArrayReadOnlyList = [];
         this._updateID = 0;
      }
      
      public function setNumber(param1:String, param2:Number, param3:Boolean = false) : void
      {
         if(this.var_1176.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            this.var_1176.push(param1);
         }
         if(this.var_511[param1] != param2)
         {
            this.var_511[param1] = param2;
            ++this._updateID;
         }
      }
      
      public function setStringArray(param1:String, param2:Array, param3:Boolean = false) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(this._stringArrayReadOnlyList.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            this._stringArrayReadOnlyList.push(param1);
         }
         var _loc4_:* = [];
         var _loc5_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < param2.length)
         {
            if(param2[_loc5_] is String)
            {
               _loc4_.push(param2[_loc5_]);
            }
            _loc5_++;
         }
         var _loc6_:Array = this.var_565[param1];
         var _loc7_:Boolean = true;
         if(_loc6_ != null && _loc6_.length == _loc4_.length)
         {
            _loc5_ = _loc4_.length - 1;
            while(_loc5_ >= 0)
            {
               if(_loc4_[_loc5_] as String != _loc6_[_loc5_] as String)
               {
                  _loc7_ = false;
                  break;
               }
               _loc5_--;
            }
         }
         else
         {
            _loc7_ = false;
         }
         if(_loc7_)
         {
            return;
         }
         this.var_565[param1] = _loc4_;
         ++this._updateID;
      }
      
      public function getNumber(param1:String) : Number
      {
         return this.var_511[param1];
      }
      
      public function setString(param1:String, param2:String, param3:Boolean = false) : void
      {
         if(this.var_1177.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            this.var_1177.push(param1);
         }
         if(this.var_510[param1] != param2)
         {
            this.var_510[param1] = param2;
            ++this._updateID;
         }
      }
      
      public function setNumberArray(param1:String, param2:Array, param3:Boolean = false) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(this._numberArrayReadOnlyList.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            this._numberArrayReadOnlyList.push(param1);
         }
         var _loc4_:* = [];
         var _loc5_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < param2.length)
         {
            if(param2[_loc5_] is Number)
            {
               _loc4_.push(param2[_loc5_]);
            }
            _loc5_++;
         }
         var _loc6_:Array = this.var_564[param1];
         var _loc7_:Boolean = true;
         if(_loc6_ != null && _loc6_.length == _loc4_.length)
         {
            _loc5_ = _loc4_.length - 1;
            while(_loc5_ >= 0)
            {
               if(_loc4_[_loc5_] as Number != _loc6_[_loc5_] as Number)
               {
                  _loc7_ = false;
                  break;
               }
               _loc5_--;
            }
         }
         else
         {
            _loc7_ = false;
         }
         if(_loc7_)
         {
            return;
         }
         this.var_564[param1] = _loc4_;
         ++this._updateID;
      }
      
      public function getString(param1:String) : String
      {
         return this.var_510[param1];
      }
      
      public function getNumberArray(param1:String) : Array
      {
         var _loc2_:Array = this.var_564[param1];
         if(_loc2_ != null)
         {
            _loc2_ = _loc2_.slice();
         }
         return _loc2_;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_511 != null)
         {
            for(_loc1_ in this.var_511)
            {
               delete this.var_511[_loc1_];
            }
            this.var_511 = null;
         }
         if(this.var_510 != null)
         {
            for(_loc1_ in this.var_510)
            {
               delete this.var_510[_loc1_];
            }
            this.var_510 = null;
         }
         if(this.var_564 != null)
         {
            for(_loc1_ in this.var_564)
            {
               delete this.var_564[_loc1_];
            }
            this.var_564 = null;
         }
         if(this.var_565 != null)
         {
            for(_loc1_ in this.var_565)
            {
               delete this.var_565[_loc1_];
            }
            this.var_565 = null;
         }
         this.var_1177 = [];
         this.var_1176 = [];
         this._stringArrayReadOnlyList = [];
         this._numberArrayReadOnlyList = [];
      }
      
      public function getStringArray(param1:String) : Array
      {
         var _loc2_:Array = this.var_565[param1];
         if(_loc2_ != null)
         {
            _loc2_ = _loc2_.slice();
         }
         return _loc2_;
      }
      
      public function getUpdateID() : int
      {
         return this._updateID;
      }
   }
}
