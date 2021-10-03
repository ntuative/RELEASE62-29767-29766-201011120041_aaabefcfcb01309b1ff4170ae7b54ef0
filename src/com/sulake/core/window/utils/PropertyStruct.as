package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_232:String = "Rectangle";
      
      public static const const_49:String = "Boolean";
      
      public static const const_230:String = "Number";
      
      public static const const_54:String = "int";
      
      public static const const_91:String = "String";
      
      public static const const_245:String = "Point";
      
      public static const const_138:String = "Array";
      
      public static const const_253:String = "uint";
      
      public static const const_170:String = "hex";
      
      public static const const_203:String = "Map";
       
      
      private var var_544:String;
      
      private var var_156:Object;
      
      private var var_2578:Boolean;
      
      private var _type:String;
      
      private var var_2194:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         this.var_544 = param1;
         this.var_156 = param2;
         this._type = param3;
         this.var_2194 = param4;
         this.var_2578 = param3 == const_203 || param3 == const_138 || param3 == const_245 || param3 == const_232;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function toString() : String
      {
         switch(this._type)
         {
            case const_170:
               return "0x" + uint(this.var_156).toString(16);
            case const_49:
               return Boolean(this.var_156) == true ? "true" : "false";
            case const_245:
               return "Point(" + Point(this.var_156).x + ", " + Point(this.var_156).y + ")";
            case const_232:
               return "Rectangle(" + Rectangle(this.var_156).x + ", " + Rectangle(this.var_156).y + ", " + Rectangle(this.var_156).width + ", " + Rectangle(this.var_156).height + ")";
            default:
               return String(this.value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(this._type)
         {
            case const_203:
               _loc3_ = this.var_156 as Map;
               _loc1_ = "<var key=\"" + this.var_544 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_138:
               _loc4_ = this.var_156 as Array;
               _loc1_ = "<var key=\"" + this.var_544 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_245:
               _loc5_ = this.var_156 as Point;
               _loc1_ = "<var key=\"" + this.var_544 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_232:
               _loc6_ = this.var_156 as Rectangle;
               _loc1_ = "<var key=\"" + this.var_544 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_170:
               _loc1_ = "<var key=\"" + this.var_544 + "\" value=\"" + "0x" + uint(this.var_156).toString(16) + "\" type=\"" + this._type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + this.var_544 + "\" value=\"" + this.var_156 + "\" type=\"" + this._type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return this.var_156;
      }
      
      public function get valid() : Boolean
      {
         return this.var_2194;
      }
      
      public function get key() : String
      {
         return this.var_544;
      }
   }
}
