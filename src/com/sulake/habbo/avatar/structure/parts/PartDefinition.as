package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2264:String;
      
      private var var_1617:int = -1;
      
      private var var_1618:Boolean;
      
      private var var_1619:String;
      
      private var var_2263:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2263 = String(param1["set-type"]);
         this.var_1619 = String(param1["flipped-set-type"]);
         this.var_2264 = String(param1["remove-set-type"]);
         this.var_1618 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1617 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1619;
      }
      
      public function get staticId() : int
      {
         return this.var_1617;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1617 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1618;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1618 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1619 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2263;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2264;
      }
   }
}
