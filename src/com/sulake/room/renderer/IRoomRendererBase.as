package com.sulake.room.renderer
{
   import com.sulake.room.object.IRoomObject;
   
   public interface IRoomRendererBase
   {
       
      
      function dispose() : void;
      
      function feedRoomObject(param1:IRoomObject) : void;
      
      function update(param1:uint) : void;
      
      function removeRoomObject(param1:int) : void;
      
      function reset() : void;
   }
}
