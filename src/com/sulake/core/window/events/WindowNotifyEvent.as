package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1440:String = "WN_CREATED";
      
      public static const const_997:String = "WN_DISABLE";
      
      public static const const_1019:String = "WN_DEACTIVATED";
      
      public static const const_925:String = "WN_OPENED";
      
      public static const const_887:String = "WN_CLOSED";
      
      public static const const_974:String = "WN_DESTROY";
      
      public static const const_1751:String = "WN_ARRANGED";
      
      public static const const_388:String = "WN_PARENT_RESIZED";
      
      public static const const_901:String = "WN_ENABLE";
      
      public static const const_906:String = "WN_RELOCATE";
      
      public static const const_1051:String = "WN_FOCUS";
      
      public static const const_1021:String = "WN_PARENT_RELOCATED";
      
      public static const const_443:String = "WN_PARAM_UPDATED";
      
      public static const const_751:String = "WN_PARENT_ACTIVATED";
      
      public static const const_167:String = "WN_RESIZED";
      
      public static const const_984:String = "WN_CLOSE";
      
      public static const const_914:String = "WN_PARENT_REMOVED";
      
      public static const const_278:String = "WN_CHILD_RELOCATED";
      
      public static const const_772:String = "WN_ENABLED";
      
      public static const WINDOW_NOTIFY_CHILD_RESIZED:String = "WN_CHILD_RESIZED";
      
      public static const const_936:String = "WN_MINIMIZED";
      
      public static const const_589:String = "WN_DISABLED";
      
      public static const const_239:String = "WN_CHILD_ACTIVATED";
      
      public static const const_458:String = "WN_STATE_UPDATED";
      
      public static const const_685:String = "WN_UNSELECTED";
      
      public static const const_456:String = "WN_STYLE_UPDATED";
      
      public static const const_1595:String = "WN_UPDATE";
      
      public static const const_512:String = "WN_PARENT_ADDED";
      
      public static const const_722:String = "WN_RESIZE";
      
      public static const const_623:String = "WN_CHILD_REMOVED";
      
      public static const const_1552:String = "";
      
      public static const const_1061:String = "WN_RESTORED";
      
      public static const const_352:String = "WN_SELECTED";
      
      public static const const_888:String = "WN_MINIMIZE";
      
      public static const const_918:String = "WN_FOCUSED";
      
      public static const const_867:String = "WN_LOCK";
      
      public static const const_335:String = "WN_CHILD_ADDED";
      
      public static const const_876:String = "WN_UNFOCUSED";
      
      public static const const_522:String = "WN_RELOCATED";
      
      public static const const_1076:String = "WN_DEACTIVATE";
      
      public static const const_1277:String = "WN_CRETAE";
      
      public static const const_979:String = "WN_RESTORE";
      
      public static const const_332:String = "WN_ACTVATED";
      
      public static const const_872:String = "WN_LOCKED";
      
      public static const const_453:String = "WN_SELECT";
      
      public static const const_1009:String = "WN_MAXIMIZE";
      
      public static const const_940:String = "WN_OPEN";
      
      public static const const_661:String = "WN_UNSELECT";
      
      public static const const_1668:String = "WN_ARRANGE";
      
      public static const const_873:String = "WN_UNLOCKED";
      
      public static const const_1650:String = "WN_UPDATED";
      
      public static const const_916:String = "WN_ACTIVATE";
      
      public static const const_898:String = "WN_UNLOCK";
      
      public static const const_904:String = "WN_MAXIMIZED";
      
      public static const const_970:String = "WN_DESTROYED";
      
      public static const const_961:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1823,cancelable);
      }
   }
}
