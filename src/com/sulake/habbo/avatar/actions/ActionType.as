package com.sulake.habbo.avatar.actions
{
   public class ActionType
   {
       
      
      private var _id:int;
      
      private var var_156:int;
      
      private var var_2453:Boolean = true;
      
      private var _prevents:Array;
      
      public function ActionType(param1:XML)
      {
         this._prevents = [];
         super();
         this._id = parseInt(param1.@value);
         this.var_156 = parseInt(param1.@value);
         var _loc2_:String = String(param1.@prevents);
         if(_loc2_ != "")
         {
            this._prevents = _loc2_.split(",");
         }
         this.var_2453 = String(param1.@preventheadturn) == "true";
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get prevents() : Array
      {
         return this._prevents;
      }
      
      public function get value() : int
      {
         return this.var_156;
      }
      
      public function get preventHeadTurn() : Boolean
      {
         return this.var_2453;
      }
   }
}
