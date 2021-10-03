package com.sulake.habbo.avatar.animation
{
   public interface IAnimation
   {
       
      
      function get canvasData() : Array;
      
      function hasCanvasData() : Boolean;
      
      function hasShadowData() : Boolean;
      
      function hasRemoveData() : Boolean;
      
      function hasSpriteData() : Boolean;
      
      function get addData() : Array;
      
      function get removeData() : Array;
      
      function get spriteData() : Array;
      
      function hasAddData() : Boolean;
      
      function hasDirectionData() : Boolean;
      
      function get id() : String;
      
      function get description() : String;
      
      function hasAvatarData() : Boolean;
   }
}
