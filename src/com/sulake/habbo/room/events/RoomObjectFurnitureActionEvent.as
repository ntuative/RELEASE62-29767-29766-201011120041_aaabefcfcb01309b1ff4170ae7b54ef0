package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectFurnitureActionEvent extends RoomObjectEvent
   {
      
      public static const const_497:String = "ROFCAE_DICE_ACTIVATE";
      
      public static const const_438:String = "ROFCAE_STICKIE";
      
      public static const const_436:String = "ROFCAE_JUKEBOX_DISPOSE";
      
      public static const const_479:String = "ROFCAE_DICE_OFF";
      
      public static const const_457:String = "ROFCAE_JUKEBOX_INIT";
      
      public static const const_482:String = "ROFCAE_SOUND_MACHINE_STOP";
      
      public static const ROOM_OBJECT_USE_HABBOWHEEL:String = "ROFCAE_USE_HABBOWHEEL";
      
      public static const const_521:String = "ROFCAE_ENTER_ONEWAYDOOR";
      
      public static const const_520:String = "ROFCAE_SOUND_MACHINE_DISPOSE";
      
      public static const const_492:String = "ROFCAE_SOUND_MACHINE_START";
       
      
      public function RoomObjectFurnitureActionEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
