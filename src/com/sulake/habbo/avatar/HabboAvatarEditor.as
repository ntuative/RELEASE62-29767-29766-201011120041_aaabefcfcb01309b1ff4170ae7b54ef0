package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.common.AvatarEditorGridColorItem;
   import com.sulake.habbo.avatar.common.AvatarEditorGridPartItem;
   import com.sulake.habbo.avatar.common.CategoryData;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.common.ISideContentModel;
   import com.sulake.habbo.avatar.enum.AvatarEditorEvent;
   import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
   import com.sulake.habbo.avatar.enum.AvatarEditorSideCategory;
   import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.events.AvatarEditorClosedEvent;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.avatar.generic.BodyModel;
   import com.sulake.habbo.avatar.head.HeadModel;
   import com.sulake.habbo.avatar.hotlooks.HotLooksModel;
   import com.sulake.habbo.avatar.legs.LegsModel;
   import com.sulake.habbo.avatar.promo.ClubPromoModel;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPalette;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.torso.TorsoModel;
   import com.sulake.habbo.avatar.wardrobe.WardrobeModel;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboAvatarEditor extends Component implements IHabboAvatarEditor
   {
      
      private static const const_1201:String = "hr-100.hd-180-7.ch-215-66.lg-270-79.sh-305-62.ha-1002-70.wa-2007";
      
      private static const const_1199:String = "hr-515-33.hd-600-1.ch-635-70.lg-716-66-62.sh-735-68";
       
      
      private var _view:AvatarEditorView;
      
      private var var_1091:AvatarEditorHandler;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _windowContext:IWindowContainer;
      
      private var var_649:ISessionDataManager;
      
      private var var_476:IAvatarRenderManager;
      
      private var var_90:Map;
      
      private var var_1090:int = 0;
      
      private var var_167:Boolean = false;
      
      private var var_585:Dictionary;
      
      private var _communication:IHabboCommunicationManager;
      
      private const const_1200:int = 2;
      
      private var _catalog:IHabboCatalog;
      
      private var _inventory:IHabboInventory;
      
      private var var_898:String = "M";
      
      private var var_1717:Boolean;
      
      private var var_1331:IHabboAvatarEditorDataSaver = null;
      
      private var var_1716:Boolean = false;
      
      private var var_164:IHabboConfigurationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_872:IFigureData;
      
      private var var_475:Map;
      
      public function HabboAvatarEditor(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRenderManagerReady);
         queueInterface(new IIDHabboInventory(),this.onInventoryReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationReady);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationReady);
         queueInterface(new IIDHabboCatalog(),this.onCatalogReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
         if(param1 is CoreComponent)
         {
            (param1 as CoreComponent).events.addEventListener(Component.COMPONENT_EVENT_RUNNING,this.onComponentsRunning);
         }
      }
      
      public function getFigureSetType(param1:String) : ISetType
      {
         if(this.var_872 == null)
         {
            return null;
         }
         return this.var_872.getSetType(param1);
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._localization = param2 as IHabboLocalizationManager;
      }
      
      public function useClubClothing() : void
      {
         if(this.var_90 == null)
         {
            return;
         }
         if(this.var_1717)
         {
            return;
         }
         this.var_1717 = true;
         this.update();
      }
      
      public function close() : void
      {
         if(this._windowContext != null)
         {
            this._windowContext.visible = false;
         }
         else
         {
            this.events.dispatchEvent(new AvatarEditorClosedEvent());
         }
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._catalog = param2 as IHabboCatalog;
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_164 = param2 as IHabboConfigurationManager;
      }
      
      public function get sessionData() : ISessionDataManager
      {
         return this.var_649;
      }
      
      public function update() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_90)
         {
            _loc1_.reset();
         }
         for each(_loc2_ in this.var_475)
         {
            _loc2_.reset();
         }
         if(this._view)
         {
            this._view.update();
         }
      }
      
      private function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!this.var_167)
         {
            this.var_585 = new Dictionary();
            this.var_585["null"] = new FigureData(this);
            this.var_585["null"] = new FigureData(this);
            _loc1_ = this.var_585["null"];
            _loc2_ = this.var_585["null"];
            _loc1_.loadAvatarData(const_1201,FigureData.const_79);
            _loc2_.loadAvatarData(const_1199,FigureData.FEMALE);
            this.var_90 = new Map();
            this.var_475 = new Map();
            this.var_90.add(AvatarEditorFigureCategory.const_640,new BodyModel(this));
            this.var_90.add(AvatarEditorFigureCategory.const_41,new HeadModel(this));
            this.var_90.add(AvatarEditorFigureCategory.const_234,new TorsoModel(this));
            this.var_90.add(AvatarEditorFigureCategory.const_711,new LegsModel(this));
            this.var_90.add(AvatarEditorFigureCategory.HOTLOOKS,new HotLooksModel(this));
            this.var_475.add(AvatarEditorSideCategory.const_97,new WardrobeModel(this));
            this.var_475.add(AvatarEditorSideCategory.const_444,new ClubPromoModel(this));
            this.var_167 = true;
         }
      }
      
      public function set gender(param1:String) : void
      {
         var _loc2_:* = null;
         if(this.var_898 == param1)
         {
            return;
         }
         this.var_898 = param1;
         for each(_loc2_ in this.var_90)
         {
            _loc2_.reset();
         }
         if(this._view != null)
         {
            this._view.update();
         }
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_649 = param2 as ISessionDataManager;
      }
      
      private function orderByClub(param1:AvatarEditorGridPartItem, param2:AvatarEditorGridPartItem) : Number
      {
         var _loc3_:Number = param1.partSet == null ? -1 : Number(Number(param1.partSet.clubLevel));
         var _loc4_:Number = param2.partSet == null ? -1 : Number(Number(param2.partSet.clubLevel));
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.partSet.id < param2.partSet.id)
         {
            return -1;
         }
         if(param1.partSet.id > param2.partSet.id)
         {
            return 1;
         }
         return 0;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this._localization;
      }
      
      private function onComponentsRunning(param1:Event = null) : void
      {
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function hasInvalidClubItems() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         var _loc1_:Boolean = false;
         for each(_loc2_ in this.var_90)
         {
            _loc3_ = _loc2_.hasClubItemsOverLevel(this.clubMemberLevel);
            if(_loc3_)
            {
               _loc1_ = true;
            }
         }
         return _loc1_;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this.var_164 != null)
         {
            this.var_164.release(new IIDHabboConfigurationManager());
            this.var_164 = null;
         }
         if(this._communication != null)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this._catalog != null)
         {
            this._catalog.release(new IIDHabboCatalog());
            this._catalog = null;
         }
         if(this._localization != null)
         {
            this._localization.release(new IIDHabboLocalizationManager());
            this._localization = null;
         }
         if(this.var_476 != null)
         {
            this.var_476.release(new IIDAvatarRenderManager());
            this.var_476 = null;
         }
         if(this._windowManager != null)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._inventory != null)
         {
            this._inventory.release(new IIDHabboInventory());
            this._inventory = null;
         }
         if(this.var_90 != null)
         {
            for each(_loc1_ in this.var_90)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            this.var_90 = null;
         }
         if(this.var_475 != null)
         {
            for each(_loc2_ in this.var_475)
            {
               _loc2_.dispose();
               _loc2_ = null;
            }
            this.var_475 = null;
         }
         if(this._windowContext != null)
         {
            this._windowContext.dispose();
            this._windowContext = null;
         }
         if(this._view != null)
         {
            this._view.dispose();
            this._view = null;
         }
         if(this.var_1091 != null)
         {
            this.var_1091.dispose();
            this.var_1091 = null;
         }
         this.var_872 = null;
         this.var_585 = null;
         this.var_1331 = null;
         super.dispose();
      }
      
      public function saveCurrentSelection() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this.var_1331 != null)
         {
            _loc1_ = this.figureData.getFigureString();
            _loc2_ = this.figureData.gender;
            this.var_1331.saveFigure(_loc1_,_loc2_);
         }
      }
      
      public function get catalog() : IHabboCatalog
      {
         return this._catalog;
      }
      
      public function getDefaultColour(param1:String) : int
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:ISetType = this.getFigureSetType(param1);
         if(_loc2_ != null)
         {
            _loc3_ = this.getPalette(_loc2_.paletteID);
            for each(_loc4_ in _loc3_.colors)
            {
               if(_loc4_.isSelectable && this.var_1090 >= _loc4_.clubLevel)
               {
                  return _loc4_.id;
               }
            }
         }
         return -1;
      }
      
      public function get figureData() : FigureData
      {
         return this.var_585[this.var_898];
      }
      
      public function generateDataContent(param1:IAvatarEditorCategoryModel, param2:String) : CategoryData
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:Boolean = false;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:Boolean = false;
         var _loc16_:* = false;
         var _loc17_:int = 0;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:Boolean = false;
         var _loc24_:* = null;
         if(!param1)
         {
            return null;
         }
         if(!param2)
         {
            return null;
         }
         var _loc3_:* = [];
         var _loc4_:Array = new Array();
         _loc5_ = 0;
         while(_loc5_ < this.const_1200)
         {
            _loc4_.push(new Array());
            _loc5_++;
         }
         _loc8_ = this.getFigureSetType(param2);
         if(!_loc8_)
         {
            return null;
         }
         if(_loc8_ != null)
         {
            _loc9_ = this.getPalette(_loc8_.paletteID);
            if(!_loc9_)
            {
               return null;
            }
            _loc10_ = this.figureData.getColourIds(param2);
            if(!_loc10_)
            {
               _loc10_ = new Array();
            }
            _loc11_ = new Array(_loc10_.length);
            _loc12_ = this.isClubTryoutAllowed() && this.var_1717;
            for each(_loc13_ in _loc9_.colors)
            {
               if(_loc13_.isSelectable && (_loc12_ || this.var_1090 >= _loc13_.clubLevel))
               {
                  _loc17_ = 0;
                  while(_loc17_ < this.const_1200)
                  {
                     _loc18_ = new AvatarEditorGridColorItem(AvatarEditorView.var_1372.clone() as IWindowContainer,param1,_loc13_);
                     _loc4_[_loc17_].push(_loc18_);
                     _loc17_++;
                  }
                  if(param2 != FigureData.FACE)
                  {
                     _loc19_ = 0;
                     while(_loc19_ < _loc10_.length)
                     {
                        if(_loc13_.id == _loc10_[_loc19_])
                        {
                           _loc11_[_loc19_] = _loc13_;
                        }
                        _loc19_++;
                     }
                  }
               }
            }
            if(_loc12_)
            {
               _loc20_ = 2;
               _loc14_ = this.var_476.getMandatoryAvatarPartSetIds(this.gender,_loc20_);
            }
            else
            {
               _loc14_ = this.var_476.getMandatoryAvatarPartSetIds(this.gender,this.clubMemberLevel);
            }
            _loc15_ = Boolean(_loc14_.indexOf(param2) == -1);
            if(_loc15_)
            {
               _loc21_ = assets.getAssetByName("removeSelection") as BitmapDataAsset;
               if(_loc21_)
               {
                  _loc22_ = (_loc21_.content as BitmapData).clone();
                  _loc7_ = new AvatarEditorGridPartItem(AvatarEditorView.var_1126.clone() as IWindowContainer,param1,null,null,false);
                  _loc7_.iconImage = _loc22_;
                  _loc3_.push(_loc7_);
               }
            }
            _loc16_ = param2 != FigureData.FACE;
            for each(_loc6_ in _loc8_.partSets)
            {
               _loc23_ = false;
               if(_loc6_.gender == FigureData.const_1332)
               {
                  _loc23_ = true;
               }
               else if(_loc6_.gender == this.gender)
               {
                  _loc23_ = true;
               }
               if(_loc6_.isSelectable && _loc23_ && (_loc12_ || this.var_1090 >= _loc6_.clubLevel))
               {
                  _loc7_ = new AvatarEditorGridPartItem(AvatarEditorView.var_1126.clone() as IWindowContainer,param1,_loc6_,_loc11_,_loc16_);
                  _loc3_.push(_loc7_);
               }
            }
         }
         _loc3_.sort(this.orderByClub);
         _loc5_ = 0;
         while(_loc5_ < this.const_1200)
         {
            _loc24_ = _loc4_[_loc5_] as Array;
            _loc24_.sort(this.orderPaletteByClub);
            _loc5_++;
         }
         return new CategoryData(_loc3_,_loc4_);
      }
      
      public function get wardrobe() : WardrobeModel
      {
         if(!this.var_167)
         {
            this.init();
         }
         return this.var_475.getValue(AvatarEditorSideCategory.const_97);
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._communication = param2 as IHabboCommunicationManager;
         this.var_1091 = new AvatarEditorHandler(this,this._communication);
      }
      
      public function getPalette(param1:int) : IPalette
      {
         if(this.var_872 == null)
         {
            return null;
         }
         return this.var_872.getPalette(param1);
      }
      
      public function get gender() : String
      {
         return this.var_898;
      }
      
      public function get handler() : AvatarEditorHandler
      {
         return this.var_1091;
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      public function isWardrobeAllowed() : Boolean
      {
         return !this.var_1716;
      }
      
      public function isClubTryoutAllowed() : Boolean
      {
         var _loc1_:String = this.configuration.getKey("avatareditor.allowclubtryout");
         return _loc1_ == "1" && !this.var_1716;
      }
      
      public function toggleAvatarEditorPage(param1:String) : void
      {
         this._view.toggleCategoryView(param1,false);
      }
      
      public function get avatarRenderManager() : IAvatarRenderManager
      {
         return this.var_476;
      }
      
      public function getSideContentWindowContainer(param1:String) : IWindowContainer
      {
         var _loc2_:ISideContentModel = this.var_475.getValue(param1) as ISideContentModel;
         if(_loc2_ != null)
         {
            return _loc2_.getWindowContainer();
         }
         return null;
      }
      
      public function openEditor(param1:IWindowContainer = null, param2:IHabboAvatarEditorDataSaver = null, param3:Array = null, param4:Boolean = false) : Boolean
      {
         if(!this.var_167)
         {
            this.init();
         }
         this.var_1716 = param4;
         if(this._view != null)
         {
            if(!this._view.validateAvailableCategories(param3))
            {
               this._view.dispose();
               this._view = null;
            }
         }
         if(this._view == null)
         {
            this._view = new AvatarEditorView(this,this._windowManager,this._catalog,param3,!param4);
         }
         if(param1 != null)
         {
            param1.addChild(this._view.window);
         }
         else
         {
            if(this._windowContext == null)
            {
               this._windowContext = this._windowManager.createWindow("avatarEditorContainer","",HabboWindowType.const_57,HabboWindowStyle.const_35,0 | 0,new Rectangle(0,0,2,2),null,0) as IWindowContainer;
               this._windowContext.addChild(this._view.window);
               this._windowContext.center();
               this._windowContext.visible = false;
            }
            this._windowContext.visible = !this._windowContext.visible;
         }
         this._view.show();
         if(param3 != null && param3.length > 0)
         {
            this.toggleAvatarEditorPage(param3[0]);
         }
         else
         {
            this.toggleAvatarEditorPage(AvatarEditorFigureCategory.const_640);
         }
         this.var_1331 = param2;
         return true;
      }
      
      private function onAvatarRendererReady(param1:Event = null) : void
      {
         this.var_872 = this.var_476.getFigureData(AvatarType.HUMAN);
         this.events.dispatchEvent(new Event(AvatarEditorEvent.AVATAR_EDITOR_READY));
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_476 = param2 as IAvatarRenderManager;
         (this.var_476 as Component).events.addEventListener(AvatarRenderEvent.AVATAR_RENDER_READY,this.onAvatarRendererReady);
      }
      
      public function getCategoryWindowContainer(param1:String) : IWindowContainer
      {
         var _loc2_:IAvatarEditorCategoryModel = this.var_90.getValue(param1) as IAvatarEditorCategoryModel;
         if(_loc2_ != null)
         {
            return _loc2_.getWindowContainer();
         }
         return null;
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._inventory = param2 as IHabboInventory;
      }
      
      public function loadAvatarInEditor(param1:String, param2:String, param3:int = 0) : void
      {
         var _loc5_:* = null;
         switch(param2)
         {
            case FigureData.const_79:
            case "m":
            case "M":
               param2 = "null";
               break;
            case FigureData.FEMALE:
            case "f":
            case "F":
               param2 = "null";
         }
         this.var_1090 = param3;
         var _loc4_:FigureData = this.var_585[param2];
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.loadAvatarData(param1,param2);
         if(param2 != this.gender)
         {
            this.gender = param2;
         }
         if(this.var_90)
         {
            for each(_loc5_ in this.var_90)
            {
               _loc5_.reset();
            }
         }
         if(this._view != null)
         {
            this._view.update();
         }
      }
      
      public function get windowContext() : IWindowContainer
      {
         return this._windowContext;
      }
      
      public function stripClubItems() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_90)
         {
            _loc1_.stripClubItemsOverLevel(this.clubMemberLevel);
         }
      }
      
      public function get clubMemberLevel() : int
      {
         return this.var_1090;
      }
      
      private function orderPaletteByClub(param1:AvatarEditorGridColorItem, param2:AvatarEditorGridColorItem) : Number
      {
         var _loc3_:Number = param1.partColor == null ? -1 : Number(param1.partColor.clubLevel as Number);
         var _loc4_:Number = param2.partColor == null ? -1 : Number(param2.partColor.clubLevel as Number);
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.partColor.index < param2.partColor.index)
         {
            return -1;
         }
         if(param1.partColor.index > param2.partColor.index)
         {
            return 1;
         }
         return 0;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_164;
      }
   }
}
