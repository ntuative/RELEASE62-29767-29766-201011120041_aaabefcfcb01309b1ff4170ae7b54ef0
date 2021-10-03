package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      private static const const_1166:int = 100;
      
      private static const const_1167:int = 200;
      
      private static const const_1169:int = 180;
      
      public static const const_926:int = 1;
      
      public static const const_426:int = 2;
      
      private static const const_1168:int = 250;
      
      private static const const_839:int = 5;
       
      
      private var var_681:BitmapData;
      
      private var var_312:Timer;
      
      private var var_13:IWindowContainer;
      
      private var var_826:BitmapData;
      
      private var var_313:Timer;
      
      private var var_71:IWindowContainer;
      
      private var var_1616:int = 2;
      
      private var _assets:IAssetLibrary;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         this.var_313 = new Timer(const_1168,1);
         this.var_312 = new Timer(const_1166,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         this.var_71 = param1;
         this.var_71.visible = false;
         this._assets = param2;
         this.var_313.addEventListener(TimerEvent.TIMER,this.onDisplayTimer);
         this.var_312.addEventListener(TimerEvent.TIMER,this.onHideTimer);
         var _loc3_:BitmapDataAsset = this._assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_826 = _loc3_.content as BitmapData;
         }
         _loc3_ = this._assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_681 = _loc3_.content as BitmapData;
         }
      }
      
      public function hide() : void
      {
         this.var_71.visible = false;
         this.var_312.reset();
         this.var_313.reset();
         if(this.var_13 != null)
         {
            this.var_13.removeChild(this.var_71);
         }
      }
      
      public function hideDelayed() : void
      {
         this.var_312.reset();
         this.var_313.reset();
         this.var_312.start();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         this.hide();
      }
      
      public function dispose() : void
      {
         if(this.var_313 != null)
         {
            this.var_313.removeEventListener(TimerEvent.TIMER,this.onDisplayTimer);
            this.var_313.stop();
            this.var_313 = null;
         }
         if(this.var_312 != null)
         {
            this.var_312.removeEventListener(TimerEvent.TIMER,this.onHideTimer);
            this.var_312.stop();
            this.var_312 = null;
         }
         this._assets = null;
         this.var_71 = null;
         this.var_13 = null;
         this.var_681 = null;
         this.var_826 = null;
      }
      
      public function showDelayed() : void
      {
         this.var_312.reset();
         this.var_313.reset();
         this.var_313.start();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.show();
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(this.var_71 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(this.var_13 != null)
         {
            this.var_13.removeChild(this.var_71);
         }
         this.var_13 = param1;
         this.var_1616 = param4;
         var _loc5_:ITextWindow = ITextWindow(this.var_71.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = this.var_71.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1169,param3.width),Math.min(const_1167,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (this.var_71.width - _loc6_.width) / 2;
            this.var_71.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(this.var_71 == null || this.var_71.disposed)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(this.var_71.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_926:
               _loc2_.bitmap = this.var_826.clone();
               _loc2_.width = this.var_826.width;
               _loc2_.height = this.var_826.height;
               _loc2_.y = (this.var_71.height - this.var_826.height) / 2;
               _loc2_.x = this.var_71.width - 1;
               break;
            case const_426:
               _loc2_.bitmap = this.var_681.clone();
               _loc2_.width = this.var_681.width;
               _loc2_.height = this.var_681.height;
               _loc2_.y = (this.var_71.height - this.var_681.height) / 2;
               _loc2_.x = -1 * this.var_681.width + 1;
         }
         _loc2_.invalidate();
      }
      
      public function show() : void
      {
         this.var_312.reset();
         this.var_313.reset();
         if(this.var_13 == null)
         {
            return;
         }
         this.var_71.visible = true;
         this.var_13.addChild(this.var_71);
         this.refreshArrow(this.var_1616);
         switch(this.var_1616)
         {
            case const_926:
               this.var_71.x = -1 * this.var_71.width - const_839;
               break;
            case const_426:
               this.var_71.x = this.var_13.width + const_839;
         }
         this.var_71.y = (this.var_13.height - this.var_71.height) / 2;
      }
   }
}
