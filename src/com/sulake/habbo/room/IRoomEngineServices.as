package com.sulake.habbo.room
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.room.utils.LegacyWallGeometry;
   import com.sulake.habbo.room.utils.SelectedRoomObjectData;
   import com.sulake.habbo.room.utils.TileHeightMap;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectController;
   import flash.events.IEventDispatcher;
   
   public interface IRoomEngineServices extends IRoomObjectCreator
   {
       
      
      function getIsPlayingGame(param1:int, param2:int) : Boolean;
      
      function getTileCursor(param1:int, param2:int) : IRoomObjectController;
      
      function getSelectionArrow(param1:int, param2:int) : IRoomObjectController;
      
      function removeObjectMoverIconSprite() : void;
      
      function get connection() : IConnection;
      
      function setSelectedObjectData(param1:int, param2:int, param3:SelectedRoomObjectData) : void;
      
      function setPlacedObjectData(param1:int, param2:int, param3:SelectedRoomObjectData) : void;
      
      function get activeRoomId() : int;
      
      function getRoomObjectCategory(param1:String) : int;
      
      function getRoomObject(param1:int, param2:int, param3:int, param4:int) : IRoomObject;
      
      function getLegacyGeometry(param1:int, param2:int) : LegacyWallGeometry;
      
      function updateObjectRoomWindow(param1:int, param2:int, param3:int, param4:Boolean = true) : void;
      
      function setObjectMoverIconSpriteVisible(param1:Boolean) : void;
      
      function getTileHeightMap(param1:int, param2:int) : TileHeightMap;
      
      function get events() : IEventDispatcher;
      
      function getSelectedObjectData(param1:int, param2:int) : ISelectedRoomObjectData;
      
      function getPlacedObjectData(param1:int, param2:int) : ISelectedRoomObjectData;
      
      function setObjectMoverIconSprite(param1:int, param2:int, param3:Boolean, param4:String = null) : void;
      
      function get activeRoomCategory() : int;
   }
}
