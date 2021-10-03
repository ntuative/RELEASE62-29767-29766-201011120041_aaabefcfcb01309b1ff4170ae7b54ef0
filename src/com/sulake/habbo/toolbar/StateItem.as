package com.sulake.habbo.toolbar
{
   public class StateItem
   {
       
      
      private var var_1169:Boolean;
      
      private var var_2301:String;
      
      private var _frames:XMLList;
      
      private var var_1283:String = "-1";
      
      private var var_490:String;
      
      private var var_170:int = 120;
      
      private var var_1425:String = "-1";
      
      private var var_1648:String;
      
      private var var_2300:Boolean;
      
      private var var_1647:String = "-1";
      
      private var _id:String;
      
      public function StateItem(param1:XML, param2:String)
      {
         super();
         this._id = param1.@id;
         if(param1.attribute("loop").length() > 0)
         {
            this.var_1169 = Boolean(param1.@loop);
         }
         if(param1.attribute("bounce").length() > 0)
         {
            this.var_2300 = Boolean(param1.@loop);
         }
         if(param1.attribute("timer").length() > 0)
         {
            this.var_170 = int(param1.@timer);
         }
         if(param1.attribute("namebase").length() > 0)
         {
            this.var_1648 = param1.@namebase;
         }
         else
         {
            this.var_1648 = param2;
         }
         if(param1.attribute("state_over").length() > 0)
         {
            this.var_1283 = param1.@state_over;
         }
         if(param1.attribute("nextState").length() > 0)
         {
            this.var_1425 = param1.@nextState;
         }
         else
         {
            this.var_1425 = this._id;
         }
         if(param1.attribute("state_default").length() > 0)
         {
            this.var_1647 = param1.@state_default;
         }
         if(param1.attribute("tooltip").length() > 0)
         {
            this.var_2301 = param1.@tooltip;
         }
         if(param1.attribute("background").length() > 0)
         {
            this.var_490 = param1.@background;
         }
         var _loc3_:XMLList = param1.elements("frame");
         if(_loc3_.length() > 0)
         {
            this._frames = _loc3_;
         }
      }
      
      public function get hasStateOver() : Boolean
      {
         return this.var_1283 != "-1";
      }
      
      public function get bounce() : Boolean
      {
         return this.var_2300;
      }
      
      public function get defaultState() : String
      {
         return this.var_1647;
      }
      
      public function get hasDefaultState() : Boolean
      {
         return this.var_1647 != "-1";
      }
      
      public function get tooltip() : String
      {
         return this.var_2301;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get timer() : int
      {
         return this.var_170;
      }
      
      public function get loop() : Boolean
      {
         return this.var_1169;
      }
      
      public function get nextState() : String
      {
         return this.var_1425;
      }
      
      public function get frames() : XMLList
      {
         return this._frames;
      }
      
      public function get background() : String
      {
         return this.var_490;
      }
      
      public function get stateOver() : String
      {
         return this.var_1283;
      }
      
      public function get nameBase() : String
      {
         return this.var_1648;
      }
   }
}
