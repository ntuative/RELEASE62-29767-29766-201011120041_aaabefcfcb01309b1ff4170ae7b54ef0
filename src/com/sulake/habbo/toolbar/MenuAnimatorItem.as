package com.sulake.habbo.toolbar
{
   import com.sulake.core.window.IWindowContainer;
   import flash.geom.Point;
   
   public class MenuAnimatorItem
   {
       
      
      private var var_1966:String;
      
      private var var_1965:Array;
      
      private var _window:IWindowContainer;
      
      private var var_679:String;
      
      private var _icon:ToolbarIcon;
      
      private var _active:Boolean;
      
      private var var_2370:Point;
      
      private var _target:Point;
      
      private var var_336:Boolean;
      
      private var var_1964:Boolean;
      
      public function MenuAnimatorItem(param1:String, param2:ToolbarIcon)
      {
         super();
         this.var_1966 = param1;
         this._icon = param2;
      }
      
      public function get visible() : Boolean
      {
         return this.var_336;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_1964;
      }
      
      public function get offsetLoc() : Point
      {
         return this.var_2370;
      }
      
      public function get windowOffsetFromIcon() : int
      {
         return this._icon.windowOffsetFromIcon;
      }
      
      public function get yieldList() : Array
      {
         return this.var_1965;
      }
      
      public function get active() : Boolean
      {
         return this._active;
      }
      
      public function get target() : Point
      {
         return this._target;
      }
      
      public function set lockToIcon(param1:Boolean) : void
      {
         this.var_1964 = param1;
      }
      
      public function get menuId() : String
      {
         return this.var_1966;
      }
      
      public function set active(param1:Boolean) : void
      {
         this._active = param1;
      }
      
      public function set yieldList(param1:Array) : void
      {
         this.var_1965 = param1;
      }
      
      public function set offsetLoc(param1:Point) : void
      {
         this.var_2370 = param1;
      }
      
      public function set target(param1:Point) : void
      {
         this._target = param1;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.var_336 = param1;
      }
      
      public function set window(param1:IWindowContainer) : void
      {
         this._window = param1;
      }
      
      public function set iconId(param1:String) : void
      {
         this.var_679 = param1;
      }
      
      public function get iconId() : String
      {
         return this.var_679;
      }
      
      public function get margin() : int
      {
         return this._icon.windowMargin;
      }
      
      public function get bottomMargin() : int
      {
         return this._icon.group.windowBottomMargin;
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
   }
}
