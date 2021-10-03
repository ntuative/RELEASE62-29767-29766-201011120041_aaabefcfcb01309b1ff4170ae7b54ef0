package com.sulake.habbo.ui
{
   import com.sulake.habbo.room.events.RoomEngineDimmerStateEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEvent;
   import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEventPresetItem;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetDimmerStateUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDimmerUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetDimmerChangeStateMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetDimmerPreviewMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetDimmerSavePresetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import flash.events.Event;
   
   public class FurnitureDimmerWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_911:Boolean = false;
      
      public function FurnitureDimmerWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_427;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_911;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         if(this._container == null || this._container.events == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomSessionDimmerPresetsEvent.const_500:
               _loc2_ = param1 as RoomSessionDimmerPresetsEvent;
               _loc3_ = new RoomWidgetDimmerUpdateEvent(RoomWidgetDimmerUpdateEvent.const_642);
               _loc3_.selectedPresetId = _loc2_.selectedPresetId;
               _loc6_ = 0;
               while(_loc6_ < _loc2_.presetCount)
               {
                  _loc7_ = _loc2_.getPreset(_loc6_);
                  if(_loc7_ != null)
                  {
                     _loc3_.storePreset(_loc7_.id,_loc7_.type,_loc7_.color,_loc7_.light);
                  }
                  _loc6_++;
               }
               this._container.events.dispatchEvent(_loc3_);
               break;
            case RoomEngineDimmerStateEvent.const_62:
               _loc4_ = param1 as RoomEngineDimmerStateEvent;
               _loc5_ = new RoomWidgetDimmerStateUpdateEvent(_loc4_.state,_loc4_.presetId,_loc4_.effectId,_loc4_.color,_loc4_.brightness);
               this._container.events.dispatchEvent(_loc5_);
               break;
            case RoomEngineObjectEvent.ROOM_OBJECT_WIDGET_REMOVE_DIMMER:
               this._container.events.dispatchEvent(new RoomWidgetDimmerUpdateEvent(RoomWidgetDimmerUpdateEvent.const_679));
         }
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetFurniToWidgetMessage.const_744,RoomWidgetDimmerSavePresetMessage.const_556,RoomWidgetDimmerChangeStateMessage.const_678,RoomWidgetDimmerPreviewMessage.const_720];
      }
      
      private function validateRights() : Boolean
      {
         var _loc1_:Boolean = this._container.roomSession.isRoomOwner;
         var _loc2_:Boolean = this._container.sessionDataManager.isAnyRoomController;
         return _loc1_ || _loc2_;
      }
      
      public function update() : void
      {
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         switch(param1.type)
         {
            case RoomWidgetFurniToWidgetMessage.const_744:
               if(this.validateRights())
               {
                  this._container.roomSession.sendRoomDimmerGetPresetsMessage();
               }
               break;
            case RoomWidgetDimmerSavePresetMessage.const_556:
               if(this.validateRights())
               {
                  _loc5_ = param1 as RoomWidgetDimmerSavePresetMessage;
                  this._container.roomSession.sendRoomDimmerSavePresetMessage(_loc5_.presetNumber,_loc5_.effectTypeId,_loc5_.color,_loc5_.brightness,_loc5_.apply);
               }
               break;
            case RoomWidgetDimmerChangeStateMessage.const_678:
               if(this.validateRights())
               {
                  this._container.roomSession.sendRoomDimmerChangeStateMessage();
               }
               break;
            case RoomWidgetDimmerPreviewMessage.const_720:
               _loc2_ = this._container.roomSession.roomId;
               _loc3_ = this._container.roomSession.roomCategory;
               _loc4_ = param1 as RoomWidgetDimmerPreviewMessage;
               if(_loc4_ == null || this._container.roomEngine == null)
               {
                  return null;
               }
               this._container.roomEngine.updateObjectRoomColor(_loc2_,_loc3_,_loc4_.color,_loc4_.brightness,_loc4_.bgOnly);
               break;
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomSessionDimmerPresetsEvent.const_500);
         _loc1_.push(RoomEngineDimmerStateEvent.const_62);
         _loc1_.push(RoomEngineObjectEvent.ROOM_OBJECT_WIDGET_REMOVE_DIMMER);
         return _loc1_;
      }
      
      public function dispose() : void
      {
         this.var_911 = true;
         this._container = null;
      }
   }
}
