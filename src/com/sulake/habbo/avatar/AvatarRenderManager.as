package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.animation.IAnimationManager;
   import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.enum.RenderMode;
   import com.sulake.habbo.avatar.palette.PaletteManager;
   import com.sulake.habbo.avatar.pets.IPetDataManager;
   import com.sulake.habbo.avatar.pets.PetDataManager;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.structure.parts.PartOffsetData;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   
   public class AvatarRenderManager extends Component implements IAvatarRenderManager
   {
       
      
      private var var_528:String;
      
      private var var_204:AvatarAssetDownloadManager;
      
      private var var_109:Map;
      
      private var var_1739:AvatarFigureContainer;
      
      private var var_388:PetDataManager;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_483:Map;
      
      private var var_2444:Boolean = false;
      
      private var var_389:AssetAliasCollection;
      
      private var var_882:PaletteManager;
      
      private const const_1780:String = "hd-99999-99999";
      
      public function AvatarRenderManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_109 = new Map();
         param2 |= const_1028;
         super(param1,param2,param3);
         this.var_528 = RenderMode.const_1258;
         this.var_483 = new Map();
         param1.events.addEventListener(Component.COMPONENT_EVENT_RUNNING,this.onComponentEventRunning);
         queueInterface(new IIDHabboConfigurationManager(),this.onHabboConfigurationReady);
      }
      
      private function initAvatarAssetsDownloadManager() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         Logger.log("[AvatarRenderManager] Init Avatar Assets Download Manager");
         var _loc1_:AvatarStructure = this.var_109.getValue(AvatarType.HUMAN) as AvatarStructure;
         if(_loc1_ != null && this.var_204 == null)
         {
            _loc2_ = this._habboConfiguration.getKey("flash.dynamic.avatar.download.configuration","figuremap.xml");
            _loc3_ = this._habboConfiguration.getKey("flash.dynamic.avatar.download.url","");
            this.var_204 = new AvatarAssetDownloadManager(context.assets,_loc2_,_loc3_,_loc1_);
            this.var_204.addEventListener(Event.COMPLETE,this.onAvatarAssetsDownloadManagerReady);
         }
      }
      
      public function createPetImageFromFigure(param1:String, param2:String, param3:IPetImageListener = null) : IAvatarImage
      {
         if(param1.indexOf(" ") == -1)
         {
            return null;
         }
         var _loc4_:Array = param1.split(" ");
         if(_loc4_.length == 0)
         {
            return null;
         }
         var _loc5_:int = int(_loc4_[0]);
         var _loc6_:int = int(_loc4_[1]);
         var _loc7_:uint = parseInt(_loc4_[2],16);
         return this.createPetImage(_loc5_,_loc6_,_loc7_,param2,param3);
      }
      
      private function onStructureInit(param1:Event = null) : void
      {
         var _loc2_:AvatarStructure = param1.target as AvatarStructure;
         if(_loc2_.avatarType == AvatarType.HUMAN)
         {
            this.initAvatarAssetsDownloadManager();
         }
      }
      
      public function downloadFigure(param1:AvatarFigureContainer, param2:IAvatarImageListener) : void
      {
         if(!this.var_204)
         {
            return;
         }
         this.var_204.loadFigureSetData(param1,param2);
      }
      
      private function init() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.var_2444 && this._habboConfiguration)
         {
            _loc1_ = context.assets as AssetLibraryCollection;
            this.var_389 = new AssetAliasCollection(this,_loc1_);
            this.var_388 = new PetDataManager(_loc1_,this);
            this.var_882 = new PaletteManager(_loc1_);
            _loc2_ = assets.getAssetByName("HabboAvatarPetFigure").content as XML;
            this.var_388.populateFigureData(_loc2_);
            _loc3_ = new AvatarStructure(this,assets,_loc1_,AvatarType.HUMAN);
            _loc3_.addEventListener(AvatarStructure.AVATAR_STRUCTURE_INIT,this.onStructureInit);
            this.var_109.add(AvatarType.HUMAN,_loc3_);
            _loc3_ = new AvatarStructure(this,assets,_loc1_,AvatarType.PET);
            _loc3_.addEventListener(AvatarStructure.AVATAR_STRUCTURE_INIT,this.onStructureInit);
            this.var_109.add(AvatarType.PET,_loc3_);
            return true;
         }
         return false;
      }
      
      public function isFigureReady(param1:AvatarFigureContainer) : Boolean
      {
         if(!this.var_204)
         {
            return false;
         }
         return this.var_204.isReady(param1);
      }
      
      public function createPetImage(param1:int, param2:int, param3:uint, param4:String, param5:IPetImageListener = null) : IAvatarImage
      {
         var _loc9_:* = null;
         var _loc6_:* = false;
         if(this.mode != RenderMode.const_1369)
         {
            _loc6_ = !this.var_388.assetsReady(param1,param4);
         }
         var _loc7_:String = this.var_388.createPetFigureString(param1,param2,param3);
         var _loc8_:AvatarStructure = this.var_109.getValue(AvatarType.PET) as AvatarStructure;
         if(_loc8_ == null)
         {
            return null;
         }
         if(!_loc6_)
         {
            return new PetImage(_loc8_,this.var_389,_loc7_,param4);
         }
         if(param5 != null)
         {
            _loc9_ = this.var_483[_loc7_];
            if(!_loc9_)
            {
               _loc9_ = [];
            }
            _loc9_.push(param5);
            this.var_483.add(_loc7_,_loc9_);
         }
         return new PlaceholderPetImage(_loc8_,this.var_389,_loc7_,param4,assets);
      }
      
      public function resetPetData() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         this.var_389.init();
         this.var_388.init();
         this.var_882.init();
         var _loc1_:XML = assets.getAssetByName("HabboAvatarPetFigure").content as XML;
         this.var_388.populateFigureData(_loc1_);
         var _loc2_:AvatarStructure = this.var_109.getValue(AvatarType.PET);
         _loc2_.init();
         _loc2_.resetPartOffsets();
         var _loc5_:Array = this.var_483.getKeys();
         for each(_loc6_ in _loc5_)
         {
            _loc4_ = this.var_483.getValue(_loc6_);
            if(_loc4_)
            {
               for each(_loc3_ in _loc4_)
               {
                  if(_loc3_ != null && !_loc3_.disposed)
                  {
                     _loc3_.petImageReady(_loc6_);
                  }
               }
            }
         }
         this.var_483.reset();
      }
      
      public function get mode() : String
      {
         return this.var_528;
      }
      
      override public function dispose() : void
      {
         if(this._habboConfiguration)
         {
            this._habboConfiguration.release(new IIDHabboConfigurationManager());
            this._habboConfiguration = null;
         }
         super.dispose();
         if(this.var_109 != null)
         {
            this.var_109.dispose();
            this.var_109 = null;
         }
         if(this.var_388 != null)
         {
            this.var_388.dispose();
            this.var_388 = null;
         }
         if(this.var_882 != null)
         {
            this.var_882.dispose();
            this.var_882 = null;
         }
         if(this.var_389 != null)
         {
            this.var_389.dispose();
            this.var_389 = null;
         }
         if(this.var_483)
         {
            this.var_483.dispose();
            this.var_483 = null;
         }
         if(this.var_204)
         {
            this.var_204.removeEventListener(Event.COMPLETE,this.onAvatarAssetsDownloadManagerReady);
            this.var_204.dispose();
            this.var_204 = null;
         }
         PartOffsetData.dispose();
      }
      
      public function get petDataManager() : IPetDataManager
      {
         return this.var_388 as IPetDataManager;
      }
      
      public function get paletteManager() : PaletteManager
      {
         return this.var_882;
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            this._habboConfiguration = param2 as IHabboConfigurationManager;
            if(this.init())
            {
               this.prepareStructures();
            }
         }
      }
      
      public function getFigureData(param1:String) : IFigureData
      {
         var _loc2_:AvatarStructure = this.var_109.getValue(param1) as AvatarStructure;
         if(_loc2_ != null)
         {
            return _loc2_.figureData;
         }
         return null;
      }
      
      public function injectFigureData(param1:String, param2:XML) : void
      {
         var _loc3_:* = null;
         switch(param1)
         {
            case AvatarType.HUMAN:
               _loc3_ = this.var_109.getValue(AvatarType.HUMAN) as AvatarStructure;
               break;
            case AvatarType.PET:
               _loc3_ = this.var_109.getValue(AvatarType.PET) as AvatarStructure;
               break;
            default:
               Logger.log("Uknown avatar type: " + param1);
         }
         if(_loc3_ != null)
         {
            _loc3_.injectFigureData(param2);
         }
      }
      
      private function onComponentEventRunning(param1:Event) : void
      {
         this.var_2444 = true;
         if(this.init())
         {
            this.prepareStructures();
         }
      }
      
      public function getMandatoryAvatarPartSetIds(param1:String, param2:int) : Array
      {
         var _loc3_:AvatarStructure = this.var_109.getValue(AvatarType.HUMAN) as AvatarStructure;
         return _loc3_.getMandatorySetTypeIds(param1,param2);
      }
      
      public function set mode(param1:String) : void
      {
         this.var_528 = param1;
         if(this.var_528 == RenderMode.const_1222)
         {
            this.init();
         }
         else if(this.var_528 == RenderMode.const_1333)
         {
            this.init();
            this.prepareStructures();
            this.initAvatarAssetsDownloadManager();
         }
      }
      
      private function prepareStructures() : void
      {
         var _loc1_:* = null;
         _loc1_ = this.var_109.getValue(AvatarType.HUMAN) as AvatarStructure;
         if(_loc1_ != null)
         {
            _loc1_.initConfiguration(this._habboConfiguration);
         }
         _loc1_ = this.var_109.getValue(AvatarType.PET) as AvatarStructure;
         if(_loc1_ != null)
         {
            _loc1_.initConfiguration(this._habboConfiguration);
         }
      }
      
      private function validateAvatarFigure(param1:AvatarFigureContainer, param2:String) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(!this.var_109)
         {
            ErrorReportStorage.addDebugData("AvatarRenderManager","validateAvatarFigure: _structures is null!");
         }
         var _loc3_:AvatarStructure = this.var_109.getValue(AvatarType.HUMAN) as AvatarStructure;
         if(!_loc3_)
         {
            ErrorReportStorage.addDebugData("AvatarRenderManager","validateAvatarFigure: structure is null!");
         }
         var _loc6_:Array = _loc3_.getMandatorySetTypeIds(param2,2);
         if(_loc6_)
         {
            _loc7_ = _loc3_.figureData;
            if(!_loc7_)
            {
               ErrorReportStorage.addDebugData("AvatarRenderManager","validateAvatarFigure: figureData is null!");
            }
            for each(_loc8_ in _loc6_)
            {
               if(!param1.hasPartType(_loc8_))
               {
                  _loc9_ = _loc3_.getDefaultPartSet(_loc8_,param2);
                  if(_loc9_)
                  {
                     param1.updatePart(_loc8_,_loc9_.id,[0]);
                     _loc4_ = true;
                  }
               }
               else
               {
                  _loc10_ = _loc7_.getSetType(_loc8_);
                  if(!_loc10_)
                  {
                     ErrorReportStorage.addDebugData("AvatarRenderManager","validateAvatarFigure: setType is null!");
                  }
                  _loc11_ = _loc10_.getPartSet(param1.getPartSetId(_loc8_));
                  if(!_loc11_)
                  {
                     _loc12_ = _loc3_.getDefaultPartSet(_loc8_,param2);
                     param1.updatePart(_loc8_,_loc12_.id,[0]);
                     _loc4_ = true;
                  }
               }
            }
         }
         return !_loc4_;
      }
      
      public function getAssetByName(param1:String) : IAsset
      {
         return this.var_389.getAssetByName(param1);
      }
      
      public function createFigureContainer(param1:String) : AvatarFigureContainer
      {
         return new AvatarFigureContainer(param1);
      }
      
      public function createAvatarImage(param1:String, param2:String, param3:String = null, param4:IAvatarImageListener = null) : IAvatarImage
      {
         var _loc5_:AvatarStructure = this.var_109.getValue(AvatarType.HUMAN) as AvatarStructure;
         if(_loc5_ == null)
         {
            return null;
         }
         if(!this.var_204)
         {
            return null;
         }
         var _loc6_:AvatarFigureContainer = new AvatarFigureContainer(param1);
         if(param3)
         {
            this.validateAvatarFigure(_loc6_,param3);
         }
         if(this.var_204.isReady(_loc6_))
         {
            return new AvatarImage(_loc5_,this.var_389,_loc6_,param2);
         }
         if(!this.var_1739)
         {
            this.var_1739 = new AvatarFigureContainer(this.const_1780);
         }
         this.var_204.loadFigureSetData(_loc6_,param4);
         return new PlaceholderAvatarImage(_loc5_,this.var_389,this.var_1739,param2);
      }
      
      private function onAvatarAssetsDownloadManagerReady(param1:Event = null) : void
      {
         this.events.dispatchEvent(new Event(AvatarRenderEvent.AVATAR_RENDER_READY));
      }
      
      public function getAnimationManager(param1:String) : IAnimationManager
      {
         var _loc2_:AvatarStructure = this.var_109.getValue(param1) as AvatarStructure;
         if(_loc2_ != null)
         {
            return _loc2_.animationManager;
         }
         return null;
      }
   }
}
