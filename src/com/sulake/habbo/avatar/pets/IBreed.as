package com.sulake.habbo.avatar.pets
{
   public interface IBreed
   {
       
      
      function get id() : int;
      
      function get isSellable() : Boolean;
      
      function get patternId() : int;
      
      function get localizationKey() : String;
      
      function get avatarFigureString() : String;
   }
}
