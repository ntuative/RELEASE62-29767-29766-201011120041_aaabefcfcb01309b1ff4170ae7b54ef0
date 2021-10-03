package com.sulake.core.window.utils
{
   public class TextStyle
   {
      
      public static const ITALIC:String = "italic";
      
      public static const BOLD:String = "bold";
      
      public static const NORMAL:String = "normal";
      
      public static const NONE:String = "none";
      
      public static const const_957:String = "underline";
       
      
      public var fontStyle:String = null;
      
      public var color:Object;
      
      public var fontWeight:String = null;
      
      public var name:String;
      
      public var kerning:Object = null;
      
      public var fontSize:Object = null;
      
      public var fontFamily:String;
      
      public var leading:Object = null;
      
      public var textIndent:Object = null;
      
      public var letterSpacing:Object = null;
      
      public var textDecoration:String = null;
      
      public function TextStyle()
      {
         super();
      }
      
      public function toString() : String
      {
         var _loc1_:String = "";
         _loc1_ += this.name + " {\n";
         if(this.color)
         {
            _loc1_ += "\tcolor: #" + this.color.toString(16) + ";\n";
         }
         if(this.fontFamily)
         {
            _loc1_ += "\tfont-family: " + this.fontFamily + ";\n";
         }
         if(this.fontSize)
         {
            _loc1_ += "\tfont-size: " + this.fontSize + ";\n";
         }
         if(this.fontStyle)
         {
            _loc1_ += "\tfont-style: " + this.fontStyle + ";\n";
         }
         if(this.fontWeight)
         {
            _loc1_ += "\tfont-weight: " + this.fontWeight + ";\n";
         }
         if(this.kerning)
         {
            _loc1_ += "\tkerning: " + this.kerning + ";\n";
         }
         if(this.leading)
         {
            _loc1_ += "\tleading: " + this.leading + ";\n";
         }
         if(this.letterSpacing)
         {
            _loc1_ += "\tletter-spacing: " + this.letterSpacing + ";\n";
         }
         if(this.textDecoration)
         {
            _loc1_ += "\ttext-decoration: " + this.textDecoration + ";\n";
         }
         if(this.textIndent)
         {
            _loc1_ += "\ttext-indent: " + this.textIndent + ";\n";
         }
         return _loc1_ + "}";
      }
   }
}
