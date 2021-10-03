package com.sulake.habbo.widget
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.chatinput.RoomChatInputWidget;
   import com.sulake.habbo.widget.chooser.FurniChooserWidget;
   import com.sulake.habbo.widget.chooser.UserChooserWidget;
   import com.sulake.habbo.widget.doorbell.DoorbellWidget;
   import com.sulake.habbo.widget.friendrequest.FriendRequestWidget;
   import com.sulake.habbo.widget.furniture.clothingchange.ClothingChangeFurnitureWidget;
   import com.sulake.habbo.widget.furniture.credit.CreditFurniWidget;
   import com.sulake.habbo.widget.furniture.dimmer.DimmerFurniWidget;
   import com.sulake.habbo.widget.furniture.ecotronbox.EcotronBoxFurniWidget;
   import com.sulake.habbo.widget.furniture.placeholder.PlaceholderWidget;
   import com.sulake.habbo.widget.furniture.present.PresentFurniWidget;
   import com.sulake.habbo.widget.furniture.stickie.StickieFurniWidget;
   import com.sulake.habbo.widget.furniture.trophy.TrophyFurniWidget;
   import com.sulake.habbo.widget.infostand.InfostandWidget;
   import com.sulake.habbo.widget.loadingbar.LoadingBarWidget;
   import com.sulake.habbo.widget.memenu.MeMenuWidget;
   import com.sulake.habbo.widget.poll.PollWidget;
   import com.sulake.habbo.widget.poll.VoteWidget;
   import com.sulake.habbo.widget.roomchat.RoomChatWidget;
   import com.sulake.habbo.widget.roomqueue.RoomQueueWidget;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import iid.IIDHabboWindowManager;
   
   public class RoomWidgetFactory extends Component implements IRoomWidgetFactory
   {
       
      
      private var var_875:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _catalog:IHabboCatalog;
      
      private var var_94:IHabboLocalizationManager;
      
      private var var_2146:int = 0;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      public function RoomWidgetFactory(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         if(param1 is CoreComponent)
         {
            this.var_875 = (param1 as CoreComponent).assets;
         }
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onHabboConfigurationReady);
         queueInterface(new IIDHabboCatalog(),this.onCatalogReady);
      }
      
      public function createWidget(param1:String) : IRoomWidget
      {
         var _loc2_:* = null;
         if(this._windowManager == null)
         {
            return null;
         }
         switch(param1)
         {
            case RoomWidgetEnum.const_308:
               _loc2_ = new RoomChatWidget(this._windowManager,assets,this.var_94,this._habboConfiguration,this.var_2146++,this);
               break;
            case RoomWidgetEnum.CHAT_INPUT_WIDGET:
               _loc2_ = new RoomChatInputWidget(this._windowManager,assets,this.var_94,this);
               break;
            case RoomWidgetEnum.const_510:
               _loc2_ = new InfostandWidget(this._windowManager,assets,this.var_94,this._habboConfiguration,this._catalog);
               break;
            case RoomWidgetEnum.const_393:
               _loc2_ = new MeMenuWidget(this._windowManager,assets,this.var_94,events,this._habboConfiguration);
               break;
            case RoomWidgetEnum.const_631:
               _loc2_ = new PlaceholderWidget(this._windowManager,assets,this.var_94);
               break;
            case RoomWidgetEnum.const_414:
               _loc2_ = new CreditFurniWidget(this._windowManager,assets,this.var_94);
               break;
            case RoomWidgetEnum.const_487:
               _loc2_ = new StickieFurniWidget(this._windowManager,assets);
               break;
            case RoomWidgetEnum.const_518:
               _loc2_ = new PresentFurniWidget(this._windowManager,assets);
               break;
            case RoomWidgetEnum.const_395:
               _loc2_ = new TrophyFurniWidget(this._windowManager,assets);
               break;
            case RoomWidgetEnum.const_394:
               _loc2_ = new EcotronBoxFurniWidget(this._windowManager,assets);
               break;
            case RoomWidgetEnum.const_105:
               _loc2_ = new DoorbellWidget(this._windowManager,assets,this.var_94);
               break;
            case RoomWidgetEnum.const_423:
               _loc2_ = new LoadingBarWidget(this._windowManager,assets,this.var_94,this._habboConfiguration);
               break;
            case RoomWidgetEnum.const_793:
               _loc2_ = new RoomQueueWidget(this._windowManager,assets,this.var_94,this._habboConfiguration);
               break;
            case RoomWidgetEnum.const_122:
               _loc2_ = new VoteWidget(this._windowManager,assets,this.var_94,this._habboConfiguration);
               break;
            case RoomWidgetEnum.const_354:
               _loc2_ = new PollWidget(this._windowManager,assets,this.var_94);
               break;
            case RoomWidgetEnum.const_282:
               _loc2_ = new UserChooserWidget(this._windowManager,assets,this.var_94);
               break;
            case RoomWidgetEnum.const_422:
               _loc2_ = new FurniChooserWidget(this._windowManager,assets,this.var_94);
               break;
            case RoomWidgetEnum.const_427:
               _loc2_ = new DimmerFurniWidget(this._windowManager,assets,this.var_94);
               break;
            case RoomWidgetEnum.const_119:
               _loc2_ = new FriendRequestWidget(this._windowManager,assets,this.var_94,this);
               break;
            case RoomWidgetEnum.const_462:
               _loc2_ = new ClothingChangeFurnitureWidget(this._windowManager,assets,this.var_94);
         }
         return _loc2_;
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._habboConfiguration = param2 as IHabboConfigurationManager;
      }
      
      override public function dispose() : void
      {
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_94)
         {
            this.var_94.release(new IIDHabboLocalizationManager());
            this.var_94 = null;
         }
         if(this._habboConfiguration)
         {
            this._habboConfiguration.release(new IIDHabboConfigurationManager());
            this._habboConfiguration = null;
         }
         if(this._catalog)
         {
            this._catalog.release(new IIDHabboCatalog());
            this._catalog = null;
         }
         super.dispose();
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._catalog = param2 as IHabboCatalog;
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_94 = param2 as IHabboLocalizationManager;
      }
   }
}
