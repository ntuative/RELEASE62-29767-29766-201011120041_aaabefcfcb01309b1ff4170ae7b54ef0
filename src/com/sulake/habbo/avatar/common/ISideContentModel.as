package com.sulake.habbo.avatar.common
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   
   public interface ISideContentModel
   {
       
      
      function getWindowContainer() : IWindowContainer;
      
      function get controller() : HabboAvatarEditor;
      
      function reset() : void;
      
      function dispose() : void;
   }
}
