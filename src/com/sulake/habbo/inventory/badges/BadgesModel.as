package com.sulake.habbo.inventory.badges
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.inventory.badges.GetBadgesComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.badges.SetActivatedBadgesComposer;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.Event;
   
   public class BadgesModel implements IInventoryModel
   {
       
      
      private var _view:BadgesView;
      
      private var _disposed:Boolean = false;
      
      private var var_836:Array;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assets:IAssetLibrary;
      
      private var var_379:ISessionDataManager;
      
      private var var_233:Array;
      
      private var _controller:HabboInventory;
      
      private const const_1772:int = 5;
      
      private var _communication:IHabboCommunicationManager;
      
      public function BadgesModel(param1:HabboInventory, param2:IHabboWindowManager, param3:IHabboCommunicationManager, param4:IAssetLibrary, param5:IHabboLocalizationManager, param6:ISessionDataManager)
      {
         super();
         this._controller = param1;
         this._windowManager = param2;
         this.var_233 = new Array();
         this.var_836 = new Array();
         this._assets = param4;
         this._communication = param3;
         this.var_379 = param6;
         this.var_379.events.addEventListener(BadgeImageReadyEvent.const_125,this.onBadgeImageReady);
         this._view = new BadgesView(this,param2,param4,param5);
      }
      
      private function stopWearingBadge(param1:Badge) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.var_836.length)
         {
            if(this.var_836[_loc2_] == param1)
            {
               this.var_836.splice(_loc2_,1);
               param1.isInUse = false;
               return;
            }
            _loc2_++;
         }
      }
      
      public function saveBadgeSelection() : void
      {
         var _loc4_:* = null;
         var _loc1_:SetActivatedBadgesComposer = new SetActivatedBadgesComposer();
         var _loc2_:Array = this.getBadges(1);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_];
            _loc1_.addActivatedBadge(_loc4_.type);
            _loc3_++;
         }
         this._communication.getHabboMainConnection(null).send(_loc1_);
      }
      
      public function updateView() : void
      {
         this._view.updateAll();
      }
      
      public function getSelectedBadge(param1:int = -1) : Badge
      {
         var _loc4_:* = null;
         var _loc2_:Array = this.getBadges(param1);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_];
            if(_loc4_.isSelected)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
         this._communication.getHabboMainConnection(null).send(new GetBadgesComposer());
      }
      
      public function getMaxActiveCount() : int
      {
         return this.const_1772;
      }
      
      public function setBadgeSelected(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_233.length)
         {
            _loc2_ = this.var_233[_loc3_] as Badge;
            if(_loc2_ != null)
            {
               if(_loc2_.type == param1)
               {
                  _loc2_.isSelected = true;
               }
               else
               {
                  _loc2_.isSelected = false;
               }
            }
            _loc3_++;
         }
         this.updateView();
      }
      
      public function getBadgeFromActive(param1:int) : Badge
      {
         return this.getItemInIndex(param1,1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function onBadgeImageReady(param1:BadgeImageReadyEvent) : void
      {
         var _loc2_:Badge = this.getBadge(param1.badgeId);
         if(_loc2_ != null)
         {
            _loc2_.iconImage = param1.badgeImage.clone();
            this.updateView();
         }
      }
      
      public function subCategorySwitch(param1:String) : void
      {
      }
      
      public function getBadges(param1:int = -1) : Array
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         switch(param1)
         {
            case -1:
               return this.var_233;
            case 0:
               _loc2_ = new Array();
               _loc3_ = 0;
               while(_loc3_ < this.var_233.length)
               {
                  if((this.var_233[_loc3_] as Badge).isInUse == false)
                  {
                     _loc2_.push(this.var_233[_loc3_]);
                  }
                  _loc3_++;
               }
               return _loc2_;
            case 1:
               return this.var_836;
            default:
               trace("Unexpected filter. Returning an empty array to maintain backward compatibility");
               return new Array();
         }
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._controller = null;
            if(this._view != null)
            {
               this._view.dispose();
            }
            this._assets = null;
            this._communication = null;
            if(this.var_379 != null)
            {
               this.var_379.events.removeEventListener(BadgeImageReadyEvent.const_125,this.onBadgeImageReady);
               this.var_379 = null;
            }
            this._disposed = true;
         }
      }
      
      public function getBadgeFromInactive(param1:int) : Badge
      {
         return this.getItemInIndex(param1,0);
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return this._view.getWindowContainer();
      }
      
      public function categorySwitch(param1:String) : void
      {
         if(param1 == InventoryCategory.const_279 && this._controller.isVisible)
         {
            this._controller.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_BADGES));
         }
      }
      
      public function toggleBadgeWearing(param1:String) : void
      {
         var _loc2_:Badge = this.getBadge(param1);
         if(_loc2_ != null)
         {
            if(_loc2_.isInUse)
            {
               this.stopWearingBadge(_loc2_);
            }
            else
            {
               this.startWearingBadge(_loc2_);
            }
            this.saveBadgeSelection();
         }
      }
      
      public function updateBadge(param1:String, param2:Boolean) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc3_:Badge = this.getBadge(param1);
         var _loc4_:Boolean = false;
         if(_loc3_ != null)
         {
            if(_loc3_.isInUse != param2)
            {
               if(param2)
               {
                  this.startWearingBadge(_loc3_);
               }
               else
               {
                  this.stopWearingBadge(_loc3_);
               }
               _loc4_ = true;
            }
         }
         else
         {
            _loc5_ = this._assets.getAssetByName("inventory_thumb_xml");
            _loc6_ = XmlAsset(_loc5_);
            _loc7_ = this._windowManager.buildFromXML(XML(_loc6_.content)) as IWindowContainer;
            _loc8_ = new Badge(param1,_loc7_);
            _loc8_.iconImage = this.var_379.getBadgeImage(param1);
            this.var_233.push(_loc8_);
            if(param2)
            {
               this.startWearingBadge(_loc8_);
            }
            _loc4_ = true;
         }
      }
      
      public function forceSelection() : void
      {
         var _loc1_:* = null;
         _loc1_ = this.getSelectedBadge();
         if(_loc1_ != null)
         {
            return;
         }
         var _loc2_:Array = this.getBadges(0);
         if(_loc2_ != null && _loc2_.length > 0)
         {
            _loc1_ = _loc2_[0] as Badge;
            _loc1_.isSelected = true;
            this.updateView();
            return;
         }
         var _loc3_:Array = this.getBadges(1);
         if(_loc3_ != null && _loc3_.length > 0)
         {
            _loc1_ = _loc3_[0] as Badge;
            _loc1_.isSelected = true;
            this.updateView();
            return;
         }
      }
      
      private function startWearingBadge(param1:Badge) : void
      {
         this.var_836.push(param1);
         param1.isInUse = true;
      }
      
      public function getItemInIndex(param1:int, param2:int = -1) : Badge
      {
         var _loc3_:Array = this.getBadges(param2);
         if(param1 < 0 || param1 >= _loc3_.length)
         {
            return null;
         }
         return _loc3_[param1];
      }
      
      private function getBadge(param1:String) : Badge
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_233.length)
         {
            _loc3_ = this.var_233[_loc2_];
            if(_loc3_.type == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function closingInventoryView() : void
      {
      }
      
      public function removeBadge(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_233.length)
         {
            _loc3_ = this.var_233[_loc2_];
            if(_loc3_.type == param1)
            {
               this.var_233.splice(_loc2_,1);
               this.stopWearingBadge(_loc3_);
               this.updateView();
               return;
            }
            _loc2_++;
         }
      }
   }
}
