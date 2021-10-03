package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_283:String = "WE_CHILD_RESIZED";
      
      public static const const_1424:String = "WE_CLOSE";
      
      public static const const_1248:String = "WE_DESTROY";
      
      public static const const_102:String = "WE_CHANGE";
      
      public static const const_1325:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1719:String = "WE_PARENT_RESIZE";
      
      public static const const_95:String = "WE_UPDATE";
      
      public static const const_1339:String = "WE_MAXIMIZE";
      
      public static const const_467:String = "WE_SCROLL";
      
      public static const const_276:String = "WE_DESTROYED";
      
      public static const const_574:String = "WE_UNSELECT";
      
      public static const const_1319:String = "WE_MAXIMIZED";
      
      public static const const_1262:String = "WE_UNLOCKED";
      
      public static const const_474:String = "WE_CHILD_REMOVED";
      
      public static const const_179:String = "WE_OK";
      
      public static const const_45:String = "WE_RESIZED";
      
      public static const const_1264:String = "WE_ACTIVATE";
      
      public static const const_265:String = "WE_ENABLED";
      
      public static const const_502:String = "WE_CHILD_RELOCATED";
      
      public static const const_1268:String = "WE_CREATE";
      
      public static const const_387:String = "WE_SELECT";
      
      public static const const_153:String = "";
      
      public static const const_1341:String = "WE_LOCKED";
      
      public static const const_1693:String = "WE_PARENT_RELOCATE";
      
      public static const const_1588:String = "WE_CHILD_REMOVE";
      
      public static const const_1685:String = "WE_CHILD_RELOCATE";
      
      public static const const_1288:String = "WE_LOCK";
      
      public static const const_295:String = "WE_FOCUSED";
      
      public static const const_625:String = "WE_UNSELECTED";
      
      public static const const_905:String = "WE_DEACTIVATED";
      
      public static const const_1280:String = "WE_MINIMIZED";
      
      public static const const_1561:String = "WE_ARRANGED";
      
      public static const const_1475:String = "WE_UNLOCK";
      
      public static const const_1567:String = "WE_ATTACH";
      
      public static const const_1231:String = "WE_OPEN";
      
      public static const const_1443:String = "WE_RESTORE";
      
      public static const const_1662:String = "WE_PARENT_RELOCATED";
      
      public static const const_1390:String = "WE_RELOCATE";
      
      public static const const_1530:String = "WE_CHILD_RESIZE";
      
      public static const const_1648:String = "WE_ARRANGE";
      
      public static const const_1454:String = "WE_OPENED";
      
      public static const const_1335:String = "WE_CLOSED";
      
      public static const const_1671:String = "WE_DETACHED";
      
      public static const const_1608:String = "WE_UPDATED";
      
      public static const const_1261:String = "WE_UNFOCUSED";
      
      public static const const_312:String = "WE_RELOCATED";
      
      public static const const_1241:String = "WE_DEACTIVATE";
      
      public static const const_235:String = "WE_DISABLED";
      
      public static const const_604:String = "WE_CANCEL";
      
      public static const const_706:String = "WE_ENABLE";
      
      public static const const_1279:String = "WE_ACTIVATED";
      
      public static const const_1255:String = "WE_FOCUS";
      
      public static const const_1679:String = "WE_DETACH";
      
      public static const const_1240:String = "WE_RESTORED";
      
      public static const const_1430:String = "WE_UNFOCUS";
      
      public static const const_61:String = "WE_SELECTED";
      
      public static const const_1236:String = "WE_PARENT_RESIZED";
      
      public static const const_1263:String = "WE_CREATED";
      
      public static const const_1542:String = "WE_ATTACHED";
      
      public static const const_1389:String = "WE_MINIMIZE";
      
      public static const const_617:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1823:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1822:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_1823 = param3;
         this.var_1822 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1822;
      }
      
      public function get related() : IWindow
      {
         return this.var_1823;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            this.var_1822 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
