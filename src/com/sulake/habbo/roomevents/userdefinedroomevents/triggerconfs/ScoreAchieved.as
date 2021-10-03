package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import flash.events.Event;
   
   public class ScoreAchieved implements TriggerConf
   {
       
      
      private var var_917:SliderWindowController;
      
      private var var_85:HabboUserDefinedRoomEvents;
      
      public function ScoreAchieved()
      {
         super();
      }
      
      private function getInput(param1:IWindowContainer) : IWindowContainer
      {
         return param1.findChildByName("score_slider_cont") as IWindowContainer;
      }
      
      public function get hasStateSnapshot() : Boolean
      {
         return false;
      }
      
      public function readStringParamFromForm(param1:IWindowContainer) : String
      {
         return "";
      }
      
      public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      public function get code() : int
      {
         return TriggerConfCodes.var_1799;
      }
      
      public function onInit(param1:IWindowContainer, param2:HabboUserDefinedRoomEvents) : void
      {
         this.var_85 = param2;
         this.var_917 = new SliderWindowController(param2,this.getInput(param1),param2.assets,1,1000,1);
         this.var_917.setValue(1);
         this.var_917.addEventListener(Event.CHANGE,this.onSliderChange);
      }
      
      public function get requiresFurni() : Boolean
      {
         return false;
      }
      
      public function onEditStart(param1:IWindowContainer, param2:Triggerable) : void
      {
         var _loc3_:int = param2.intParams[0];
         this.var_917.setValue(_loc3_);
      }
      
      public function readIntParamsFromForm(param1:IWindowContainer) : Array
      {
         var _loc2_:Array = new Array();
         _loc2_.push(this.var_917.getValue());
         return _loc2_;
      }
      
      private function onSliderChange(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         if(param1.type == Event.CHANGE)
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc3_ = _loc2_.getValue();
               _loc4_ = int(_loc3_);
               this.var_85.localization.registerParameter("wiredfurni.params.setscore","points","" + _loc4_);
            }
         }
      }
   }
}
