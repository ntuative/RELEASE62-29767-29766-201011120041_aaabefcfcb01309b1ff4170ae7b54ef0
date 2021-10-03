package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.navigator.domain.Tabs;
   
   public class TextSearchInputs
   {
       
      
      private var var_2596:IButtonWindow;
      
      private var var_714:TextFieldManager;
      
      private var _navigator:HabboNavigator;
      
      private var var_2555:Boolean;
      
      public function TextSearchInputs(param1:HabboNavigator, param2:Boolean, param3:IWindowContainer)
      {
         super();
         this._navigator = param1;
         this.var_2555 = param2;
         this.var_714 = new TextFieldManager(this._navigator,ITextFieldWindow(param3.findChildByName("search_str")),25,this.searchRooms,this._navigator.getText("navigator.search.info"));
         Util.setProc(param3,"search_but",this.onSearchButtonClick);
      }
      
      public function get searchStr() : TextFieldManager
      {
         return this.var_714;
      }
      
      private function onSearchButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.searchRooms();
      }
      
      private function searchRooms() : void
      {
         var _loc1_:String = this.var_714.getText();
         if(_loc1_ == "")
         {
            return;
         }
         this._navigator.mainViewCtrl.startSearch(Tabs.const_223,Tabs.const_250,_loc1_);
      }
   }
}
