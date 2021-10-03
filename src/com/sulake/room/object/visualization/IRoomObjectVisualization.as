package com.sulake.room.object.visualization
{
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public interface IRoomObjectVisualization
   {
       
      
      function initialize(param1:IRoomObjectVisualizationData) : Boolean;
      
      function get boundingRectangle() : Rectangle;
      
      function getImage(param1:int) : BitmapData;
      
      function get object() : IRoomObject;
      
      function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void;
      
      function getUpdateID() : int;
      
      function get image() : BitmapData;
      
      function getInstanceId() : int;
      
      function set object(param1:IRoomObject) : void;
      
      function dispose() : void;
   }
}
