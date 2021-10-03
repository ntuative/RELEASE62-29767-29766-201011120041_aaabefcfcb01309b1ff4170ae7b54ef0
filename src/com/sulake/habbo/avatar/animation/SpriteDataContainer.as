package com.sulake.habbo.avatar.animation
{
   public class SpriteDataContainer implements ISpriteDataContainer
   {
       
      
      private var _id:String;
      
      private var var_1956:IAnimation;
      
      private var var_1954:Boolean;
      
      private var var_1559:int;
      
      private var var_1182:Array;
      
      private var var_1955:String;
      
      private var _dx:Array;
      
      private var var_1181:Array;
      
      public function SpriteDataContainer(param1:IAnimation, param2:XML)
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         super();
         this.var_1956 = param1;
         this._id = String(param2.@id);
         this.var_1559 = parseInt(param2.@ink);
         this.var_1955 = String(param2.@member);
         this.var_1954 = Boolean(parseInt(param2.@directions));
         this._dx = [];
         this.var_1181 = [];
         this.var_1182 = [];
         for each(_loc3_ in param2.direction)
         {
            _loc4_ = parseInt(_loc3_.@id);
            this._dx[_loc4_] = parseInt(_loc3_.@dx);
            this.var_1181[_loc4_] = parseInt(_loc3_.@dy);
            this.var_1182[_loc4_] = parseInt(_loc3_.@dz);
         }
      }
      
      public function get animation() : IAnimation
      {
         return this.var_1956;
      }
      
      public function get hasDirections() : Boolean
      {
         return this.var_1954;
      }
      
      public function get member() : String
      {
         return this.var_1955;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function getDirectionOffsetZ(param1:int) : int
      {
         if(param1 < this.var_1182.length)
         {
            return this.var_1182[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetX(param1:int) : int
      {
         if(param1 < this._dx.length)
         {
            return this._dx[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetY(param1:int) : int
      {
         if(param1 < this.var_1181.length)
         {
            return this.var_1181[param1];
         }
         return 0;
      }
      
      public function get ink() : int
      {
         return this.var_1559;
      }
   }
}
