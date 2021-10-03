package com.sulake.habbo.roomevents.userdefinedroomevents
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   
   public interface Element
   {
       
      
      function get requiresFurni() : Boolean;
      
      function readStringParamFromForm(param1:IWindowContainer) : String;
      
      function get hasSpecialInputs() : Boolean;
      
      function onEditStart(param1:IWindowContainer, param2:Triggerable) : void;
      
      function get hasStateSnapshot() : Boolean;
      
      function get code() : int;
      
      function readIntParamsFromForm(param1:IWindowContainer) : Array;
      
      function onInit(param1:IWindowContainer, param2:HabboUserDefinedRoomEvents) : void;
   }
}
