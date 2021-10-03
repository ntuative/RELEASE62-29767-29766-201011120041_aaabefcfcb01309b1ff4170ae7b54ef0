package com.sulake.habbo.avatar.common
{
   import com.sulake.core.window.IWindowContainer;
   
   public interface IAvatarEditorCategoryView
   {
       
      
      function init() : void;
      
      function switchCategory(param1:String) : void;
      
      function showPalettes(param1:String, param2:int) : void;
      
      function dispose() : void;
      
      function getWindowContainer() : IWindowContainer;
      
      function reset() : void;
   }
}
