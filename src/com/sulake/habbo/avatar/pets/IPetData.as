package com.sulake.habbo.avatar.pets
{
   public interface IPetData
   {
       
      
      function get colors() : Array;
      
      function get sellableBreeds() : Array;
      
      function get disableHeadTurn() : Boolean;
      
      function get scale() : String;
      
      function get name() : String;
      
      function get species() : int;
      
      function get breeds() : Array;
   }
}
