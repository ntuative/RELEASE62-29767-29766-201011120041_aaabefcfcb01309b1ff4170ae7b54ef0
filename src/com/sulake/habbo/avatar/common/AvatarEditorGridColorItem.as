package com.sulake.habbo.avatar.common
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.window.enum.HabboIconType;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class AvatarEditorGridColorItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_62:IAvatarEditorCategoryModel;
      
      private var _window:IWindowContainer;
      
      private var var_903:IPartColor;
      
      private var var_1123:BitmapData;
      
      private var var_902:BitmapData;
      
      private var var_629:BitmapData;
      
      public function AvatarEditorGridColorItem(param1:IWindowContainer, param2:IAvatarEditorCategoryModel, param3:IPartColor)
      {
         super();
         this.var_62 = param2;
         this._window = param1;
         this._window.background = true;
         this.var_903 = param3;
         var _loc4_:BitmapDataAsset = param2.controller.assets.getAssetByName("editor_clr_40x32_1") as BitmapDataAsset;
         this.var_629 = _loc4_.content as BitmapData;
         var _loc5_:BitmapDataAsset = param2.controller.assets.getAssetByName("editor_clr_40x32_2") as BitmapDataAsset;
         this.var_1123 = _loc5_.content as BitmapData;
         var _loc6_:BitmapDataAsset = param2.controller.assets.getAssetByName("editor_clr_40x32_3") as BitmapDataAsset;
         this.var_902 = _loc6_.content as BitmapData;
         this.updateThumbData();
      }
      
      public function get isSelected() : Boolean
      {
         return this._isSelected;
      }
      
      public function get view() : IWindowContainer
      {
         return this._window;
      }
      
      public function get partColor() : IPartColor
      {
         return this.var_903;
      }
      
      private function updateThumbData() : void
      {
         var _loc5_:* = null;
         if(this._window == null)
         {
            return;
         }
         if(this._window.disposed)
         {
            return;
         }
         var _loc1_:IBitmapWrapperWindow = this._window.findChildByTag("BG_BORDER") as IBitmapWrapperWindow;
         if(_loc1_ != null)
         {
            _loc1_.bitmap = new BitmapData(this.var_629.width,this.var_629.height,true,0);
            _loc1_.bitmap.copyPixels(this.var_629,this.var_629.rect,new Point(0,0));
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByTag("COLOR_IMAGE") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = new BitmapData(this.var_1123.width,this.var_1123.height,true,0);
            _loc5_ = this.var_1123.clone();
            _loc5_.colorTransform(_loc5_.rect,this.var_903.colorTransform);
            _loc2_.bitmap.copyPixels(_loc5_,_loc5_.rect,new Point(0,0));
         }
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByTag("COLOR_CHOSEN") as IBitmapWrapperWindow;
         if(_loc3_ != null)
         {
            if(this._isSelected)
            {
               _loc3_.bitmap = new BitmapData(this.var_902.width,this.var_902.height,true,16777215);
               _loc3_.bitmap.copyPixels(this.var_902,this.var_902.rect,new Point(0,0),null,null,true);
               _loc3_.visible = true;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         var _loc4_:IIconWindow = this._window.findChildByTag("CLUB_ICON") as IIconWindow;
         if(_loc4_)
         {
            if(this.var_903)
            {
               switch(this.var_903.clubLevel)
               {
                  case HabboClubLevelEnum.const_46:
                     _loc4_.visible = false;
                     break;
                  case HabboClubLevelEnum.const_59:
                     _loc4_.style = HabboIconType.const_669;
                     _loc4_.visible = true;
                     break;
                  case HabboClubLevelEnum.const_53:
                     _loc4_.style = HabboIconType.const_680;
                     _loc4_.visible = true;
               }
            }
            else
            {
               _loc4_.visible = false;
            }
         }
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         this._isSelected = param1;
         this.updateThumbData();
      }
      
      public function dispose() : void
      {
         this.var_62 = null;
         if(this._window != null)
         {
            if(!this._window.disposed)
            {
               this._window.dispose();
            }
         }
         this._window = null;
         this.var_903 = null;
         this.var_629 = null;
         this.var_1123 = null;
         this.var_902 = null;
      }
   }
}
