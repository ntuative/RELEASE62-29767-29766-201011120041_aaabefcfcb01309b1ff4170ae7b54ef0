package com.sulake.habbo.avatar.pets
{
   import flash.geom.ColorTransform;
   
   public class PetColor extends PetEditorInfo implements IPetColor
   {
       
      
      private var _id:int;
      
      private var var_1624:uint;
      
      private var _rgb:uint;
      
      private var var_2315:int;
      
      private var var_1626:Number;
      
      private var _b:uint;
      
      private var var_1623:Number;
      
      private var var_1627:uint;
      
      private var var_1386:ColorTransform;
      
      private var var_1625:Number;
      
      public function PetColor(param1:XML)
      {
         super(param1);
         this._id = parseInt(param1.@id);
         var _loc2_:String = param1.text();
         this._rgb = parseInt(_loc2_,16);
         this.var_1624 = this._rgb >> 16 & 255;
         this.var_1627 = this._rgb >> 8 & 255;
         this._b = this._rgb >> 0 & 255;
         this.var_1625 = this.var_1624 / 255 * 1;
         this.var_1623 = this.var_1627 / 255 * 1;
         this.var_1626 = this._b / 255 * 1;
         this.var_1386 = new ColorTransform(this.var_1625,this.var_1623,this.var_1626);
      }
      
      public function set figurePartPaletteColorId(param1:int) : void
      {
         this.var_2315 = param1;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this.var_1386;
      }
      
      public function get rgb() : uint
      {
         return this._rgb;
      }
      
      public function get figurePartPaletteColorId() : int
      {
         return this.var_2315;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get g() : uint
      {
         return this.var_1627;
      }
      
      public function get b() : uint
      {
         return this._b;
      }
      
      public function get r() : uint
      {
         return this.var_1624;
      }
   }
}
