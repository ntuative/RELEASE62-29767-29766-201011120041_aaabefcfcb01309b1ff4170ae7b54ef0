package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_74:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_243:Vector3d = null;
      
      private var var_1853:int = 0;
      
      private var var_1883:String = null;
      
      private var _category:int = 0;
      
      private var var_1884:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         this._id = param1;
         this._category = param2;
         this.var_1884 = param3;
         this.var_74 = new Vector3d();
         this.var_74.assign(param4);
         this.var_243 = new Vector3d();
         this.var_243.assign(param5);
         this.var_1853 = param6;
         this.var_1883 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return this.var_74;
      }
      
      public function get typeId() : int
      {
         return this.var_1853;
      }
      
      public function get dir() : Vector3d
      {
         return this.var_243;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get instanceData() : String
      {
         return this.var_1883;
      }
      
      public function get operation() : String
      {
         return this.var_1884;
      }
      
      public function dispose() : void
      {
         this.var_74 = null;
         this.var_243 = null;
      }
      
      public function get category() : int
      {
         return this._category;
      }
   }
}
