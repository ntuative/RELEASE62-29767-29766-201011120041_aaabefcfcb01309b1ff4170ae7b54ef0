package com.sulake.habbo.friendlist
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.friendlist.AcceptBuddyFailureData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.AcceptBuddyResultEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.BuddyRequestsEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FollowFriendFailedEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListUpdateEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.HabboSearchResultEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.MessengerErrorEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.MessengerInitEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.NewBuddyRequestEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.RoomInviteErrorEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.FriendListUpdateMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.GetBuddyRequestsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.MessengerInitMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.RequestBuddyMessageComposer;
   import com.sulake.habbo.communication.messages.parser.friendlist.AcceptBuddyResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.BuddyRequestsMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.FollowFriendFailedMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.HabboSearchResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.MessengerErrorMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.MessengerInitMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.NewBuddyRequestMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.RoomInviteErrorMessageParser;
   import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.domain.AvatarSearchDeps;
   import com.sulake.habbo.friendlist.domain.AvatarSearchResults;
   import com.sulake.habbo.friendlist.domain.Friend;
   import com.sulake.habbo.friendlist.domain.FriendCategories;
   import com.sulake.habbo.friendlist.domain.FriendCategoriesDeps;
   import com.sulake.habbo.friendlist.domain.FriendCategory;
   import com.sulake.habbo.friendlist.domain.FriendListTab;
   import com.sulake.habbo.friendlist.domain.FriendListTabs;
   import com.sulake.habbo.friendlist.domain.FriendListTabsDeps;
   import com.sulake.habbo.friendlist.domain.FriendRequest;
   import com.sulake.habbo.friendlist.domain.FriendRequests;
   import com.sulake.habbo.friendlist.domain.FriendRequestsDeps;
   import com.sulake.habbo.friendlist.events.HabboFriendListTrackingEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.messenger.IHabboMessenger;
   import com.sulake.habbo.notifications.IHabboNotifications;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboMessenger;
   import com.sulake.iid.IIDHabboNotifications;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import iid.IIDHabboWindowManager;
   
   public class HabboFriendList extends Component implements IHabboFriendList, IAvatarImageListener
   {
      
      public static const const_140:String = "face";
       
      
      private var var_538:Timer;
      
      private var var_164:IHabboConfigurationManager;
      
      private var var_1535:OpenedToWebPopup;
      
      private var var_997:IAvatarRenderManager;
      
      private var var_192:IHabboToolbar;
      
      private var var_341:FriendListTabs;
      
      private var _localization:IHabboLocalizationManager;
      
      private var _view:FriendListView;
      
      private var var_119:IHabboMessenger;
      
      private var var_1536:AvatarSearchResults;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_649:ISessionDataManager;
      
      private var var_302:FriendRequests;
      
      private var var_1876:int;
      
      var var_90:FriendCategories;
      
      private var var_2131:FriendListLookAndFeel;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_805:IHabboNotifications;
      
      public function HabboFriendList(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_2131 = new FriendListLookAndFeel();
         super(param1,param2,param3);
         this.var_90 = new FriendCategories(new FriendCategoriesDeps(this));
         this.var_1536 = new AvatarSearchResults(new AvatarSearchDeps(this));
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationComponentInit);
      }
      
      private function onBuddyRequests(param1:IMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:BuddyRequestsMessageParser = (param1 as BuddyRequestsEvent).getParser();
         this.var_302.clearAndUpdateView(false);
         for each(_loc3_ in _loc2_.reqs)
         {
            this.var_302.addRequest(new FriendRequest(_loc3_));
         }
         if(_loc2_.reqs.length > 0)
         {
            this.var_341.findTab(FriendListTab.const_92).setNewMessageArrived(true);
            this.refreshToolBarIcon();
         }
         this._view.refresh("buddyRequests");
      }
      
      public function showLimitReachedAlert() : void
      {
         this.registerParameter("friendlist.listfull.text","mylimit","" + this.friendRequests.limit);
         this.registerParameter("friendlist.listfull.text","clublimit","" + this.friendRequests.clubLimit);
         this.registerParameter("friendlist.listfull.text","viplimit","" + this.friendRequests.vipLimit);
         new SimpleAlertView(this,"${friendlist.listfull.title}","${friendlist.listfull.text}").show();
      }
      
      private function onFollowFriendFailed(param1:IMessageEvent) : void
      {
         var _loc2_:FollowFriendFailedMessageParser = (param1 as FollowFriendFailedEvent).getParser();
         var _loc3_:String = this.getFollowFriendErrorText(_loc2_.errorCode);
         Logger.log("Received follow friend failed: " + _loc2_.errorCode + ", " + _loc3_);
         new SimpleAlertView(this,"${friendlist.alert.title}",_loc3_).show();
      }
      
      public function getButtonImage(param1:String) : BitmapData
      {
         var _loc5_:* = null;
         var _loc2_:IAsset = assets.getAssetByName(param1 + "_png");
         var _loc3_:BitmapDataAsset = _loc2_ as BitmapDataAsset;
         Logger.log("GETTING ASSET: " + param1);
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         Logger.log("GOT ASSET: " + _loc2_ + ", " + _loc4_);
         _loc5_ = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         _loc5_.draw(_loc4_);
         return _loc5_;
      }
      
      public function getFriendNames() : Array
      {
         if(this.var_90 == null)
         {
            return [];
         }
         return this.var_90.getFriendNames();
      }
      
      public function get messenger() : IHabboMessenger
      {
         return this.var_119;
      }
      
      public function get categories() : FriendCategories
      {
         return this.var_90;
      }
      
      private function prepareButton(param1:IBitmapWrapperWindow, param2:String, param3:Function, param4:int) : void
      {
         param1.id = param4;
         if(param1.bitmap != null)
         {
            return;
         }
         param1.bitmap = this.getButtonImage(param2);
         param1.width = param1.bitmap.width;
         param1.height = param1.bitmap.height;
         param1.procedure = param3;
      }
      
      private function onSessionDataReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_649 = param2 as ISessionDataManager;
      }
      
      private function onMessengerInit(param1:IMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         this._view = new FriendListView(this);
         var _loc2_:MessengerInitMessageParser = (param1 as MessengerInitEvent).getParser();
         this.var_302 = new FriendRequests(new FriendRequestsDeps(this),_loc2_.userFriendLimit,_loc2_.extendedFriendLimit,_loc2_.evenMoreExtendedFriendLimit);
         for each(_loc3_ in _loc2_.categories)
         {
            this.var_90.addCategory(new FriendCategory(_loc3_.id,_loc3_.name));
         }
         this.var_90.addCategory(new FriendCategory(FriendCategory.const_1038,this.getText("friendlist.friends")));
         this.var_90.addCategory(new FriendCategory(FriendCategory.const_449,this.getText("friendlist.friends.offlinecaption")));
         for each(_loc4_ in this.getSortedFriends(_loc2_.friends))
         {
            this.var_90.addFriend(new Friend(_loc4_));
         }
         this.var_341 = new FriendListTabs(new FriendListTabsDeps(this));
         if(!this.var_538)
         {
            this.var_538 = new Timer(120000);
            this.var_538.addEventListener(TimerEvent.TIMER,this.sendFriendListUpdate);
            this.var_538.start();
         }
         this.getBuddyRequests();
         this.registerListeners();
         this.var_192.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_121,HabboToolbarIconEnum.FRIENDLIST));
         this.var_192.events.addEventListener(HabboToolbarEvent.const_48,this.onHabboToolbarEvent);
         Logger.log("FRIENDLIST INITIALIZED SUCCESSFULLY");
      }
      
      override public function dispose() : void
      {
         if(this.var_538)
         {
            this.var_538.stop();
            this.var_538.removeEventListener(TimerEvent.TIMER,this.sendFriendListUpdate);
            this.var_538 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._communication)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this.var_119)
         {
            this.var_119.release(new IIDHabboMessenger());
            this.var_119 = null;
         }
         if(this.var_164)
         {
            this.var_164.release(new IIDHabboConfigurationManager());
            this.var_164 = null;
         }
         if(this._localization)
         {
            this._localization.release(new IIDHabboLocalizationManager());
            this._localization = null;
         }
         if(this.var_997)
         {
            this.var_997.release(new IIDAvatarRenderManager());
            this.var_997 = null;
         }
         if(this.var_805)
         {
            this.var_805.release(new IIDHabboNotifications());
            this.var_805 = null;
         }
         if(this.var_192)
         {
            this.var_192.release(new IIDHabboToolbar());
            this.var_192 = null;
         }
         if(this.var_649)
         {
            this.var_649.release(new IIDSessionDataManager());
            this.var_649 = null;
         }
         super.dispose();
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:UserObjectMessageParser = (param1 as UserObjectEvent).getParser();
         this.var_1876 = int(_loc2_.id);
      }
      
      public function get searchResults() : AvatarSearchResults
      {
         return this.var_1536;
      }
      
      public function getButton(param1:String, param2:String, param3:Function, param4:int = 0, param5:int = 0, param6:int = 0) : IBitmapWrapperWindow
      {
         var _loc7_:BitmapData = this.getButtonImage(param2);
         var _loc8_:IBitmapWrapperWindow = this._windowManager.createWindow(param1,"",HabboWindowType.const_215,HabboWindowStyle.const_36,0 | 0,new Rectangle(param4,param5,_loc7_.width,_loc7_.height),param3,param6) as IBitmapWrapperWindow;
         _loc8_.bitmap = _loc7_;
         return _loc8_;
      }
      
      public function getXmlWindow(param1:String) : IWindow
      {
         var _loc2_:IAsset = assets.getAssetByName(param1 + "_xml");
         var _loc3_:XmlAsset = XmlAsset(_loc2_);
         var _loc4_:ICoreWindowManager = ICoreWindowManager(this._windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content));
      }
      
      private function onMessengerComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: messenger available " + [param1,param2]);
         this.var_119 = param2 as IHabboMessenger;
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRenderedReady);
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:Dictionary = this.var_90.getAllFriends();
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_ && !_loc3_.disposed && _loc3_.figure == param1)
            {
               _loc3_.face = this.getAvatarFaceBitmap(_loc3_.figure);
               if(_loc3_.face)
               {
                  _loc4_ = _loc3_.view.getChildByName(const_140) as IBitmapWrapperWindow;
                  _loc4_.bitmap.fillRect(_loc4_.bitmap.rect,0);
                  _loc4_.bitmap.copyPixels(_loc3_.face,_loc3_.face.rect,new Point(0,0),null,null,true);
                  _loc4_.invalidate();
               }
            }
         }
      }
      
      private function onFriendListUpdate(param1:IMessageEvent) : void
      {
         this.var_90.onFriendListUpdate(param1);
         this._view.refresh("friendListUpdate");
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: window manager " + [param1,param2]);
         this._windowManager = param2 as IHabboWindowManager;
         this._communication.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this.onAuthOK));
         this._communication.addHabboConnectionMessageEvent(new UserObjectEvent(this.onUserObject));
         queueInterface(new IIDSessionDataManager(),this.onSessionDataReady);
      }
      
      public function registerParameter(param1:String, param2:String, param3:String) : void
      {
         this._localization.registerParameter(param1,param2,param3);
      }
      
      private function onAuthOK(param1:IMessageEvent) : void
      {
         this._communication.addHabboConnectionMessageEvent(new MessengerInitEvent(this.onMessengerInit));
         this.send(new MessengerInitMessageComposer());
      }
      
      private function onAcceptBuddyResult(param1:IMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:AcceptBuddyResultMessageParser = (param1 as AcceptBuddyResultEvent).getParser();
         for each(_loc3_ in _loc2_.failures)
         {
            this.friendRequests.acceptFailed(_loc3_.senderName);
         }
      }
      
      public function openFriendList() : void
      {
         if(this._view == null)
         {
            Logger.log("Cannot open friendlist. Friendlist not initialized.");
            return;
         }
         this._view.openFriendList();
         var _loc1_:FriendListTab = this.tabs.findTab(FriendListTab.const_93);
         if(_loc1_ != this.tabs.findSelectedTab())
         {
            this.tabs.toggleSelected(_loc1_);
            this.view.refresh("openFriendList");
         }
         this._view.mainWindow.activate();
      }
      
      public function get avatarId() : int
      {
         return this.var_1876;
      }
      
      public function isEmbeddedMinimailEnabled() : Boolean
      {
         var _loc1_:String = this.var_164.getKey("client.minimail.embed.enabled");
         return _loc1_ == "true";
      }
      
      private function getSortedFriends(param1:Array) : Array
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:Array = new Array();
         var _loc3_:Dictionary = new Dictionary();
         for each(_loc4_ in param1)
         {
            _loc2_.push(_loc4_.name.toLowerCase());
            _loc3_[_loc4_.name.toLowerCase()] = _loc4_;
         }
         _loc2_.sort();
         _loc5_ = new Array();
         for each(_loc6_ in _loc2_)
         {
            _loc5_.push(_loc3_[_loc6_]);
         }
         return _loc5_;
      }
      
      private function toggleWindow() : void
      {
         var _loc1_:* = null;
         if(this._view.isFriendListOpen())
         {
            this._view.close();
            this.trackFriendListEvent(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_CLOSED);
         }
         else
         {
            this._view.openFriendList();
            _loc1_ = this.var_341.findSelectedTab();
            if(_loc1_ == null)
            {
               events.dispatchEvent(new Event(HabboFriendListTrackingEvent.const_324));
            }
            else
            {
               switch(_loc1_.id)
               {
                  case FriendListTab.const_93:
                     this.trackFriendListEvent(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_FRIENDS);
                     break;
                  case FriendListTab.const_349:
                     this.trackFriendListEvent(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_SEARCH);
                     break;
                  case FriendListTab.const_92:
                     this.trackFriendListEvent(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_REQUEST);
               }
            }
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_192 = IHabboToolbar(param2) as IHabboToolbar;
         queueInterface(new IIDHabboNotifications(),this.onNotificationsReady);
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: localization " + [param1,param2]);
         this._localization = param2 as IHabboLocalizationManager;
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onMessengerError(param1:IMessageEvent) : void
      {
         var _loc2_:MessengerErrorMessageParser = (param1 as MessengerErrorEvent).getParser();
         var _loc3_:String = "";
         switch(_loc2_.errorCode)
         {
            case 1:
               _loc3_ = "${friendlist.error.friendlistownlimit}";
               break;
            case 2:
               _loc3_ = "${friendlist.error.friendlistlimitofrequester}";
               break;
            case 3:
               _loc3_ = "${friendlist.error.friend_requests_disabled}";
               break;
            case 4:
               _loc3_ = "${friendlist.error.requestnotfound}";
               break;
            default:
               _loc3_ = "Received messenger error: msg: " + _loc2_.clientMessageId + ", errorCode: " + _loc2_.errorCode;
         }
         new SimpleAlertView(this,"${friendlist.alert.title}",_loc3_).show();
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.iconId != HabboToolbarIconEnum.FRIENDLIST)
         {
            return;
         }
         if(param1.type == HabboToolbarEvent.const_48)
         {
            this.toggleWindow();
         }
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this.var_192;
      }
      
      private function onHabboSearchResult(param1:IMessageEvent) : void
      {
         var _loc2_:HabboSearchResultMessageParser = (param1 as HabboSearchResultEvent).getParser();
         this.var_1536.searchReceived(_loc2_.friends,_loc2_.others);
         this._view.refresh("search");
      }
      
      public function get tabs() : FriendListTabs
      {
         return this.var_341;
      }
      
      public function get friendRequests() : FriendRequests
      {
         return this.var_302;
      }
      
      public function send(param1:IMessageComposer) : void
      {
         this._communication.getHabboMainConnection(null).send(param1);
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: configuration " + [param1,param2]);
         this.var_164 = param2 as IHabboConfigurationManager;
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationReady);
      }
      
      public function get laf() : FriendListLookAndFeel
      {
         return this.var_2131;
      }
      
      public function refreshToolBarIcon() : void
      {
         var _loc1_:HabboToolbarSetIconEvent = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_137,HabboToolbarIconEnum.FRIENDLIST);
         _loc1_.iconState = String(this.var_302.getCountOfOpenRequests() > 0 ? "2" : "0");
         this.var_192.events.dispatchEvent(_loc1_);
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function canBeAskedForAFriend(param1:int) : Boolean
      {
         if(this._view == null)
         {
            Logger.log("Cannot process canBeAskedForAFriend. Friendlist not initialized.");
            return false;
         }
         return this.getFriend(param1) == null && !this.searchResults.isFriendRequestSent(param1) && this.categories.getFriendCount(false) < this.friendRequests.limit;
      }
      
      public function getFriend(param1:int) : IFriend
      {
         if(this._view == null)
         {
            Logger.log("Cannot process getFriend. Friendlist not initialized.");
            return null;
         }
         return this.var_90.findFriend(param1);
      }
      
      public function get view() : FriendListView
      {
         return this._view;
      }
      
      public function getText(param1:String) : String
      {
         return this._localization.getKey(param1);
      }
      
      public function askForAFriend(param1:int, param2:String) : Boolean
      {
         if(this._view == null)
         {
            Logger.log("Cannot ask for friend. Friendlist not initialized.");
            return false;
         }
         if(!this.canBeAskedForAFriend(param1))
         {
            return false;
         }
         this.send(new RequestBuddyMessageComposer(param2));
         this.searchResults.setFriendRequestSent(param1);
         return true;
      }
      
      private function getFollowFriendErrorText(param1:int) : String
      {
         if(param1 == 0)
         {
            return "${friendlist.followerror.notfriend}";
         }
         if(param1 == 1)
         {
            return "${friendlist.followerror.offline}";
         }
         if(param1 == 2)
         {
            return "${friendlist.followerror.hotelview}";
         }
         if(param1 == 3)
         {
            return "${friendlist.followerror.prevented}";
         }
         return "Unknown follow friend error " + param1;
      }
      
      public function refreshText(param1:IWindowContainer, param2:String, param3:Boolean, param4:String) : void
      {
         var _loc5_:ITextWindow = ITextWindow(param1.getChildByName(param2));
         if(!param3)
         {
            _loc5_.visible = false;
         }
         else
         {
            _loc5_.visible = true;
            _loc5_.text = param4;
         }
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         if(!this.var_649 || !this.var_302)
         {
            return;
         }
         var _loc2_:int = 0;
         if(this.var_649.hasUserRight("fuse_super_extended_buddylist"))
         {
            _loc2_ = this.var_302.vipLimit;
         }
         else if(this.var_649.hasUserRight("fuse_extended_buddylist"))
         {
            _loc2_ = this.var_302.clubLimit;
         }
         if(_loc2_ > this.var_302.limit)
         {
            this.var_302.limit = _loc2_;
         }
      }
      
      public function declineFriendRequest(param1:int) : void
      {
         var _loc2_:FriendListTab = this.var_341.findTab(FriendListTab.const_92);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:IFriendRequestsView = _loc2_.tabView as IFriendRequestsView;
         if(!_loc3_)
         {
            return;
         }
         _loc3_.declineRequest(param1);
      }
      
      private function onRoomInviteError(param1:IMessageEvent) : void
      {
         var _loc2_:RoomInviteErrorMessageParser = (param1 as RoomInviteErrorEvent).getParser();
         var _loc3_:String = "Received room invite error: errorCode: " + _loc2_.errorCode + ", recipients: " + Util.arrayToString(_loc2_.failedRecipients);
         new SimpleAlertView(this,"${friendlist.alert.title}",_loc3_).show();
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc2_:IAvatarImage = this.var_997.createAvatarImage(param1,AvatarScaleType.SMALL,null,this);
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:BitmapData = _loc2_.getCroppedImage(AvatarSetType.const_41);
         _loc2_.dispose();
         return _loc3_;
      }
      
      private function onNewBuddyRequest(param1:IMessageEvent) : void
      {
         Logger.log("Received new buddy request");
         var _loc2_:NewBuddyRequestMessageParser = (param1 as NewBuddyRequestEvent).getParser();
         var _loc3_:FriendRequest = new FriendRequest(_loc2_.req);
         this.var_302.addRequestAndUpdateView(_loc3_);
         var _loc4_:FriendListTab = this.var_341.findTab(FriendListTab.const_92);
         _loc4_.setNewMessageArrived(true);
         this.refreshToolBarIcon();
         this._view.refresh("newBuddyRequest");
      }
      
      private function onCommunicationComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Friend list: communication available " + [param1,param2]);
         this._communication = param2 as IHabboCommunicationManager;
         queueInterface(new IIDHabboMessenger(),this.onMessengerComponentInit);
      }
      
      public function trackFriendListEvent(param1:String) : void
      {
         events.dispatchEvent(new Event(param1));
      }
      
      private function onAvatarRenderedReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Messenger: avatar renderer " + [param1,param2]);
         this.var_997 = param2 as IAvatarRenderManager;
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationReady);
      }
      
      private function onNotificationsReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_805 = param2 as IHabboNotifications;
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
      }
      
      public function getFriendCount(param1:Boolean, param2:Boolean) : int
      {
         if(this._view == null)
         {
            Logger.log("Cannot get friend count. Friendlist not initialized.");
            return 0;
         }
         return this.var_90.getFriendCount(param1,param2);
      }
      
      private function registerListeners() : void
      {
         this._communication.addHabboConnectionMessageEvent(new FollowFriendFailedEvent(this.onFollowFriendFailed));
         this._communication.addHabboConnectionMessageEvent(new FriendListUpdateEvent(this.onFriendListUpdate));
         this._communication.addHabboConnectionMessageEvent(new BuddyRequestsEvent(this.onBuddyRequests));
         this._communication.addHabboConnectionMessageEvent(new NewBuddyRequestEvent(this.onNewBuddyRequest));
         this._communication.addHabboConnectionMessageEvent(new AcceptBuddyResultEvent(this.onAcceptBuddyResult));
         this._communication.addHabboConnectionMessageEvent(new MessengerErrorEvent(this.onMessengerError));
         this._communication.addHabboConnectionMessageEvent(new HabboSearchResultEvent(this.onHabboSearchResult));
         this._communication.addHabboConnectionMessageEvent(new RoomInviteErrorEvent(this.onRoomInviteError));
         this._communication.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this.onUserRights));
      }
      
      public function get notifications() : IHabboNotifications
      {
         return this.var_805;
      }
      
      public function refreshButton(param1:IWindowContainer, param2:String, param3:Boolean, param4:Function, param5:int) : void
      {
         var _loc6_:IBitmapWrapperWindow = param1.findChildByName(param2) as IBitmapWrapperWindow;
         if(!param3)
         {
            _loc6_.visible = false;
         }
         else
         {
            this.prepareButton(_loc6_,param2,param4,param5);
            _loc6_.visible = true;
         }
      }
      
      private function getVariable(param1:String, param2:Dictionary) : String
      {
         return this.var_164.getKey(param1,param1,param2);
      }
      
      public function refreshIcon(param1:IWindowContainer, param2:String, param3:Boolean, param4:Function, param5:int) : void
      {
         var _loc6_:IWindow = param1.findChildByName(param2);
         if(!param3)
         {
            _loc6_.visible = false;
         }
         else
         {
            _loc6_.id = param5;
            _loc6_.procedure = param4;
            _loc6_.visible = true;
         }
      }
      
      public function openHabboWebPage(param1:String, param2:Dictionary, param3:int, param4:int) : void
      {
         var linkAlias:String = param1;
         var params:Dictionary = param2;
         var x:int = param3;
         var y:int = param4;
         var url:String = this.getVariable(linkAlias,params);
         var webWindowName:String = "habboMain";
         try
         {
            HabboWebTools.navigateToURL(url,webWindowName);
         }
         catch(e:Error)
         {
            Logger.log("GOT ERROR: " + e);
         }
         if(this.var_1535 == null)
         {
            this.var_1535 = new OpenedToWebPopup(this);
         }
         this.var_1535.show(x,y);
      }
      
      public function acceptFriendRequest(param1:int) : void
      {
         var _loc2_:FriendListTab = this.var_341.findTab(FriendListTab.const_92);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:IFriendRequestsView = _loc2_.tabView as IFriendRequestsView;
         if(!_loc3_)
         {
            return;
         }
         _loc3_.acceptRequest(param1);
      }
      
      private function getBuddyRequests() : void
      {
         Logger.log("Sending buddy requests request");
         this.send(new GetBuddyRequestsMessageComposer());
      }
      
      protected function sendFriendListUpdate(param1:Event) : void
      {
         Logger.log("Sending update request");
         this.send(new FriendListUpdateMessageComposer());
      }
   }
}
