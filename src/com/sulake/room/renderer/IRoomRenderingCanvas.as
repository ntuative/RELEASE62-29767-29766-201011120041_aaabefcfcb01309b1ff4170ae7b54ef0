package com.sulake.room.renderer
{
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.DisplayObject;
   
   public interface IRoomRenderingCanvas
   {
       
      
      function get displayObject() : DisplayObject;
      
      function get width() : int;
      
      function get height() : int;
      
      function set mouseListener(param1:IRoomRenderingCanvasMouseListener) : void;
      
      function set useMask(param1:Boolean) : void;
      
      function initialize(param1:int, param2:int) : void;
      
      function set screenOffsetX(param1:int) : void;
      
      function set screenOffsetY(param1:int) : void;
      
      function render(param1:int) : void;
      
      function get screenOffsetX() : int;
      
      function get screenOffsetY() : int;
      
      function handleMouseEvent(param1:int, param2:int, param3:String, param4:Boolean, param5:Boolean, param6:Boolean, param7:Boolean) : Boolean;
      
      function get geometry() : IRoomGeometry;
   }
}
