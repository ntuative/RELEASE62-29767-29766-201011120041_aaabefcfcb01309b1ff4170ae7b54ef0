package com.sulake.habbo.widget.furniture.dimmer
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class DimmerViewAlphaSlider
   {
       
      
      private var _view:DimmerView;
      
      private var var_2603:int;
      
      private var var_632:BitmapData;
      
      private var var_1021:int = 255;
      
      private var var_1484:int;
      
      private var _minValue:int = 0;
      
      private var _sliderContainer:IWindowContainer;
      
      private var var_633:BitmapData;
      
      public function DimmerViewAlphaSlider(param1:DimmerView, param2:IWindowContainer, param3:IAssetLibrary, param4:int = 0, param5:int = 255)
      {
         super();
         this._view = param1;
         this._sliderContainer = param2;
         this._minValue = param4;
         this.var_1021 = param5;
         this.storeAssets(param3);
         this.displaySlider();
      }
      
      private function buttonProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.const_58 && param1.type != WindowMouseEvent.const_180)
         {
            return;
         }
         this._view.selectedBrightness = this.getValue(param2.x);
      }
      
      private function displaySlider() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._sliderContainer == null)
         {
            return;
         }
         _loc2_ = this._sliderContainer.findChildByName("slider_base") as IBitmapWrapperWindow;
         if(_loc2_ != null && this.var_633 != null)
         {
            _loc2_.bitmap = new BitmapData(this.var_633.width,this.var_633.height,true,16777215);
            _loc2_.bitmap.copyPixels(this.var_633,this.var_633.rect,new Point(0,0),null,null,true);
         }
         _loc1_ = this._sliderContainer.findChildByName("slider_movement_area") as IWindowContainer;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.findChildByName("slider_button") as IBitmapWrapperWindow;
            if(_loc2_ != null && this.var_632 != null)
            {
               _loc2_.bitmap = new BitmapData(this.var_632.width,this.var_632.height,true,16777215);
               _loc2_.bitmap.copyPixels(this.var_632,this.var_632.rect,new Point(0,0),null,null,true);
               _loc2_.procedure = this.buttonProcedure;
               this.var_1484 = _loc1_.width - _loc2_.width;
            }
         }
      }
      
      private function storeAssets(param1:IAssetLibrary) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = BitmapDataAsset(param1.getAssetByName("dimmer_slider_base"));
         this.var_633 = BitmapData(_loc2_.content);
         _loc2_ = BitmapDataAsset(param1.getAssetByName("dimmer_slider_button"));
         this.var_632 = BitmapData(_loc2_.content);
      }
      
      public function set max(param1:Number) : void
      {
         this.var_1021 = param1;
         this.setValue(this._view.selectedBrightness);
      }
      
      public function dispose() : void
      {
         this._view = null;
         this._sliderContainer = null;
         this.var_633 = null;
         this.var_632 = null;
      }
      
      private function getSliderPosition(param1:int) : int
      {
         return int(this.var_1484 * (Number(param1 - this._minValue) / (this.var_1021 - this._minValue)));
      }
      
      public function set min(param1:Number) : void
      {
         this._minValue = param1;
         this.setValue(this._view.selectedBrightness);
      }
      
      public function setValue(param1:int) : void
      {
         if(this._sliderContainer == null)
         {
            return;
         }
         var _loc2_:IWindow = this._sliderContainer.findChildByName("slider_button");
         if(_loc2_ != null)
         {
            _loc2_.x = this.getSliderPosition(param1);
         }
      }
      
      private function getValue(param1:Number) : int
      {
         return int(param1 / this.var_1484 * (this.var_1021 - this._minValue)) + this._minValue;
      }
   }
}
