package com.sulake.habbo.avatar.structure.figure
{
   import com.sulake.core.utils.Map;
   
   public interface ISetType
   {
       
      
      function get partSets() : Map;
      
      function get paletteID() : int;
      
      function getPartSet(param1:int) : IFigurePartSet;
      
      function get type() : String;
      
      function isMandatory(param1:String, param2:int) : Boolean;
   }
}
