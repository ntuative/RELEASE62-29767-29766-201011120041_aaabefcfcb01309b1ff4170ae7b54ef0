package com.sulake.core.localization
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.localization.enum.LocalizationEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.utils.Map;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   
   public class CoreLocalizationManager extends Component implements ICoreLocalizationManager
   {
       
      
      private var var_1045:Array;
      
      private var var_1643:String = "";
      
      private var var_2288:String;
      
      private var var_832:Map;
      
      private var var_94:Dictionary;
      
      public function CoreLocalizationManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1045 = [];
         super(param1,param2,param3);
         this.var_94 = new Dictionary();
         this.var_832 = new Map();
      }
      
      public function loadLocalizationFromURL(param1:String) : void
      {
         var _loc2_:String = param1;
         if(assets.hasAsset(_loc2_))
         {
            Logger.log("[CoreLocalizationManager] reload localization for url: " + param1);
         }
         var _loc3_:URLRequest = new URLRequest(param1);
         var _loc4_:AssetLoaderStruct = assets.loadAssetFromFile(_loc2_,_loc3_,"text/plain");
         _loc4_.addEventListener(AssetLoaderEvent.const_30,this.onLocalizationReady);
      }
      
      private function updateAllListeners() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_94)
         {
            _loc1_.updateListeners();
         }
      }
      
      protected function setPredefinedUrl(param1:String) : void
      {
         var _loc2_:* = null;
         this.var_1643 = param1;
         for each(_loc2_ in this.var_94)
         {
            if(_loc2_.raw.indexOf("%predefined%") >= 0)
            {
               _loc2_.registerParameter("predefined",this.var_1643);
            }
         }
      }
      
      public function registerLocalizationDefinition(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:LocalizationDefinition = this.var_832[param1];
         if(_loc4_ == null)
         {
            _loc4_ = new LocalizationDefinition(param1,param2,param3);
            this.var_832[param1] = _loc4_;
         }
      }
      
      public function registerParameter(param1:String, param2:String, param3:String, param4:String = "%") : String
      {
         var _loc5_:Localization = this.var_94[param1];
         if(_loc5_ == null)
         {
            _loc5_ = new Localization(param1);
            this.var_94[param1] = _loc5_;
         }
         _loc5_.registerParameter(param2,param3,param4);
         return _loc5_.value;
      }
      
      public function removeListener(param1:String, param2:ILocalizable) : Boolean
      {
         var _loc3_:Localization = this.var_94[param1];
         if(_loc3_ != null)
         {
            _loc3_.removeListener(param2);
         }
         return true;
      }
      
      public function getLocalizationDefinition(param1:String) : ILocalizationDefinition
      {
         return this.var_832[param1] as ILocalizationDefinition;
      }
      
      public function updateKey(param1:String, param2:String) : void
      {
         var _loc3_:Localization = this.var_94[param1];
         if(_loc3_ == null)
         {
            _loc3_ = new Localization(param1,param2);
            this.var_94[param1] = _loc3_;
         }
         else
         {
            _loc3_.setValue(param2);
         }
         if(param2.indexOf("%predefined%") >= 0)
         {
            _loc3_.registerParameter("predefined",this.var_1643);
         }
      }
      
      public function getRawValue(param1:String, param2:String = "") : String
      {
         var _loc3_:Localization = this.var_94[param1] as Localization;
         if(_loc3_ == null)
         {
            this.var_1045.push(param1);
            return param2;
         }
         return _loc3_.raw;
      }
      
      public function getKey(param1:String, param2:String = "") : String
      {
         var _loc3_:Localization = this.var_94[param1] as Localization;
         if(_loc3_ == null)
         {
            this.var_1045.push(param1);
            return param2;
         }
         return _loc3_.value;
      }
      
      public function getKeys() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         for(_loc2_ in this.var_94)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      private function onLocalizationReady(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.assetName;
            this.parseLocalizationData(_loc2_.assetLoader.content as String);
            this.events.dispatchEvent(new Event(LocalizationEvent.const_267));
         }
      }
      
      public function printNonExistingKeys() : void
      {
         var _loc2_:* = null;
         var _loc1_:String = "";
         for each(_loc2_ in this.var_1045)
         {
            _loc1_ += _loc2_ + "\n";
         }
         Logger.log(_loc1_);
      }
      
      public function activateLocalization(param1:String) : Boolean
      {
         var _loc2_:LocalizationDefinition = this.var_832[param1];
         if(_loc2_ != null)
         {
            this.var_2288 = param1;
            this.loadLocalizationFromURL(_loc2_.url);
            return true;
         }
         return false;
      }
      
      public function getActiveLocalizationDefinition() : ILocalizationDefinition
      {
         return this.getLocalizationDefinition(this.var_2288);
      }
      
      public function getLocalizationDefinitions() : Map
      {
         return this.var_832;
      }
      
      public function getLocalization(param1:String) : ILocalization
      {
         return this.var_94[param1] as ILocalization;
      }
      
      protected function parseLocalizationData(param1:String) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc2_:RegExp = /\n\r{1,}|\n{1,}|\r{1,}/mg;
         var _loc3_:RegExp = /^\s+|\s+$/g;
         var _loc4_:Array = param1.split(_loc2_);
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.substr(0,1) != "#")
            {
               _loc6_ = _loc5_.split("=");
               if(_loc6_[0].length > 0)
               {
                  if(_loc6_.length > 1)
                  {
                     _loc7_ = _loc6_.shift();
                     _loc8_ = _loc6_.join("=");
                     _loc7_ = _loc7_.replace(_loc3_,"");
                     _loc8_ = _loc8_.replace(_loc3_,"");
                     if(_loc8_.length > 0)
                     {
                        this.updateKey(_loc7_,_loc8_);
                     }
                  }
               }
            }
         }
         this.updateAllListeners();
      }
      
      public function registerListener(param1:String, param2:ILocalizable) : Boolean
      {
         var _loc3_:Localization = this.var_94[param1];
         if(_loc3_ == null)
         {
            this.var_1045.push(param1);
            _loc3_ = new Localization(param1,param1);
            this.var_94[param1] = _loc3_;
         }
         _loc3_.registerListener(param2);
         return true;
      }
   }
}
