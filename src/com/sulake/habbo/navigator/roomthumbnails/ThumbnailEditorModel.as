package com.sulake.habbo.navigator.roomthumbnails
{
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomThumbnailData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomThumbnailObjectData;
   import com.sulake.habbo.navigator.Util;
   import flash.utils.Dictionary;
   
   public class ThumbnailEditorModel
   {
      
      public static const const_55:int = 2;
      
      public static const const_33:int = 3;
      
      public static const const_37:int = 1;
       
      
      private var var_528:int = 1;
      
      private var _data:RoomThumbnailData;
      
      private var var_178:RoomThumbnailObjectData;
      
      public function ThumbnailEditorModel()
      {
         super();
      }
      
      private function addObject(param1:int) : void
      {
         Logger.log("New object pos: " + param1);
         var _loc2_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc2_.pos = param1;
         _loc2_.imgId = 0;
         this._data.objects.push(_loc2_);
         this.var_178 = _loc2_;
         Logger.log("Object count after insert: " + this._data.objects.length);
      }
      
      public function setImg(param1:int) : void
      {
         if(this.var_528 == const_37)
         {
            this._data.bgImgId = param1;
         }
         else if(this.var_528 == const_55)
         {
            this._data.frontImgId = param1;
         }
         if(this.var_528 == const_33)
         {
            if(this.var_178 == null)
            {
               return;
            }
            this.var_178.imgId = param1;
         }
      }
      
      public function set data(param1:RoomThumbnailData) : void
      {
         this._data = param1;
         this.var_528 = const_37;
         if(this._data.objects.length > 0)
         {
            this.var_178 = this._data.objects[0];
         }
         else
         {
            this.var_178 = null;
         }
      }
      
      public function set mode(param1:int) : void
      {
         this.var_528 = param1;
      }
      
      public function getImgId() : int
      {
         if(this.var_528 == const_37)
         {
            return this._data.bgImgId;
         }
         if(this.var_528 == const_55)
         {
            return this._data.frontImgId;
         }
         return this.var_178 == null ? -1 : int(this.var_178.imgId);
      }
      
      public function get mode() : int
      {
         return this.var_528;
      }
      
      public function findByPos(param1:int) : RoomThumbnailObjectData
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._data.objects)
         {
            if(_loc2_.pos == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get data() : RoomThumbnailData
      {
         return this._data;
      }
      
      public function get selected() : RoomThumbnailObjectData
      {
         return this.var_178;
      }
      
      public function set selected(param1:RoomThumbnailObjectData) : void
      {
         this.var_178 = param1;
      }
      
      public function setPos(param1:int) : void
      {
         this.var_178 = this.findByPos(param1);
         if(this.var_178 == null)
         {
            this.addObject(param1);
         }
      }
      
      public function getBlockedPositions() : Dictionary
      {
         var _loc2_:* = null;
         var _loc1_:Dictionary = new Dictionary();
         for each(_loc2_ in this._data.objects)
         {
            if(_loc2_.imgId > 0)
            {
               _loc1_[_loc2_.pos] = "taken";
            }
         }
         return _loc1_;
      }
      
      private function removeSelected() : void
      {
         var _loc1_:Array = this._data.objects;
         if(this.var_178 == null)
         {
            return;
         }
         var _loc2_:int = Util.remove(_loc1_,this.var_178);
         this.var_178 = null;
         if(_loc1_.length > 0)
         {
            this.var_178 = _loc1_[Math.min(_loc2_,_loc1_.length - 1)];
         }
      }
   }
}
