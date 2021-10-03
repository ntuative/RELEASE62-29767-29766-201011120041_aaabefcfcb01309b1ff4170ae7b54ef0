package com.sulake.habbo.avatar.alias
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAsset;
   import com.sulake.habbo.avatar.AvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarRenderAssetErrorEvent;
   import flash.utils.Dictionary;
   
   public class AssetAliasCollection
   {
       
      
      private var var_1214:AssetLibraryCollection;
      
      private var var_476:AvatarRenderManager;
      
      private var _aliases:Dictionary;
      
      public function AssetAliasCollection(param1:AvatarRenderManager, param2:AssetLibraryCollection)
      {
         super();
         this.var_476 = param1;
         this.var_1214 = param2;
         this._aliases = new Dictionary();
         this.init();
      }
      
      public function getAssetByName(param1:String) : IAsset
      {
         var _loc4_:* = null;
         var _loc2_:int = 5;
         while(this.hasAlias(param1) && _loc2_ >= 0)
         {
            _loc4_ = this._aliases[param1] as AssetAlias;
            param1 = _loc4_.link;
            _loc2_--;
         }
         var _loc3_:IAsset = this.var_1214.getAssetByName(param1);
         if(_loc3_ == null)
         {
            this.var_476.events.dispatchEvent(new AvatarRenderAssetErrorEvent(param1));
         }
         return _loc3_;
      }
      
      public function dispose() : void
      {
         this.var_1214 = null;
         this._aliases = null;
      }
      
      public function addAlias(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false) : void
      {
         var _loc5_:XML = <alias name="" link="" fliph="0" flipv="0"/>;
         _loc5_.@name = param1;
         _loc5_.@link = param2;
         var _loc6_:AssetAlias = new AssetAlias(_loc5_);
         this._aliases[param1] = _loc6_;
      }
      
      public function hasAlias(param1:String) : Boolean
      {
         var _loc2_:AssetAlias = this._aliases[param1] as AssetAlias;
         return _loc2_ != null;
      }
      
      public function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = this.var_1214.getManifests();
         for each(_loc2_ in _loc1_)
         {
            for each(_loc3_ in _loc2_.library.aliases.alias)
            {
               _loc4_ = String(_loc3_.@name);
               _loc5_ = new AssetAlias(_loc3_);
               this._aliases[_loc4_] = _loc5_;
            }
         }
      }
      
      public function getAliasByName(param1:String) : AssetAlias
      {
         return this._aliases[param1] as AssetAlias;
      }
   }
}
