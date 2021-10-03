package com.sulake.habbo.avatar.animation
{
   import flash.utils.Dictionary;
   
   public interface IAnimationManager
   {
       
      
      function getLayerData(param1:String, param2:int, param3:String) : IAnimationLayerData;
      
      function getAnimation(param1:String) : IAnimation;
      
      function get animations() : Dictionary;
   }
}
