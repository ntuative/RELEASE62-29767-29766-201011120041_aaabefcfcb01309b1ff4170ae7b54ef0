package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.RoomVisitData;
   import com.sulake.habbo.communication.messages.incoming.moderation.RoomVisitsData;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetRoomVisitsMessageComposer;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomVisitsCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_105:Array;
      
      private var _disposed:Boolean;
      
      private var var_54:IItemListWindow;
      
      private var var_46:ModerationManager;
      
      private var var_2084:IWindowContainer;
      
      private var _userId:int;
      
      private var _frame:IFrameWindow;
      
      private var var_415:Timer;
      
      public function RoomVisitsCtrl(param1:ModerationManager, param2:int)
      {
         super();
         this.var_46 = param1;
         this._userId = param2;
      }
      
      public static function getFormattedTime(param1:int, param2:int) : String
      {
         return padToTwoDigits(param1) + ":" + padToTwoDigits(param2);
      }
      
      public static function padToTwoDigits(param1:int) : String
      {
         return param1 < 10 ? "0" + param1 : "" + param1;
      }
      
      public function onRoomVisits(param1:RoomVisitsData) : void
      {
         if(param1.userId != this._userId)
         {
            return;
         }
         if(this._disposed)
         {
            return;
         }
         this.var_105 = param1.rooms;
         this._frame.caption = "Room visits: " + param1.userName;
         this.populate();
         this.onResizeTimer(null);
         this._frame.visible = true;
         this.var_46.messageHandler.removeRoomVisitsListener(this);
      }
      
      public function getId() : String
      {
         return "" + this._userId;
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         var _loc2_:IWindowContainer = IWindowContainer(this.var_54.parent);
         var _loc3_:IWindow = _loc2_.getChildByName("scroller") as IWindow;
         var _loc4_:* = this.var_54.scrollableRegion.height > this.var_54.height;
         if(_loc3_.visible)
         {
            if(!_loc4_)
            {
               _loc3_.visible = false;
               this.var_54.width += 17;
            }
         }
         else if(_loc4_)
         {
            _loc3_.visible = true;
            this.var_54.width -= 17;
         }
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.dispose();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this._frame != null)
         {
            this._frame.destroy();
            this._frame = null;
         }
         this.var_46 = null;
      }
      
      private function populate() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = true;
         for each(_loc2_ in this.var_105)
         {
            this.populateRoomRow(_loc2_,_loc1_);
            _loc1_ = !_loc1_;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_45 || param2 != this._frame)
         {
            return;
         }
         if(!this.var_415.running)
         {
            this.var_415.reset();
            this.var_415.start();
         }
      }
      
      private function populateRoomRow(param1:RoomVisitData, param2:Boolean) : void
      {
         var _loc3_:IWindowContainer = IWindowContainer(this.var_2084.clone());
         var _loc4_:uint = !!param2 ? 4288861930 : uint(4294967295);
         _loc3_.color = _loc4_;
         var _loc5_:IWindow = _loc3_.findChildByName("room_name_txt");
         _loc5_.caption = param1.roomName;
         new OpenRoomTool(this._frame,this.var_46,_loc5_,param1.isPublic,param1.roomId);
         _loc5_.color = _loc4_;
         var _loc6_:ITextWindow = ITextWindow(_loc3_.findChildByName("time_txt"));
         _loc6_.text = getFormattedTime(param1.enterHour,param1.enterMinute);
         var _loc7_:ITextWindow = ITextWindow(_loc3_.findChildByName("view_room_txt"));
         new OpenRoomInSpectatorMode(this.var_46,_loc7_,param1.isPublic,param1.roomId);
         _loc7_.color = _loc4_;
         this.var_54.addListItem(_loc3_);
      }
      
      public function show() : void
      {
         this.var_2084 = IWindowContainer(this.var_46.getXmlWindow("roomvisits_row"));
         this.var_415 = new Timer(300,1);
         this.var_415.addEventListener(TimerEvent.TIMER,this.onResizeTimer);
         this.var_46.messageHandler.addRoomVisitsListener(this);
         this.var_46.connection.send(new GetRoomVisitsMessageComposer(this._userId));
         this._frame = IFrameWindow(this.var_46.getXmlWindow("roomvisits_frame"));
         this.var_54 = IItemListWindow(this._frame.findChildByName("visits_list"));
         this._frame.procedure = this.onWindow;
         var _loc1_:IWindow = this._frame.findChildByTag("close");
         _loc1_.procedure = this.onClose;
      }
      
      public function getFrame() : IFrameWindow
      {
         return this._frame;
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1225;
      }
   }
}
