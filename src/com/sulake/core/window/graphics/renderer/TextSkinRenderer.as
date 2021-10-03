package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.utils.ITextFieldContainer;
   import com.sulake.core.window.utils.TextStyleManager;
   import flash.display.BitmapData;
   import flash.display.IBitmapDrawable;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class TextSkinRenderer extends SkinRenderer
   {
       
      
      protected var var_908:Matrix;
      
      public function TextSkinRenderer(param1:String)
      {
         super(param1);
         this.var_908 = new Matrix();
      }
      
      override public function parse(param1:IAsset, param2:XMLList, param3:IAssetLibrary) : void
      {
         var _loc4_:String = param1.content.toString();
         var _loc5_:Map = TextStyleManager.parseCSS(_loc4_);
         TextStyleManager.setStyle(_loc5_.getKey(0),_loc5_.getWithIndex(0));
      }
      
      override public function draw(param1:IWindow, param2:IBitmapDrawable, param3:Rectangle, param4:uint, param5:Boolean) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param2 != null)
         {
            _loc6_ = ITextFieldContainer(param1);
            _loc7_ = ITextWindow(param1).autoSize;
            _loc8_ = _loc6_.textField;
            this.var_908.tx = _loc6_.margins.left;
            this.var_908.ty = _loc6_.margins.top;
            if(_loc7_ == TextFieldAutoSize.RIGHT)
            {
               this.var_908.tx = Math.floor(param1.width - _loc8_.width);
            }
            else if(_loc7_ == TextFieldAutoSize.CENTER)
            {
               this.var_908.tx = Math.floor(param1.width / 2 - _loc8_.width / 2);
            }
            BitmapData(param2).draw(_loc8_,this.var_908,null,null,null,false);
         }
      }
      
      override public function isStateDrawable(param1:uint) : Boolean
      {
         return param1 == 0;
      }
   }
}
