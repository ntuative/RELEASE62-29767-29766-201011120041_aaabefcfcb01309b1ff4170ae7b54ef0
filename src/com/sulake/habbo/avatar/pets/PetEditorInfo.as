package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1967:Boolean;
      
      private var var_1968:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         this.var_1967 = Boolean(parseInt(param1.@club));
         this.var_1968 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return this.var_1967;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_1968;
      }
   }
}
