package com.sulake.habbo.inventory.achievements
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementData;
   import com.sulake.habbo.inventory.IInventoryView;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class AchievementsView implements IInventoryView
   {
       
      
      private var _view:IWindowContainer;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _disposed:Boolean = false;
      
      private var var_379:ISessionDataManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_62:AchievementsModel;
      
      private var var_369:Timer;
      
      private var var_1027:Dictionary;
      
      private var var_54:IItemListWindow;
      
      private var _localization:IHabboLocalizationManager;
      
      public function AchievementsView(param1:AchievementsModel, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager, param5:ISessionDataManager)
      {
         this.var_1027 = new Dictionary();
         super();
         this.var_62 = param1;
         this._assetLibrary = param3;
         this._windowManager = param2;
         this.var_379 = param5;
         this._localization = param4;
         var _loc6_:IAsset = this._assetLibrary.getAssetByName("inventory_achievements_xml");
         var _loc7_:XmlAsset = XmlAsset(_loc6_);
         var _loc8_:ICoreWindowManager = ICoreWindowManager(this._windowManager);
         this._view = IWindowContainer(_loc8_.buildFromXML(XML(_loc7_.content)));
         this._view.visible = false;
         this.var_54 = IItemListWindow(this._view.getChildByName("achievements_itemlist"));
         this.var_369 = new Timer(1000,1);
         this.var_369.addEventListener(TimerEvent.TIMER,this.doBadgeRefresh);
         this.var_379.events.addEventListener(BadgeImageReadyEvent.const_125,this.onBadgeImageReady);
      }
      
      public static function hideChildren(param1:IWindowContainer) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            param1.getChildAt(_loc2_).visible = false;
            _loc2_++;
         }
      }
      
      public function updateList() : void
      {
         var _loc3_:Boolean = false;
         if(this._view == null)
         {
            return;
         }
         if(this._view.disposed)
         {
            return;
         }
         var _loc1_:Array = this.var_62.getAchievements();
         this.var_54.autoArrangeItems = false;
         var _loc2_:int = 0;
         while(true)
         {
            if(_loc2_ < _loc1_.length)
            {
               this.refreshEntry(true,_loc2_,_loc1_[_loc2_]);
            }
            else
            {
               _loc3_ = this.refreshEntry(false,_loc2_,null);
               if(_loc3_)
               {
                  break;
               }
            }
            _loc2_++;
         }
         this.var_54.autoArrangeItems = true;
      }
      
      public function onBadgeImageReady(param1:BadgeImageReadyEvent) : void
      {
         Logger.log("Got badge: " + param1.badgeId + ", " + this.var_369.running);
         this.var_1027[param1.badgeId] = param1.badgeImage;
         if(!this.var_369.running)
         {
            this.var_369.start();
         }
      }
      
      private function refreshBadgeImage(param1:IWindowContainer, param2:AchievementData) : void
      {
         var _loc3_:IBitmapWrapperWindow = param1.findChildByName("achievement_image") as IBitmapWrapperWindow;
         var _loc4_:BitmapData = this.var_1027[param2.badgeId];
         if(_loc4_ == null)
         {
            _loc4_ = this.var_379.getBadgeImage(param2.badgeId);
            this.var_1027[param2.badgeId] = _loc4_;
         }
         var _loc5_:Point = new Point((_loc3_.width - _loc4_.width) / 2,(_loc3_.height - _loc4_.height) / 2);
         _loc3_.bitmap.copyPixels(_loc4_,_loc4_.rect,_loc5_,null,null,false);
         _loc3_.visible = true;
      }
      
      private function refreshEntry(param1:Boolean, param2:int, param3:AchievementData) : Boolean
      {
         var _loc4_:IWindowContainer = IWindowContainer(this.var_54.getListItemAt(param2));
         if(_loc4_ == null)
         {
            if(!param1)
            {
               return true;
            }
            _loc4_ = this.getListEntry(param2);
            this.var_54.addListItem(_loc4_);
         }
         hideChildren(_loc4_);
         if(param1)
         {
            this.refreshEntryDetails(_loc4_,param3);
            _loc4_.visible = true;
         }
         else
         {
            _loc4_.height = 0;
            _loc4_.visible = false;
         }
         return false;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._windowManager = null;
            this.var_62 = null;
            this._view = null;
            this.var_54 = null;
            this._assetLibrary = null;
            this._localization = null;
            this.var_1027 = null;
            if(this.var_379 != null)
            {
               this.var_379.events.removeEventListener(BadgeImageReadyEvent.const_125,this.onBadgeImageReady);
               this.var_379 = null;
            }
            if(this.var_369)
            {
               this.var_369.removeEventListener(TimerEvent.TIMER,this.doBadgeRefresh);
               this.var_369.reset();
               this.var_369 = null;
            }
            this._disposed = true;
         }
      }
      
      private function doBadgeRefresh(param1:TimerEvent) : void
      {
         this.var_369.reset();
         this.updateList();
         Logger.log("Now updating list...");
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function refreshEntryDetails(param1:IWindowContainer, param2:AchievementData) : void
      {
         var _loc9_:* = null;
         this.refreshBadgeImage(param1,param2);
         var _loc3_:ITextWindow = param1.findChildByName("achievement_name") as ITextWindow;
         _loc3_.text = "${badge_name_" + param2.badgeId + "}";
         _loc3_.visible = true;
         var _loc4_:ITextWindow = param1.findChildByName("achievement_description") as ITextWindow;
         var _loc5_:String = "badge_desc_" + param2.badgeId;
         var _loc6_:String = this._localization.getRawValue(_loc5_);
         if(_loc6_)
         {
            _loc9_ = /%limit%/gim;
            _loc6_ = _loc6_.replace(_loc9_,"" + param2.scoreLimit);
            _loc4_.text = _loc6_;
            _loc4_.visible = true;
         }
         var _loc7_:String = this._localization.getKey("inventory.achievements.unit." + param2.type,"");
         var _loc8_:ITextWindow = param1.findChildByName("achievement_details") as ITextWindow;
         this._localization.registerParameter("inventory.achievements.entrydetails","currentpoints","" + param2.currentPoints);
         this._localization.registerParameter("inventory.achievements.entrydetails","scorelimit","" + param2.scoreLimit);
         this._localization.registerParameter("inventory.achievements.entrydetails","levelrewardpoints","" + param2.levelRewardPoints);
         this._localization.registerParameter("inventory.achievements.entrydetails","unit","" + _loc7_);
         _loc8_.text = this._localization.getKey("inventory.achievements.entrydetails");
         _loc8_.visible = true;
         _loc4_.height = _loc4_.textHeight + 5;
         _loc8_.height = _loc8_.textHeight + 5;
         _loc8_.y = _loc4_.y + _loc4_.height;
         param1.height = _loc8_.y + _loc8_.height + 5;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(this._view == null)
         {
            return null;
         }
         if(this._view.disposed)
         {
            return null;
         }
         return this._view;
      }
      
      private function getListEntry(param1:int) : IWindowContainer
      {
         var _loc2_:IAsset = this._assetLibrary.getAssetByName("inventory_achievement_item_xml");
         var _loc3_:XmlAsset = XmlAsset(_loc2_);
         var _loc4_:ICoreWindowManager = ICoreWindowManager(this._windowManager);
         var _loc5_:IWindowContainer = IWindowContainer(_loc4_.buildFromXML(XML(_loc3_.content)));
         var _loc6_:IBitmapWrapperWindow = _loc5_.findChildByName("achievement_image") as IBitmapWrapperWindow;
         _loc5_.background = true;
         var _loc7_:uint = param1 % 2 != 0 ? 4294967295 : uint(4292797682);
         _loc5_.color = _loc7_;
         _loc6_.bitmap = new BitmapData(_loc6_.width,_loc6_.height,false,_loc7_);
         return _loc5_;
      }
   }
}
