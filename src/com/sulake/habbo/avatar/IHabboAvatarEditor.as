package com.sulake.habbo.avatar
{
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindowContainer;
   import flash.events.IEventDispatcher;
   
   public interface IHabboAvatarEditor extends IUnknown
   {
       
      
      function get events() : IEventDispatcher;
      
      function loadAvatarInEditor(param1:String, param2:String, param3:int = 0) : void;
      
      function close() : void;
      
      function openEditor(param1:IWindowContainer = null, param2:IHabboAvatarEditorDataSaver = null, param3:Array = null, param4:Boolean = false) : Boolean;
   }
}
