package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_677:IWindowContainer;
      
      private var var_1030:ITextWindow;
      
      private var var_181:RoomSettingsCtrl;
      
      private var var_1278:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_229:Timer;
      
      private var var_2259:IWindowContainer;
      
      private var var_1277:ITextWindow;
      
      private var var_451:IWindowContainer;
      
      private var var_823:IWindowContainer;
      
      private var var_1274:IContainerButtonWindow;
      
      private var var_1606:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_864:ITextWindow;
      
      private var var_1609:IWindowContainer;
      
      private var var_1276:IWindowContainer;
      
      private var var_824:ITextWindow;
      
      private var var_1028:ITextFieldWindow;
      
      private var var_261:IWindowContainer;
      
      private var var_822:ITextWindow;
      
      private var var_1610:IButtonWindow;
      
      private var var_1029:ITextWindow;
      
      private var var_2579:int;
      
      private var var_1280:IContainerButtonWindow;
      
      private var var_821:IWindowContainer;
      
      private var var_1275:ITextWindow;
      
      private var var_1279:IContainerButtonWindow;
      
      private var var_1607:ITextWindow;
      
      private var var_1608:IButtonWindow;
      
      private var var_1112:TagRenderer;
      
      private var var_2258:ITextWindow;
      
      private var var_309:RoomEventViewCtrl;
      
      private var var_676:ITextWindow;
      
      private var _navigator:HabboNavigator;
      
      private var var_230:RoomThumbnailCtrl;
      
      private var var_1281:IContainerButtonWindow;
      
      private var var_2257:IWindowContainer;
      
      private var var_1273:IContainerButtonWindow;
      
      private var var_231:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_309 = new RoomEventViewCtrl(this._navigator);
         this.var_181 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_230 = new RoomThumbnailCtrl(this._navigator);
         this.var_1112 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_181);
         this.var_229 = new Timer(6000,1);
         this.var_229.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_181.active = true;
         this.var_309.active = false;
         this.var_230.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_309.active)
         {
            return;
         }
         this.var_1606.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1608.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1609.visible = Util.hasVisibleChildren(this.var_1609);
      }
      
      private function onFacebookLike(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_181.active || this.var_230.active)
         {
            return;
         }
         this.var_864.text = param1.roomName;
         this.var_864.height = this.var_864.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_824.text = param1.description;
         this.var_1112.refreshTags(this.var_451,param1.tags);
         this.var_824.visible = false;
         if(param1.description != "")
         {
            this.var_824.height = this.var_824.textHeight + 5;
            this.var_824.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1274,"facebook_logo_small",_loc3_,null,0);
         this.var_1274.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1281,"thumb_up",_loc4_,null,0);
         this.var_1281.visible = _loc4_;
         this.var_822.visible = !_loc4_;
         this.var_1607.visible = !_loc4_;
         this.var_1607.text = "" + this._navigator.data.currentRoomRating;
         this._navigator.refreshButton(this.var_451,"home",param2,null,0);
         this._navigator.refreshButton(this.var_451,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_451,["room_name","owner_name_cont","tags","room_desc","rating_cont"],this.var_864.y,0);
         this.var_451.visible = true;
         this.var_451.height = Util.getLowestPoint(this.var_451);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!this._navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function dispose() : void
      {
         if(this.var_229)
         {
            this.var_229.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_229.reset();
            this.var_229 = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_446,HabboToolbarIconEnum.ROOMINFO,this._window,false));
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_181.active || this.var_230.active)
         {
            return;
         }
         this.var_1610.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1278.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this.var_1273.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1280.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1279.visible = this._navigator.data.canEditRoomSettings && param1;
         this.var_1276.visible = Util.hasVisibleChildren(this.var_1276);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_229.reset();
         this.var_309.active = false;
         this.var_181.active = false;
         this.var_230.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(this._navigator.data.enteredGuestRoom.flatId);
         }
         this.refresh();
         this._window.visible = true;
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_50,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         this._window.parent.activate();
         this._window.activate();
         if(!param1)
         {
            this.var_229.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_229.reset();
         this.var_309.active = false;
         this.var_181.active = false;
         this.var_230.active = false;
         this.refresh();
         if(!this._window.visible)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_50,HabboToolbarIconEnum.ROOMINFO,this._window,false));
            this._window.parent.activate();
         }
         else
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_446,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_261);
         this.var_261.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_181.refresh(this.var_261);
         this.var_230.refresh(this.var_261);
         Util.moveChildrenToColumn(this.var_261,["room_details","room_buttons"],0,2);
         this.var_261.height = Util.getLowestPoint(this.var_261);
         this.var_261.visible = true;
         Logger.log("XORP: " + this.var_451.visible + ", " + this.var_1276.visible + ", " + this.var_677.visible + ", " + this.var_677.rectangle + ", " + this.var_261.rectangle);
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1028.setSelection(0,this.var_1028.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_231);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_309.refresh(this.var_231);
         if(Util.hasVisibleChildren(this.var_231) && !(this.var_181.active || this.var_230.active))
         {
            Util.moveChildrenToColumn(this.var_231,["event_details","event_buttons"],0,2);
            this.var_231.height = Util.getLowestPoint(this.var_231);
            this.var_231.visible = true;
         }
         else
         {
            this.var_231.visible = false;
         }
         Logger.log("EVENT: " + this.var_231.visible + ", " + this.var_231.rectangle);
      }
      
      public function startEventEdit() : void
      {
         this.var_229.reset();
         this.var_309.active = true;
         this.var_181.active = false;
         this.var_230.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         this.var_229.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_181.active || this.var_230.active)
         {
            return;
         }
         this.var_1030.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1030.height = this.var_1030.textHeight + 5;
         this.var_1277.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1277.height = this.var_1277.textHeight + 5;
         Util.moveChildrenToColumn(this.var_677,["public_space_name","public_space_desc"],this.var_1030.y,0);
         this.var_677.visible = true;
         this.var_677.height = Math.max(86,Util.getLowestPoint(this.var_677));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_181.active && !this.var_230.active && !this.var_309.active)
         {
            this.var_821.visible = true;
            this.var_1028.text = this.getEmbedData();
         }
         else
         {
            this.var_821.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_229.reset();
         this.var_181.load(param1);
         this.var_181.active = true;
         this.var_309.active = false;
         this.var_230.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_229.reset();
         this.var_181.active = false;
         this.var_309.active = false;
         this.var_230.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details"));
         this._window.setParamFlag(HabboWindowParam.const_60,false);
         this._window.setParamFlag(HabboWindowParam.const_1223,true);
         this._window.visible = false;
         this.var_261 = IWindowContainer(this.find("room_info"));
         this.var_451 = IWindowContainer(this.find("room_details"));
         this.var_677 = IWindowContainer(this.find("public_space_details"));
         this.var_2257 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2259 = IWindowContainer(this.find("rating_cont"));
         this.var_1276 = IWindowContainer(this.find("room_buttons"));
         this.var_864 = ITextWindow(this.find("room_name"));
         this.var_1030 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_824 = ITextWindow(this.find("room_desc"));
         this.var_1277 = ITextWindow(this.find("public_space_desc"));
         this.var_1029 = ITextWindow(this.find("owner_caption"));
         this.var_822 = ITextWindow(this.find("rating_caption"));
         this.var_1607 = ITextWindow(this.find("rating_txt"));
         this.var_231 = IWindowContainer(this.find("event_info"));
         this.var_823 = IWindowContainer(this.find("event_details"));
         this.var_1609 = IWindowContainer(this.find("event_buttons"));
         this.var_2258 = ITextWindow(this.find("event_name"));
         this.var_676 = ITextWindow(this.find("event_desc"));
         this.var_1274 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1281 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_1278 = IContainerButtonWindow(this.find("add_favourite_button"));
         this.var_1273 = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1280 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1279 = IContainerButtonWindow(this.find("unmake_home_button"));
         this.var_1610 = IButtonWindow(this.find("room_settings_button"));
         this.var_1606 = IButtonWindow(this.find("create_event_button"));
         this.var_1608 = IButtonWindow(this.find("edit_event_button"));
         this.var_821 = IWindowContainer(this.find("embed_info"));
         this.var_1275 = ITextWindow(this.find("embed_info_txt"));
         this.var_1028 = ITextFieldWindow(this.find("embed_src_txt"));
         Util.setProcDirectly(this.var_1278,this.onAddFavouriteClick);
         Util.setProcDirectly(this.var_1273,this.onRemoveFavouriteClick);
         Util.setProcDirectly(this.var_1610,this.onRoomSettingsClick);
         Util.setProcDirectly(this.var_1280,this.onMakeHomeClick);
         Util.setProcDirectly(this.var_1279,this.onUnmakeHomeClick);
         Util.setProcDirectly(this.var_1606,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1608,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1028,this.onEmbedSrcClick);
         Util.setProcDirectly(this.var_1281,this.onThumbUp);
         Util.setProcDirectly(this.var_1274,this.onFacebookLike);
         this._navigator.refreshButton(this.var_1278,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1273,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1280,"home",true,null,0);
         this._navigator.refreshButton(this.var_1279,"home",true,null,0);
         this._window.findChildByName("close").procedure = this.onCloseButtonClick;
         Util.setProcDirectly(this.var_261,this.onHover);
         Util.setProcDirectly(this.var_231,this.onHover);
         this.var_1029.width = this.var_1029.textWidth;
         Util.moveChildrenToRow(this.var_2257,["owner_caption","owner_name"],this.var_1029.x,this.var_1029.y,3);
         this.var_822.width = this.var_822.textWidth;
         Util.moveChildrenToRow(this.var_2259,["rating_caption","rating_txt"],this.var_822.x,this.var_822.y,3);
         this.var_1275.height = this.var_1275.textHeight + 5;
         Util.moveChildrenToColumn(this.var_821,["embed_info_txt","embed_src_txt"],this.var_1275.y,2);
         this.var_821.height = Util.getLowestPoint(this.var_821) + 5;
         this.var_2579 = this._window.y + this._window.height;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_309.active)
         {
            return;
         }
         this.var_2258.text = param1.eventName;
         this.var_676.text = param1.eventDescription;
         this.var_1112.refreshTags(this.var_823,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_676.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_676.height = this.var_676.textHeight + 5;
            this.var_676.y = Util.getLowestPoint(this.var_823) + 2;
            this.var_676.visible = true;
         }
         this.var_823.visible = true;
         this.var_823.height = Util.getLowestPoint(this.var_823);
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         this._window.height = Util.getLowestPoint(this._window);
         this._window.y = this._window.desktop.height - this._window.height - 5;
         Logger.log("MAIN: " + this.var_261.rectangle + ", " + this.var_231.rectangle + ", " + this._window.rectangle);
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      public function method_1() : void
      {
         this.refresh();
      }
      
      public function close() : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_971,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
