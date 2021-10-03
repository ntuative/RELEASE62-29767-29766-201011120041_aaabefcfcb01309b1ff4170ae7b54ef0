package com.sulake.core.runtime
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.AssetTypeDeclaration;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.events.ErrorEvent;
   import com.sulake.core.runtime.events.LockEvent;
   import com.sulake.core.runtime.exceptions.InvalidComponentException;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class ComponentContext extends Component implements IContext
   {
       
      
      protected var var_249:Array;
      
      protected var var_404:Array;
      
      protected var _debug:Boolean = false;
      
      protected var var_282:Array;
      
      protected var var_403:DisplayObjectContainer;
      
      public function ComponentContext(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(this,param2 | 0,param3);
         this.var_403 = new Sprite();
         this.var_282 = new Array();
         this.var_404 = new Array();
      }
      
      public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         var_1139 = param1;
         if(events == null)
         {
            Logger.log("Failed to dispatch an error because events was null. Message: " + param1);
         }
         else
         {
            events.dispatchEvent(new ErrorEvent(Component.COMPONENT_EVENT_ERROR,param1,param2,!!param4 ? param4.getStackTrace() : null));
         }
      }
      
      protected function removeLibraryLoader(param1:LibraryLoader) : void
      {
         param1.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.loadReadyHandler,false);
         param1.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,this.loadReadyHandler,false);
         param1.dispose();
         var _loc2_:int = 0;
         while(_loc2_ < this.var_249.length)
         {
            if(this.var_249[_loc2_] == param1)
            {
               this.var_249.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
      }
      
      protected final function announceInterfaceAvailability(param1:IID, param2:Component) : void
      {
         var _loc4_:* = null;
         var _loc3_:ComponentInterfaceQueue = this.getQueueForInterface(param1);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc5_:uint = _loc3_.receivers.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param2.queueInterface(param1);
            if(_loc4_ == null)
            {
               this.error("Interface " + param1 + " still unavailabe!",true,Core.const_1272);
            }
            _loc3_.receivers.pop()(param1,_loc4_);
            _loc6_++;
         }
      }
      
      public function prepareAssetLibrary(param1:XML, param2:Class) : Boolean
      {
         return assets.loadFromResource(param1,param2);
      }
      
      public final function loadFromFile(param1:URLRequest, param2:LoaderContext) : LibraryLoader
      {
         if(this.var_249 == null)
         {
            this.var_249 = new Array();
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.var_249.length)
         {
            if(this.var_249[_loc3_].url == param1.url)
            {
               return this.var_249[_loc3_].loadFromFile(param1);
            }
            _loc3_++;
         }
         var _loc4_:LibraryLoader = new LibraryLoader(param2,this._debug);
         _loc4_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.loadReadyHandler,false);
         _loc4_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,this.loadErrorHandler,false);
         _loc4_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DEBUG,this.loadDebugHandler,false);
         _loc4_.load(param1);
         this.var_249.push(_loc4_);
         return _loc4_;
      }
      
      protected function debug(param1:String) : void
      {
         var_1825 = param1;
         if(this._debug)
         {
            events.dispatchEvent(new Event(Component.COMPONENT_EVENT_DEBUG));
         }
      }
      
      override public function toXMLString(param1:uint = 0) : String
      {
         var _loc6_:* = null;
         var _loc10_:* = null;
         var _loc2_:* = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_ += "\t";
            _loc3_++;
         }
         var _loc4_:String = getQualifiedClassName(this);
         var _loc5_:String = "";
         _loc5_ += _loc2_ + "<context class=\"" + _loc4_ + "\" >\n";
         var _loc7_:Array = new Array();
         var _loc8_:uint = iids.mapStructsByImplementor(this,_loc7_);
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            _loc6_ = _loc7_[_loc9_];
            _loc5_ += _loc2_ + "\t<interface iid=\"" + _loc6_.iis + "\" refs=\"" + _loc6_.references + "\"/>\n";
            _loc9_++;
         }
         var _loc11_:int = 0;
         while(_loc11_ < this.var_282.length)
         {
            _loc10_ = this.var_282[_loc11_] as Component;
            if(_loc10_ != this)
            {
               _loc5_ += _loc10_.toXMLString(param1 + 1);
            }
            _loc11_++;
         }
         return _loc5_ + (_loc2_ + "</context>\n");
      }
      
      protected final function addQueueeForInterface(param1:IID, param2:Function) : void
      {
         var _loc3_:* = null;
         if(this.hasQueueForInterface(param1))
         {
            _loc3_ = this.getQueueForInterface(param1);
         }
         else
         {
            _loc3_ = new ComponentInterfaceQueue(param1);
            this.var_404.push(_loc3_);
         }
         _loc3_.receivers.splice(0,0,param2);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         if(!disposed)
         {
            super.dispose();
            if(this.var_282 != null)
            {
               _loc1_ = uint(this.var_282.length);
               while(_loc1_-- > 0)
               {
                  IUnknown(this.var_282.pop()).dispose();
               }
               this.var_282 = null;
            }
            if(this.var_404 != null)
            {
               _loc1_ = uint(this.var_404.length);
               while(_loc1_-- > 0)
               {
                  IDisposable(this.var_404.pop()).dispose();
               }
               this.var_404 = null;
            }
            if(this.var_249 != null)
            {
               _loc1_ = uint(this.var_249.length);
               while(_loc1_-- > 0)
               {
                  _loc2_ = this.var_249[0];
                  this.removeLibraryLoader(_loc2_);
                  _loc2_.dispose();
               }
               this.var_249 = null;
            }
         }
      }
      
      public function get displayObjectContainer() : DisplayObjectContainer
      {
         return this.var_403;
      }
      
      private function lockEventHandler(param1:LockEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1.type == Component.INTERNAL_EVENT_UNLOCKED)
         {
            _loc2_ = param1.unknown as Component;
            _loc2_.events.removeEventListener(Component.INTERNAL_EVENT_UNLOCKED,this.lockEventHandler);
            _loc3_ = new Array();
            iids.mapStructsByImplementor(_loc2_,_loc3_);
            while(_loc3_.length && !_loc2_.disposed)
            {
               _loc4_ = _loc3_.pop();
               this.announceInterfaceAvailability(_loc4_.iid,_loc2_);
            }
         }
      }
      
      protected final function getQueueForInterface(param1:IID) : ComponentInterfaceQueue
      {
         var _loc3_:* = null;
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc4_:uint = this.var_404.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = this.var_404[_loc5_];
            if(getQualifiedClassName(_loc3_.identifier) == _loc2_)
            {
               return _loc3_;
            }
            _loc5_++;
         }
         return null;
      }
      
      protected final function loadReadyHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         this.removeLibraryLoader(_loc2_);
         this.prepareComponent(_loc2_.resource,Component.COMPONENT_FLAG_NULL,_loc2_.domain);
      }
      
      protected final function hasQueueForInterface(param1:IID) : Boolean
      {
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:uint = this.var_404.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(getQualifiedClassName(this.var_404[_loc4_].identifier) == _loc2_)
            {
               return true;
            }
            _loc4_++;
         }
         return false;
      }
      
      protected function loadErrorHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         var _loc3_:String = _loc2_.getLastErrorMessage();
         this.removeLibraryLoader(_loc2_);
         this.error("Failed to download component resource \"" + _loc2_.url + "\"!" + "\r" + _loc3_,true,Core.const_1310);
      }
      
      public final function detachComponent(param1:Component) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = iids.getIndexByImplementor(param1);
         while(_loc3_ > -1)
         {
            _loc2_ = iids.remove(_loc3_);
            _loc3_ = iids.getIndexByImplementor(param1);
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.var_282.length)
         {
            if(this.var_282[_loc4_] == param1)
            {
               this.var_282.splice(_loc4_,1);
               param1.events.removeEventListener(Component.INTERNAL_EVENT_UNLOCKED,this.lockEventHandler);
               return;
            }
            _loc4_++;
         }
      }
      
      public final function prepareComponent(param1:Class, param2:uint = 0, param3:ApplicationDomain = null) : IUnknown
      {
         var manifest:XML = null;
         var component:Component = null;
         var componentClass:Class = null;
         var componentString:String = null;
         var interfaceList:XMLList = null;
         var interfaceClass:Class = null;
         var interfaceString:String = null;
         var iid:IID = null;
         var iidList:Array = null;
         var iidClass:Class = null;
         var iidString:String = null;
         var item:XML = null;
         var version:String = null;
         var unknown:IUnknown = null;
         var source:Object = null;
         var bytes:ByteArray = null;
         var assetList:XMLList = null;
         var assetNode:XML = null;
         var assetName:String = null;
         var assetType:AssetTypeDeclaration = null;
         var asset:IAsset = null;
         var assetCount:uint = 0;
         var assetLibrary:IAssetLibrary = null;
         var k:uint = 0;
         var j:uint = 0;
         var resource:Class = param1;
         var flags:uint = param2;
         var domain:ApplicationDomain = param3;
         if(domain == null)
         {
            domain = ApplicationDomain.currentDomain;
         }
         try
         {
            source = (resource as Object).manifest;
            if(source is XML)
            {
               manifest = source as XML;
            }
            else if(source is Class)
            {
               bytes = new (source as Class)() as ByteArray;
               manifest = new XML(bytes.readUTFBytes(bytes.length));
            }
         }
         catch(e:Error)
         {
            manifest = null;
         }
         if(manifest == null)
         {
            Logger.log("Failed to find embedded manifest.xml in " + resource + "!");
            return null;
         }
         var componentList:XMLList = manifest.child("component");
         var i:uint = 0;
         while(i < componentList.length())
         {
            item = componentList[i];
            version = item.attribute("version");
            assetList = item.child("assets");
            assetCount = assetList.length();
            assetLibrary = null;
            if(assetCount > 0)
            {
               assetList = assetList.child("asset");
               assetCount = assetList.length();
               assetLibrary = new AssetLibrary("_assets@" + componentString);
               k = 0;
               while(k < assetCount)
               {
                  assetNode = assetList[k];
                  assetName = assetNode.attribute("name");
                  assetType = assetLibrary.getAssetTypeDeclarationByMimeType(assetNode.attribute("mimeType"));
                  asset = new assetType.assetClass(assetType);
                  asset.setUnknownContent(resource[assetName]);
                  if(!assetLibrary.setAsset(assetName,asset))
                  {
                     this.error("Manifest for component " + componentString + " contains broken asset \"" + assetName + "\"!",true,Core.const_693);
                  }
                  k++;
               }
            }
            componentString = item.attribute("class");
            componentClass = domain.getDefinition(componentString) as Class;
            if(componentClass == null)
            {
               componentClass = getDefinitionByName(componentString) as Class;
            }
            if(componentClass == null)
            {
               this.error("Invalid component class " + componentString + "!",true,Core.const_693);
               return null;
            }
            component = assetLibrary == null ? new componentClass(this,flags) : new componentClass(this,flags,assetLibrary);
            if(component != null)
            {
               if(assetLibrary != null)
               {
                  if(component.assets != assetLibrary)
                  {
                     assetLibrary.dispose();
                     this.error("Component \"" + componentString + "\" did not save provided asset library!",true,Core.const_693);
                  }
               }
               interfaceList = item.child("interface");
               iidList = new Array();
               j = 0;
               while(j < interfaceList.length())
               {
                  iidString = interfaceList[j].attribute("iid");
                  iidClass = domain.getDefinition(iidString) as Class;
                  if(iidClass == null)
                  {
                     iidClass = getDefinitionByName(iidString) as Class;
                  }
                  if(iidClass == null)
                  {
                     throw new InvalidComponentException("Identifier class defined in manifest not found: " + iidString);
                  }
                  iid = new iidClass();
                  unknown = component as IUnknown;
                  component.iids.insert(new InterfaceStruct(iid,component));
                  iidList.push(iid);
                  j++;
               }
               this.attachComponent(component,iidList);
            }
            i++;
         }
         return component as IUnknown;
      }
      
      override public function queueInterface(param1:IID, param2:Function = null) : IUnknown
      {
         var _loc4_:* = null;
         var _loc3_:InterfaceStruct = iids.getStructByInterface(param1);
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.unknown.queueInterface(param1,param2);
            if(_loc4_)
            {
               return _loc4_;
            }
         }
         if(param2 != null)
         {
            this.addQueueeForInterface(param1,param2);
         }
         return null;
      }
      
      public final function attachComponent(param1:Component, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this.var_282.indexOf(param1) > -1)
         {
            this.error("Component " + param1 + " already attached to context!",false);
            return;
         }
         this.var_282.push(param1);
         if(param1.locked)
         {
            param1.events.addEventListener(Component.INTERNAL_EVENT_UNLOCKED,this.lockEventHandler);
         }
         var _loc4_:uint = param2.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param2[_loc3_];
            if(param1.iids.find(_loc5_) == null)
            {
               param1.iids.insert(new InterfaceStruct(_loc5_,param1));
            }
            iids.insert(new InterfaceStruct(_loc5_,param1));
            _loc3_++;
         }
         if(!param1.locked)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               _loc6_ = param2[_loc3_];
               if(this.hasQueueForInterface(_loc6_))
               {
                  this.announceInterfaceAvailability(_loc6_,param1);
               }
               _loc3_++;
            }
         }
      }
      
      protected function loadDebugHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         var _loc3_:String = _loc2_.getLastDebugMessage();
         this.debug(_loc3_);
      }
   }
}
