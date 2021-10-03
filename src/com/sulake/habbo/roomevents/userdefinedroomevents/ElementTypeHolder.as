package com.sulake.habbo.roomevents.userdefinedroomevents
{
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
   
   public interface ElementTypeHolder
   {
       
      
      function getKey() : String;
      
      function getElementByCode(param1:int) : Element;
      
      function acceptTriggerable(param1:Triggerable) : Boolean;
   }
}
