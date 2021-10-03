package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.inventory.badges.GetBadgePointLimitsComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.purse.GetCreditsInfoComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.ScrGetUserInfoMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.achievements.AchievementsModel;
   import com.sulake.habbo.inventory.badges.BadgesModel;
   import com.sulake.habbo.inventory.effects.EffectsModel;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.enum.InventorySubCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryEffectsEvent;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
   import com.sulake.habbo.inventory.pets.PetsModel;
   import com.sulake.habbo.inventory.purse.Purse;
   import com.sulake.habbo.inventory.recycler.RecyclerModel;
   import com.sulake.habbo.inventory.trading.TradingModel;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.session.events.RoomSessionPropertyUpdateEvent;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class HabboInventory extends Component implements IHabboInventory
   {
       
      
      private var var_95:Purse;
      
      private var var_49:Map;
      
      private var _avatarRenderer:IAvatarRenderManager;
      
      private var _config:IHabboConfigurationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_948:IRoomSession;
      
      private var _view:InventoryMainView;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_19:IRoomSessionManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var _windowManager:IHabboWindowManager;
      
      private const const_1786:int = 500;
      
      private var var_379:ISessionDataManager;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _catalog:IHabboCatalog;
      
      private var var_894:Array;
      
      private var var_1360:IncomingMessages;
      
      public function HabboInventory(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_95 = new Purse();
         this.var_49 = new Map();
         this.var_894 = new Array();
         if(param1 is CoreComponent)
         {
            (param1 as CoreComponent).events.addEventListener(Component.COMPONENT_EVENT_RUNNING,this.onComponentsRunning);
         }
      }
      
      public function getActivatedAvatarEffects() : Array
      {
         return this.effectsModel.getEffects(1);
      }
      
      public function setEffectDeselected(param1:int) : void
      {
         var _loc2_:EffectsModel = this.effectsModel;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.stopUsingEffect(param1,true);
         this.notifyChangedEffects();
      }
      
      public function toggleInventoryPage(param1:String) : void
      {
         this._view.toggleCategoryView(param1,false);
         this.inventoryViewOpened(param1);
         if(!this.isVisible)
         {
            events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_CLOSED));
         }
      }
      
      override public function dispose() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         super.dispose();
         var _loc1_:Array = this.var_49.getKeys();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_];
            _loc4_ = this.var_49.getValue(_loc3_) as IInventoryModel;
            if(_loc4_ != null)
            {
               _loc4_.dispose();
            }
            _loc2_++;
         }
         if(this._view != null)
         {
            this._view.dispose();
            this._view = null;
         }
         this.var_49.dispose();
         this.var_948 = null;
         this.var_1360 = null;
         if(this._communication != null)
         {
            release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this.var_1360 != null)
         {
            this.var_1360.dispose();
         }
         if(this._windowManager != null)
         {
            release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._localization != null)
         {
            release(new IIDHabboLocalizationManager());
            this._localization = null;
         }
         if(this._roomEngine != null)
         {
            release(new IIDRoomEngine());
            this._roomEngine = null;
         }
         if(this._config)
         {
            this._config.release(new IIDHabboConfigurationManager());
            this._config = null;
         }
         if(this.var_379)
         {
            this.var_379.release(new IIDSessionDataManager());
            this.var_379 = null;
         }
         if(this._avatarRenderer)
         {
            this._avatarRenderer.release(new IIDAvatarRenderManager());
            this._avatarRenderer = null;
         }
         if(this._catalog)
         {
            this._catalog.release(new IIDHabboCatalog());
            this._catalog = null;
         }
         if(this.var_19 != null)
         {
            this.var_19.events.removeEventListener(RoomSessionEvent.const_83,this.roomSessionEventHandler);
            this.var_19.events.removeEventListener(RoomSessionEvent.const_90,this.roomSessionEventHandler);
            this.var_19.events.removeEventListener(RoomSessionPropertyUpdateEvent.const_459,this.roomSessionEventHandler);
            this.var_19.release(new IIDHabboRoomSessionManager());
            this.var_19 = null;
         }
      }
      
      public function get recyclerModel() : RecyclerModel
      {
         return RecyclerModel(this.var_49.getValue(InventorySubCategory.RECYCLER));
      }
      
      private function roomSessionEventHandler(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_83:
               this.var_948 = param1.session;
               this._view.setHabboToolbarIcon();
               this.petsModel.updatePetsAllowed();
               this.furniModel.updateView();
               break;
            case RoomSessionEvent.const_90:
               this.var_948 = null;
               break;
            case RoomSessionPropertyUpdateEvent.const_459:
               this.petsModel.updatePetsAllowed();
         }
      }
      
      public function get clubDays() : int
      {
         return this.var_95.clubDays;
      }
      
      private function onLocalizationManagerReady(param1:IID, param2:IUnknown) : void
      {
         this._localization = param2 as IHabboLocalizationManager;
         queueInterface(new IIDRoomEngine(),this.onRoomEngineReady);
      }
      
      public function canUserOfferToTrade() : Boolean
      {
         var _loc1_:TradingModel = this.tradingModel;
         return !!_loc1_ ? Boolean(_loc1_.ownUserCanTrade) : false;
      }
      
      public function get roomSession() : IRoomSession
      {
         return this.var_948;
      }
      
      public function showView() : void
      {
         this._view.showInventory();
      }
      
      public function get clubPeriods() : int
      {
         return this.var_95.clubPeriods;
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      public function set creditBalance(param1:int) : void
      {
         this.var_95.creditBalance = param1;
         if(this._view == null)
         {
            return;
         }
         this._view.setCreditBalance(this.creditBalance);
      }
      
      public function get effectsModel() : EffectsModel
      {
         return EffectsModel(this.var_49.getValue(InventoryCategory.const_702));
      }
      
      public function get furniModel() : FurniModel
      {
         return FurniModel(this.var_49.getValue(InventoryCategory.const_74));
      }
      
      public function getCategoryViewId() : String
      {
         return this._view.getCategoryViewId();
      }
      
      public function method_3(param1:int, param2:int, param3:Boolean, param4:Boolean) : void
      {
         this.var_95.clubPeriods = param1;
         this.var_95.clubDays = param2;
         this.var_95.clubHasEverBeenMember = param3;
         this.var_95.isVIP = param4;
         this._view.method_3(this.clubPeriods,this.clubDays);
      }
      
      public function checkCategoryInitilization(param1:String) : Boolean
      {
         if(this.isInventoryCategoryInit(param1))
         {
            return true;
         }
         this.requestInventoryCategoryInit(param1);
         return false;
      }
      
      public function get petsModel() : PetsModel
      {
         return PetsModel(this.var_49.getValue(InventoryCategory.const_143));
      }
      
      public function notifyChangedEffects() : void
      {
         events.dispatchEvent(new HabboInventoryEffectsEvent(HabboInventoryEffectsEvent.const_1050));
      }
      
      public function getCategoryWindowContainer(param1:String) : IWindowContainer
      {
         var _loc2_:IInventoryModel = IInventoryModel(this.var_49.getValue(param1));
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.getWindowContainer();
      }
      
      public function get sessionData() : ISessionDataManager
      {
         return this.var_379;
      }
      
      public function requestInventoryCategoryInit(param1:String) : void
      {
         var _loc2_:IInventoryModel = this.var_49.getValue(param1) as IInventoryModel;
         if(_loc2_ != null)
         {
            _loc2_.requestInitialization(this.const_1786);
         }
      }
      
      public function get achievementsModel() : AchievementsModel
      {
         return AchievementsModel(this.var_49.getValue(InventoryCategory.const_350));
      }
      
      public function setInventoryCategoryInit(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         if(param2)
         {
            if(this.var_894.indexOf(param1) == -1)
            {
               this.var_894.push(param1);
            }
         }
         else
         {
            _loc3_ = this.var_894.indexOf(param1);
            if(_loc3_ >= 0)
            {
               this.var_894.splice(_loc3_,1);
            }
         }
      }
      
      public function closingInventoryView() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.var_49.length)
         {
            _loc2_ = this.var_49.getWithIndex(_loc1_) as IInventoryModel;
            _loc2_.closingInventoryView();
            _loc1_++;
         }
         events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_CLOSED));
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._view.setToolbar(IHabboToolbar(param2) as IHabboToolbar);
      }
      
      public function setEffectSelected(param1:int) : void
      {
         var _loc2_:EffectsModel = this.effectsModel;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.useEffect(param1);
         this.notifyChangedEffects();
      }
      
      public function get clubLevel() : int
      {
         if(this.clubDays == 0 && this.clubPeriods == 0)
         {
            return HabboClubLevelEnum.const_46;
         }
         if(this.var_95.isVIP)
         {
            return HabboClubLevelEnum.const_53;
         }
         return HabboClubLevelEnum.const_59;
      }
      
      public function toggleInventorySubPage(param1:String) : void
      {
         var _loc3_:* = null;
         this._view.toggleSubCategoryView(param1,false);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_49.length)
         {
            _loc3_ = this.var_49.getWithIndex(_loc2_) as IInventoryModel;
            _loc3_.subCategorySwitch(param1);
            _loc2_++;
         }
         switch(param1)
         {
            case InventorySubCategory.const_297:
               this._view.toggleCategoryView(InventoryCategory.const_74,false);
         }
      }
      
      public function requestSelectedFurniToRecycler() : int
      {
         if(this.recyclerModel != null)
         {
            return this.recyclerModel.lockSelectedFurni();
         }
         return 0;
      }
      
      public function get pixelBalance() : int
      {
         return this.var_95.pixelBalance;
      }
      
      public function get tradingActive() : Boolean
      {
         var _loc1_:TradingModel = this.tradingModel;
         if(!_loc1_)
         {
            return false;
         }
         return _loc1_.running;
      }
      
      public function get tradingModel() : TradingModel
      {
         return TradingModel(this.var_49.getValue(InventorySubCategory.const_297));
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._catalog = param2 as IHabboCatalog;
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRenderManagerReady);
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_379 = ISessionDataManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this._localization;
      }
      
      public function isInventoryCategoryInit(param1:String) : Boolean
      {
         if(this.var_894.indexOf(param1) >= 0)
         {
            return true;
         }
         return false;
      }
      
      public function get creditBalance() : int
      {
         return this.var_95.creditBalance;
      }
      
      public function get marketplaceModel() : MarketplaceModel
      {
         return this.var_49.getValue(InventoryCategory.const_356) as MarketplaceModel;
      }
      
      private function onComponentsRunning(param1:Event) : void
      {
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationComponentInit);
      }
      
      public function getCategorySubWindowContainer(param1:String) : IWindowContainer
      {
         var _loc2_:IInventoryModel = IInventoryModel(this.var_49.getValue(param1));
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.getWindowContainer();
      }
      
      private function onCommunicationComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         this._communication = IHabboCommunicationManager(param2);
         this.var_1360 = new IncomingMessages(this);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
      }
      
      public function deselectAllEffects() : void
      {
         var _loc1_:EffectsModel = this.effectsModel;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.stopUsingAllEffects();
         this.notifyChangedEffects();
      }
      
      public function closeView() : void
      {
         this._view.hideInventory();
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._roomEngine = IRoomEngine(param2);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_95.clubHasEverBeenMember;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_95.clubPastPeriods;
      }
      
      public function getAvatarEffects() : Array
      {
         return this.effectsModel.getEffects();
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return this._communication;
      }
      
      public function get badgesModel() : BadgesModel
      {
         return BadgesModel(this.var_49.getValue(InventoryCategory.const_279));
      }
      
      public function setupRecycler(param1:Boolean) : void
      {
         if(this.recyclerModel != null)
         {
            if(param1)
            {
               this.recyclerModel.startRecycler();
            }
            else
            {
               this.recyclerModel.stopRecycler();
            }
         }
      }
      
      public function setupTrading(param1:int, param2:String) : void
      {
         var _loc3_:TradingModel = this.tradingModel;
         if(_loc3_)
         {
            _loc3_.requestOpenTrading(param1);
         }
      }
      
      public function get isVisible() : Boolean
      {
         return this._view.isVisible;
      }
      
      public function inventoryViewOpened(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_49.length)
         {
            _loc3_ = this.var_49.getWithIndex(_loc2_) as IInventoryModel;
            _loc3_.categorySwitch(param1);
            _loc2_++;
         }
      }
      
      public function set pixelBalance(param1:int) : void
      {
         this.var_95.pixelBalance = param1;
         if(this._view == null)
         {
            return;
         }
         this._view.setPixelBalance(this.pixelBalance);
      }
      
      private function onInventoryInit(param1:IMessageEvent) : void
      {
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
         this._communication.getHabboMainConnection(null).send(new GetCreditsInfoComposer());
         this._communication.getHabboMainConnection(null).send(new ScrGetUserInfoMessageComposer("habbo_club"));
         this._communication.getHabboMainConnection(null).send(new GetBadgePointLimitsComposer());
      }
      
      public function getSubCategoryViewId() : String
      {
         return this._view.getSubCategoryViewId();
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_19 = IRoomSessionManager(param2);
         this.var_19.events.addEventListener(RoomSessionEvent.const_83,this.roomSessionEventHandler);
         this.var_19.events.addEventListener(RoomSessionEvent.const_90,this.roomSessionEventHandler);
         this.var_19.events.addEventListener(RoomSessionPropertyUpdateEvent.const_459,this.roomSessionEventHandler);
         this._view = new InventoryMainView(this,this._windowManager,this._assetLibrary);
         this.var_49 = new Map();
         var _loc3_:MarketplaceModel = new MarketplaceModel(this,this._windowManager,this._communication,this._assetLibrary,this._roomEngine,this._localization,this._config);
         this.var_49.add(InventoryCategory.const_356,_loc3_);
         var _loc4_:FurniModel = new FurniModel(this,_loc3_,this._windowManager,this._communication,this._assetLibrary,this._roomEngine,this._catalog);
         this.var_49.add(InventoryCategory.const_74,_loc4_);
         var _loc5_:BadgesModel = new BadgesModel(this,this._windowManager,this._communication,this._assetLibrary,this._localization,this.var_379);
         this.var_49.add(InventoryCategory.const_279,_loc5_);
         var _loc6_:EffectsModel = new EffectsModel(this,this._windowManager,this._communication,this._assetLibrary,this._localization);
         this.var_49.add(InventoryCategory.const_702,_loc6_);
         var _loc7_:AchievementsModel = new AchievementsModel(this,this._windowManager,this._communication,this._assetLibrary,this._localization,this.var_379);
         this.var_49.add(InventoryCategory.const_350,_loc7_);
         var _loc8_:TradingModel = new TradingModel(this,this._windowManager,this._communication,this._assetLibrary,this._roomEngine,this._localization);
         this.var_49.add(InventorySubCategory.const_297,_loc8_);
         var _loc9_:RecyclerModel = new RecyclerModel(this,this._windowManager,this._communication,this._assetLibrary,this._roomEngine,this._localization);
         this.var_49.add(InventorySubCategory.RECYCLER,_loc9_);
         var _loc10_:PetsModel = new PetsModel(this,this._windowManager,this._communication,this._assetLibrary,this._localization,this._roomEngine,this._avatarRenderer,this._catalog);
         this.var_49.add(InventoryCategory.const_143,_loc10_);
         this._communication.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this.onInventoryInit));
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._avatarRenderer = param2 as IAvatarRenderManager;
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._config = param2 as IHabboConfigurationManager;
         queueInterface(new IIDHabboCatalog(),this.onCatalogReady);
      }
      
      public function returnInventoryFurniFromRecycler(param1:int) : Boolean
      {
         if(this.recyclerModel != null)
         {
            return this.recyclerModel.releaseFurni(param1);
         }
         return false;
      }
      
      public function updateSubView() : void
      {
         this._view.updateSubCategoryView();
      }
   }
}
