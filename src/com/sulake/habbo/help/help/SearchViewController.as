package com.sulake.habbo.help.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.help.SearchFaqsMessageComposer;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.Event;
   import flash.ui.Keyboard;
   
   public class SearchViewController extends HelpViewController
   {
      
      private static const const_1211:int = 3;
       
      
      private var var_1370:Boolean = false;
      
      public function SearchViewController(param1:HelpUI, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
      }
      
      override public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "help_faq_search":
                  this.sendFaqSearch();
                  return;
               case "help_faq_search_input":
                  if(!this.var_1370)
                  {
                     this.resetFaqSearchField();
                  }
                  this.var_1370 = true;
                  return;
            }
         }
         super.windowProcedure(param1,param2);
      }
      
      private function sendFaqSearch() : void
      {
         if(container == null)
         {
            return;
         }
         var _loc1_:ITextFieldWindow = container.findChildByName("help_faq_search_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:String = _loc1_.text;
         if(_loc2_ == main.lastSearchString)
         {
            return;
         }
         if(_loc2_.length < const_1211)
         {
            return;
         }
         main.sendMessage(new SearchFaqsMessageComposer(_loc2_));
         main.lastSearchString = _loc2_;
         this.var_1370 = false;
      }
      
      private function resetFaqSearchField() : void
      {
         if(container == null)
         {
            return;
         }
         var _loc1_:ITextFieldWindow = container.findChildByName("help_faq_search_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.text = "";
      }
      
      override public function render() : void
      {
         var _loc1_:* = null;
         super.render();
         this.var_1370 = false;
         if(container != null)
         {
            _loc1_ = container.findChildByName("help_faq_search_input") as ITextFieldWindow;
            _loc1_.addEventListener(WindowKeyboardEvent.const_141,this.windowKeyEventProcessor);
         }
      }
      
      public function windowKeyEventProcessor(param1:Event = null, param2:IWindow = null) : void
      {
         var _loc3_:WindowKeyboardEvent = param1 as WindowKeyboardEvent;
         var _loc4_:uint = _loc3_.charCode;
         if(_loc4_ == Keyboard.ENTER)
         {
            this.sendFaqSearch();
         }
      }
   }
}
