package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.display.BitmapData;
   
   public interface IAvatarImage extends IDisposable
   {
       
      
      function get petType() : int;
      
      function getAsset(param1:String) : BitmapDataAsset;
      
      function getSubType() : int;
      
      function getImage(param1:String, param2:Boolean) : BitmapData;
      
      function endActionAppends() : void;
      
      function getDirection() : int;
      
      function isPlaceholder() : Boolean;
      
      function getLayerData(param1:ISpriteDataContainer) : IAnimationLayerData;
      
      function get avatarSpriteData() : IAvatarDataContainer;
      
      function appendAction(param1:String, ... rest) : Boolean;
      
      function getCroppedImage(param1:String) : BitmapData;
      
      function initActionAppends() : void;
      
      function getScale() : String;
      
      function get petBreed() : int;
      
      function setDirectionAngle(param1:String, param2:int) : void;
      
      function updateAnimationByFrames(param1:int = 1) : void;
      
      function getCanvasOffsets() : Array;
      
      function getFigure() : AvatarFigureContainer;
      
      function isAnimating() : Boolean;
      
      function getPartColor(param1:String) : IPartColor;
      
      function setDirection(param1:String, param2:int) : void;
      
      function getSprites() : Array;
   }
}
