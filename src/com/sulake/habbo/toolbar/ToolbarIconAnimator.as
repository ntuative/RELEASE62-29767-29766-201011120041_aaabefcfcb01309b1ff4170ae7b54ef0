package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class ToolbarIconAnimator
   {
       
      
      private var var_1169:Boolean;
      
      private var var_761:BitmapData;
      
      private var _state:String;
      
      private var var_1425:String;
      
      private var var_764:Array;
      
      private var _frame:int;
      
      private var var_763:Array;
      
      private var var_2559:Number;
      
      private var var_2560:Number;
      
      private var var_762:int;
      
      public function ToolbarIconAnimator(param1:StateItem, param2:IAssetLibrary, param3:IBitmapWrapperWindow, param4:Number, param5:Number, param6:BitmapData = null)
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         super();
         if(param1 == null || param2 == null || param3 == null)
         {
            return;
         }
         this.var_2559 = param4;
         this.var_2560 = param5;
         this._frame = 0;
         this.var_762 = 0;
         this.var_764 = new Array();
         this.var_763 = new Array();
         this._state = param1.id;
         this.var_1425 = param1.nextState;
         this.var_1169 = param1.loop;
         if(param1.background != null)
         {
            this.var_761 = this.getBitmapDataFromAsset(param1.background,param2);
         }
         var _loc9_:XMLList = param1.frames;
         if(_loc9_.length() > 0)
         {
            _loc10_ = 0;
            while(_loc10_ < _loc9_.length())
            {
               _loc11_ = _loc9_[_loc10_];
               _loc7_ = "icon_" + param1.nameBase + "_" + _loc11_.@id;
               _loc11_.@assetName = _loc7_;
               _loc8_ = this.getBitmapDataFromAsset(_loc7_,param2);
               if(_loc8_ != null)
               {
                  this.var_764.push(_loc11_);
                  this.var_763.push(_loc8_);
               }
               _loc10_++;
            }
         }
         else
         {
            _loc7_ = "icon_" + param1.nameBase + "_0";
            _loc8_ = this.getBitmapDataFromAsset(_loc7_,param2);
            if(_loc8_ != null)
            {
               this.var_764.push(new XML());
               this.var_763.push(_loc8_);
            }
         }
         if(param6 != null)
         {
            this.var_763[this._frame] = param6.clone();
         }
         this.updateAssetInWindow(param3);
      }
      
      public function update(param1:IBitmapWrapperWindow) : void
      {
         if(this.var_1169 == true || this.var_762 == 0)
         {
            if(this.var_764.length > 0)
            {
               ++this._frame;
               if(this._frame >= this.var_764.length)
               {
                  this._frame = 0;
                  ++this.var_762;
               }
            }
            if(this.var_1169 == true || this.var_762 == 0)
            {
               this.updateAssetInWindow(param1);
            }
         }
      }
      
      public function get nextState() : String
      {
         return this.var_1425;
      }
      
      public function get frameCount() : int
      {
         return this.var_764.length;
      }
      
      public function hasNextState() : Boolean
      {
         return this.var_1169 == false && this.var_762 == 1 && this.var_1425 != this._state;
      }
      
      private function setAsset(param1:IBitmapWrapperWindow, param2:BitmapData) : void
      {
         var _loc3_:* = null;
         if(this.var_761 != null)
         {
            _loc3_ = new BitmapData(Math.max(param2.width,this.var_761.width),Math.max(param2.height,this.var_761.height));
            _loc3_.copyPixels(this.var_761,this.var_761.rect,new Point(0,0));
            _loc3_.copyPixels(param2,param2.rect,new Point((_loc3_.width - param2.width) / 2,(_loc3_.height - param2.height) / 2),null,null,true);
         }
         else
         {
            _loc3_ = param2.clone();
         }
         param1.width = _loc3_.width;
         param1.height = _loc3_.height;
         param1.bitmap = _loc3_;
      }
      
      private function getBitmapDataFromAsset(param1:String, param2:IAssetLibrary) : BitmapData
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param2.hasAsset(param1))
         {
            _loc3_ = param2.getAssetByName(param1) as BitmapDataAsset;
            if(_loc3_ != null)
            {
               return (_loc3_.content as BitmapData).clone();
            }
         }
         return null;
      }
      
      private function updateAssetInWindow(param1:IBitmapWrapperWindow) : void
      {
         var _loc2_:* = null;
         if(this._frame <= this.var_763.length)
         {
            _loc2_ = this.var_763[this._frame];
            if(_loc2_ != null && param1 != null && _loc2_ is BitmapData)
            {
               this.setAsset(param1,_loc2_);
            }
         }
      }
   }
}
