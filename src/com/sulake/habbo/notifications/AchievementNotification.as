package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.external.ExternalInterface;
   import flash.geom.Matrix;
   
   public class AchievementNotification
   {
       
      
      private var var_1865:int;
      
      private var var_717:String;
      
      private var var_379:ISessionDataManager;
      
      private var _window:IFrameWindow;
      
      private var var_2477:String;
      
      private var _text:String;
      
      private var var_94:IHabboLocalizationManager;
      
      public function AchievementNotification(param1:String, param2:int, param3:IAssetLibrary, param4:IHabboWindowManager, param5:IHabboLocalizationManager, param6:IHabboConfigurationManager, param7:ISessionDataManager)
      {
         var _loc9_:* = null;
         super();
         if(!param3 || !param4 || !param5 || !param6 || !param7)
         {
            return;
         }
         this.var_717 = param1;
         this.var_1865 = param2;
         this.var_379 = param7;
         param7.events.addEventListener(BadgeImageReadyEvent.const_125,this.onBadgeImageReady);
         var _loc8_:XmlAsset = param3.getAssetByName("achievement_notification_xml") as XmlAsset;
         if(_loc8_ == null)
         {
            return;
         }
         this._window = param4.buildFromXML(_loc8_.content as XML) as IFrameWindow;
         if(this._window == null)
         {
            return;
         }
         this._window.procedure = this.eventHandler;
         this._window.center();
         this.var_94 = param5;
         this.registerBadgeParameters("notifications.text.achievement");
         this._text = param5.getKey("notifications.text.achievement");
         this.registerBadgeParameters("notifications.text.achievement_facebook");
         this.var_2477 = param5.getKey("notifications.text.achievement_facebook");
         this.setText("achievement_info",this._text);
         this.setImage("badge_image",param7.getBadgeImage(param1));
         if(!param6.keyExists("facebook.user"))
         {
            _loc9_ = this._window.findChildByName("post_to_facebook");
            if(_loc9_ != null)
            {
               _loc9_.visible = false;
            }
         }
      }
      
      private function setImage(param1:String, param2:BitmapData) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName(param1) as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         var _loc5_:int = _loc4_.width * 0.5 - param2.width;
         var _loc6_:int = _loc4_.height * 0.5 - param2.height;
         _loc4_.draw(param2,new Matrix(2,0,0,2,_loc5_,_loc6_));
         _loc3_.bitmap = _loc4_;
      }
      
      private function onBadgeImageReady(param1:BadgeImageReadyEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.badgeId != this.var_717)
         {
            return;
         }
         this.setImage("badge_image",param1.badgeImage);
      }
      
      private function setText(param1:String, param2:String) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc3_:ITextWindow = this._window.findChildByName(param1) as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.text = param2;
      }
      
      public function dispose() : void
      {
         if(this.var_379 != null)
         {
            this.var_379.events.removeEventListener(BadgeImageReadyEvent.const_125,this.onBadgeImageReady);
            this.var_379 = null;
         }
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "post_to_facebook":
               if(false)
               {
                  ExternalInterface.call("FlashExternalInterface.postAchievement",this.var_717,this.var_2477);
               }
               this.dispose();
               break;
            case "header_button_close":
            case "close":
               this.dispose();
               return;
         }
      }
      
      private function registerBadgeParameters(param1:String) : void
      {
         this.var_94.registerParameter(param1,"badge_name",this.var_94.getKey("badge_name_" + this.var_717,this.var_717));
         this.var_94.registerParameter(param1,"badge_desc",this.var_94.getKey("badge_desc_" + this.var_717,this.var_717));
         this.var_94.registerParameter(param1,"level",this.var_1865.toString());
         this.var_94.registerParameter(param1,"name",this.var_379.userName);
         this.var_94.registerParameter(param1,"realname",this.var_379.realName);
      }
   }
}
