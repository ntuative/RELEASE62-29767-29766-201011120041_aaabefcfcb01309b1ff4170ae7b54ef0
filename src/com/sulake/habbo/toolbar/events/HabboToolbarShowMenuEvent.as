package com.sulake.habbo.toolbar.events
{
   import com.sulake.core.window.IWindowContainer;
   import flash.events.Event;
   
   public class HabboToolbarShowMenuEvent extends Event
   {
      
      public static const const_784:String = "HTSME_DISPLAY_WINDOW";
      
      public static const const_971:String = "HTSME_HIDE_WINDOW";
      
      public static const const_446:String = "HTSME_ANIMATE_MENU_OUT";
      
      public static const const_50:String = "HTSME_ANIMATE_MENU_IN";
       
      
      private var var_1966:String;
      
      private var var_2289:Boolean;
      
      private var _window:IWindowContainer;
      
      public function HabboToolbarShowMenuEvent(param1:String, param2:String, param3:IWindowContainer, param4:Boolean = true, param5:Boolean = false, param6:Boolean = false)
      {
         this.var_1966 = param2;
         this._window = param3;
         this.var_2289 = param4;
         super(param1,param5,param6);
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function get menuId() : String
      {
         return this.var_1966;
      }
      
      public function get alignToIcon() : Boolean
      {
         return this.var_2289;
      }
   }
}
