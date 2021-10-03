package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1919:Date;
      
      private var var_1423:Boolean = false;
      
      private var _type:int;
      
      private var var_599:BitmapData;
      
      private var var_354:Boolean = false;
      
      private var var_1422:int;
      
      private var var_758:int = 1;
      
      private var var_1167:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return this.var_599;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --this.var_758;
         if(this.var_758 < 0)
         {
            this.var_758 = 0;
         }
         this.var_1167 = this.var_1422;
         this.var_354 = false;
         this.var_1423 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         this._isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         this.var_1167 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_354;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         this.var_599 = param1;
      }
      
      public function get duration() : int
      {
         return this.var_1422;
      }
      
      public function get isInUse() : Boolean
      {
         return this.var_1423;
      }
      
      public function get effectsInInventory() : int
      {
         return this.var_758;
      }
      
      public function get iconImage() : BitmapData
      {
         return this.var_599;
      }
      
      public function get isSelected() : Boolean
      {
         return this._isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !this.var_354)
         {
            this.var_1919 = new Date();
         }
         this.var_354 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         this.var_758 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(this.var_354)
         {
            _loc1_ = this.var_1167 - (new Date().valueOf() - this.var_1919.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return this.var_1167;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         this.var_1423 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         this.var_1422 = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
