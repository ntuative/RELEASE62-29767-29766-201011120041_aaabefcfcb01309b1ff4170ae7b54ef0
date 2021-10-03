package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.utils.Map;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.text.StyleSheet;
   
   public class TextStyleManager
   {
      
      private static var var_210:IEventDispatcher = new EventDispatcher();
      
      public static const BOLD:String = "bold";
      
      private static var var_291:Map = new Map();
      
      public static const ITALIC:String = "italic";
      
      public static const const_1300:String = "regular";
       
      
      public function TextStyleManager()
      {
         var _loc1_:* = null;
         super();
         _loc1_ = new TextStyle();
         _loc1_.name = const_1300;
         _loc1_.color = "#0000ff";
         _loc1_.display = "none";
         _loc1_.fontSize = "9";
         _loc1_.fontFamily = "Courier";
         _loc1_.fontStyle = "normal";
         _loc1_.fontWeight = "normal";
         var_291[_loc1_.name] = _loc1_;
         _loc1_ = new TextStyle();
         _loc1_.name = ITALIC;
         _loc1_.color = "#00ff00";
         _loc1_.display = "none";
         _loc1_.fontSize = "9";
         _loc1_.fontFamily = "Courier";
         _loc1_.fontStyle = "italic";
         _loc1_.fontWeight = "normal";
         var_291[_loc1_.name] = _loc1_;
         _loc1_ = new TextStyle();
         _loc1_.name = BOLD;
         _loc1_.color = "#ff0000";
         _loc1_.display = "none";
         _loc1_.fontSize = "9";
         _loc1_.fontFamily = "Courier";
         _loc1_.fontStyle = "normal";
         _loc1_.fontWeight = "bold";
         var_291[_loc1_.name] = _loc1_;
      }
      
      public static function enumerateStyles() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.push(var_291.getWithIndex(_loc3_));
            _loc3_++;
         }
         return _loc1_;
      }
      
      public static function getStyleWithIndex(param1:int) : TextStyle
      {
         return var_291.getWithIndex(param1);
      }
      
      public static function setStyle(param1:String, param2:TextStyle) : void
      {
         var _loc3_:* = var_291.getKeys().indexOf(param1) == -1;
         param2.name = param1;
         var_291[param1] = param2;
         if(_loc3_)
         {
            var_210.dispatchEvent(new Event(Event.ADDED));
         }
         else
         {
            var_210.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public static function parseCSS(param1:String) : Map
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:StyleSheet = new StyleSheet();
         _loc2_.parseCSS(param1);
         var _loc3_:Array = _loc2_.styleNames;
         var _loc4_:Map = new Map();
         for each(_loc7_ in _loc3_)
         {
            _loc5_ = _loc2_.getStyle(_loc7_);
            _loc6_ = new TextStyle();
            _loc6_.name = _loc7_;
            _loc6_.color = !!_loc5_.color ? uint(String(_loc5_.color).replace("#","0x")) : null;
            _loc6_.fontFamily = !!_loc5_.fontFamily ? _loc5_.fontFamily : null;
            _loc6_.fontSize = !!_loc5_.fontSize ? parseInt(String(_loc5_.fontSize)) : null;
            _loc6_.fontStyle = !!_loc5_.fontStyle ? _loc5_.fontStyle : null;
            _loc6_.fontWeight = !!_loc5_.fontWeight ? _loc5_.fontWeight : null;
            _loc6_.kerning = !!_loc5_.kerning ? _loc5_.kerning == "true" : null;
            _loc6_.leading = !!_loc5_.leading ? parseInt(String(_loc5_.leading)) : null;
            _loc6_.letterSpacing = !!_loc5_.letterSpacing ? parseInt(_loc5_.letterSpacing.toString()) : null;
            _loc6_.textDecoration = !!_loc5_.textDecoration ? _loc5_.textDecoration : null;
            _loc6_.textIndent = !!_loc5_.textIndent ? parseInt(_loc5_.textIndent.toString()) : null;
            _loc4_[_loc7_] = _loc6_;
         }
         return _loc4_;
      }
      
      public static function get events() : IEventDispatcher
      {
         return var_210;
      }
      
      public static function getStyle(param1:String) : TextStyle
      {
         return var_291[param1].getStyle(param1);
      }
   }
}
