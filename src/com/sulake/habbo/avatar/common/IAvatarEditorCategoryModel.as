package com.sulake.habbo.avatar.common
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   
   public interface IAvatarEditorCategoryModel
   {
       
      
      function hasClubItemsOverLevel(param1:int) : Boolean;
      
      function switchCategory(param1:String) : void;
      
      function stripClubItemsOverLevel(param1:int) : Boolean;
      
      function dispose() : void;
      
      function selectPart(param1:String, param2:int) : void;
      
      function selectColor(param1:String, param2:int, param3:int) : void;
      
      function getWindowContainer() : IWindowContainer;
      
      function get controller() : HabboAvatarEditor;
      
      function getCategoryData(param1:String) : CategoryData;
      
      function reset() : void;
   }
}
