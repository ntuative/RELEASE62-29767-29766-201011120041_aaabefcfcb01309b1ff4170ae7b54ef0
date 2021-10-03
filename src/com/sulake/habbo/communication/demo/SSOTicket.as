package com.sulake.habbo.communication.demo
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.habbo.communication.IHabboWebLogin;
   import com.sulake.habbo.communication.enum.HabboWeb;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class SSOTicket extends EventDispatcher
   {
      
      public static const const_269:String = "failure";
      
      public static const const_322:String = "success";
       
      
      private var _assets:IAssetLibrary;
      
      private var var_1170:String;
      
      private var var_1928:String;
      
      private var var_1427:String;
      
      private var var_1171:IHabboWebLogin;
      
      private var var_38:URLLoader;
      
      private var var_2599:String;
      
      public function SSOTicket(param1:IAssetLibrary, param2:IHabboWebLogin, param3:String)
      {
         super();
         this._assets = param1;
         this.var_1171 = param2;
         this.var_1170 = "http://" + param3 + "/client";
         this.var_1171.init();
         this.var_1171.addEventListener(HabboWeb.const_193,this.requestClientURL);
      }
      
      public function get shockwaveClientUrl() : String
      {
         return this.var_1928;
      }
      
      private function requestClientURL(param1:Event = null) : void
      {
         var _loc2_:String = this.var_1170;
         if(this._assets.hasAsset(_loc2_))
         {
            Logger.log("[CoreLocalizationManager] reload localization for url: " + this.var_1170);
         }
         var _loc3_:URLRequest = new URLRequest(this.var_1170);
         if(this._assets.hasAsset(_loc2_))
         {
            this._assets.removeAsset(this._assets.getAssetByName(_loc2_));
         }
         var _loc4_:AssetLoaderStruct = this._assets.loadAssetFromFile(_loc2_,_loc3_,"text/plain");
         _loc4_.addEventListener(AssetLoaderEvent.const_30,this.clientURLComplete);
      }
      
      public function get ticket() : String
      {
         return this.var_1427;
      }
      
      private function clientURLComplete(param1:Event = null) : void
      {
         var event:Event = param1;
         var loaderStruct:AssetLoaderStruct = event.target as AssetLoaderStruct;
         if(loaderStruct == null)
         {
            return;
         }
         var data:String = loaderStruct.assetLoader.content as String;
         if(data.indexOf("account/reauthenticate\"") > -1)
         {
            this.var_1171.requestReAuthenticate();
         }
         else
         {
            try
            {
               this.var_1427 = /\"sso.ticket\" : \"(.*?)\"/.exec(data)[1];
               this.var_1928 = /\"flash.client.url\" : \"(.*?)\"/.exec(data)[1];
               if(this.var_1427.length > 0)
               {
                  dispatchEvent(new Event(const_322));
               }
               else
               {
                  dispatchEvent(new Event(const_269));
               }
            }
            catch(e:Error)
            {
               trace(e);
               dispatchEvent(new Event(const_269));
            }
         }
      }
   }
}
