package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.INameChangeUI;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class TutorialUI implements INameChangeUI
   {
      
      public static const const_331:String = "TUI_NAME_VIEW";
      
      public static const const_86:String = "TUI_MAIN_VIEW";
      
      public static const const_330:String = "TUI_CLOTHES_VIEW";
      
      public static const const_442:String = "TUI_GUIDEBOT_VIEW";
       
      
      private var var_1266:Boolean = false;
      
      private var var_1018:Boolean = false;
      
      private var _window:IFrameWindow;
      
      private var var_37:ITutorialUIView;
      
      private var var_46:HabboHelp;
      
      private var var_1586:Boolean = false;
      
      private var var_1697:int = 0;
      
      private var var_1265:Boolean = false;
      
      private var var_1696:int = 0;
      
      private var var_305:NameChangeView;
      
      public function TutorialUI(param1:HabboHelp)
      {
         super();
         this.var_46 = param1;
         this.var_46.events.addEventListener(HabboHelpTutorialEvent.const_430,this.onTaskDoneEvent);
         this.var_46.events.addEventListener(HabboHelpTutorialEvent.const_468,this.onTaskDoneEvent);
         this.var_46.events.addEventListener(HabboHelpTutorialEvent.const_511,this.onTaskDoneEvent);
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1266;
      }
      
      public function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ChangeUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_488)
         {
            this.var_1018 = true;
            this.showView(TutorialUI.const_86);
         }
         else
         {
            this.var_305.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function onUserNameChanged(param1:String) : void
      {
         var name:String = param1;
         if(!this.var_46 || !this.var_46.localization || !this.var_46.windowManager)
         {
            return;
         }
         this.var_1018 = true;
         this.var_46.localization.registerParameter("help.tutorial.name.changed","name",name);
         this.var_46.windowManager.alert("${generic.notice}","${help.tutorial.name.changed}",0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
         if(this.var_37 != null && (this.var_37.id == const_331 || this.var_37.id == const_86))
         {
            this.showView(const_86);
         }
      }
      
      public function onUserChanged() : void
      {
         this.var_1265 = true;
         if(this.var_37 != null && (this.var_37.id == const_330 || this.var_37.id == const_86))
         {
            this.showView(const_86);
         }
      }
      
      public function get assets() : IAssetLibrary
      {
         return this.var_46.assets;
      }
      
      public function onTaskDoneEvent(param1:HabboHelpTutorialEvent) : void
      {
         switch(param1.type)
         {
            case HabboHelpTutorialEvent.const_430:
               this.var_1266 = true;
               if(this.var_37 != null && this.var_37.id == const_442)
               {
                  this.showView(const_86);
               }
               break;
            case HabboHelpTutorialEvent.const_468:
               if(this.var_37 != null && this.var_37.id == const_330)
               {
                  this.var_1586 = true;
                  this.disposeWindow();
               }
               break;
            case HabboHelpTutorialEvent.const_511:
               if(this.var_1586)
               {
                  this.var_1586 = false;
                  this.showView(const_86);
               }
         }
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_46.localization;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1265;
      }
      
      public function dispose() : void
      {
         this.disposeView();
         if(this.var_46)
         {
            this.var_46.events.removeEventListener(HabboHelpTutorialEvent.const_430,this.onTaskDoneEvent);
            this.var_46.events.removeEventListener(HabboHelpTutorialEvent.const_468,this.onTaskDoneEvent);
            this.var_46.events.removeEventListener(HabboHelpTutorialEvent.const_511,this.onTaskDoneEvent);
            this.var_46 = null;
         }
      }
      
      public function buildXmlWindow(param1:String, param2:uint = 1) : IWindow
      {
         if(this.var_46 == null || this.var_46.assets == null)
         {
            return null;
         }
         var _loc3_:XmlAsset = XmlAsset(this.var_46.assets.getAssetByName(param1 + "_xml"));
         if(_loc3_ == null || this.var_46.windowManager == null)
         {
            return null;
         }
         var _loc4_:ICoreWindowManager = ICoreWindowManager(this.var_46.windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content),param2);
      }
      
      public function get hasTasksDone() : Boolean
      {
         return this.var_1265 && this.var_1018 && this.var_1266;
      }
      
      public function prepareForTutorial() : void
      {
         if(this.var_46 == null || this.var_46.events == null)
         {
            return;
         }
         this.var_46.hideUI();
         this.var_46.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_108));
      }
      
      public function get help() : HabboHelp
      {
         return this.var_46;
      }
      
      public function showView(param1:String) : void
      {
         var _loc2_:* = null;
         if(this.hasTasksDone)
         {
            if(this.var_46)
            {
               this.var_46.removeTutorialUI();
            }
            return;
         }
         var _loc3_:Boolean = false;
         if(this._window == null)
         {
            this._window = this.buildXmlWindow("tutorial_frame") as IFrameWindow;
            if(this._window == null)
            {
               return;
            }
            this._window.procedure = this.windowProcedure;
            _loc2_ = this._window.findChildByName("content_list") as IItemListWindow;
            if(_loc2_ == null)
            {
               return;
            }
            this.var_1696 = this._window.width - _loc2_.width;
            this.var_1697 = this._window.height;
            _loc3_ = true;
         }
         _loc2_ = this._window.findChildByName("content_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.destroyListItems();
         _loc2_.height = 0;
         if(this.var_37 != null)
         {
            this.var_37.dispose();
         }
         this._window.visible = true;
         switch(param1)
         {
            case const_86:
               this.var_37 = new TutorialMainView(_loc2_,this);
               if(this.var_305 != null)
               {
                  this.var_305.dispose();
               }
               break;
            case const_331:
               this._window.visible = false;
               if(this.var_305 == null)
               {
                  this.var_305 = new NameChangeView(this);
               }
               this.var_305.showMainView();
               this.prepareForTutorial();
               break;
            case const_330:
               this.var_37 = new TutorialClothesChangeView(_loc2_,this);
               break;
            case const_442:
               this.var_37 = new TutorialCallGuideBotView(_loc2_,this);
         }
         this._window.height = _loc2_.height + this.var_1697;
         this._window.width = _loc2_.width + this.var_1696;
         if(_loc3_)
         {
            if(this._window == null)
            {
               return;
            }
            this._window.x = this._window.context.getDesktopWindow().width / 2 - this._window.width / 2;
            this._window.y = 0;
         }
      }
      
      public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(param2.name == "header_button_close")
               {
                  this.disposeView();
               }
         }
      }
      
      public function update(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         this.var_1265 = param1;
         this.var_1018 = param2;
         this.var_1266 = param3;
         if(this.var_37 == null || this.var_37.id == const_86)
         {
            this.prepareForTutorial();
            this.showView(const_86);
         }
      }
      
      public function setRoomSessionStatus(param1:Boolean) : void
      {
         if(param1 == false)
         {
            this.disposeView();
         }
      }
      
      public function checkName(param1:String) : void
      {
         this.disposeWindow();
         this.var_46.sendMessage(new CheckUserNameMessageComposer(param1));
      }
      
      public function get myName() : String
      {
         return this.var_46.ownUserName;
      }
      
      public function changeName(param1:String) : void
      {
         this.disposeWindow();
         this.var_46.sendMessage(new ChangeUserNameMessageComposer(param1));
      }
      
      private function disposeView() : void
      {
         if(this.var_37 != null)
         {
            this.var_37.dispose();
            this.var_37 = null;
         }
         if(this.var_305 != null)
         {
            this.var_305.dispose();
            this.var_305 = null;
         }
         this.disposeWindow();
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1018;
      }
      
      private function disposeWindow(param1:WindowEvent = null) : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function onCheckUserNameResult(param1:CheckUserNameResultMessageEvent) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:CheckUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_488)
         {
            this.var_305.checkedName = _loc2_.name;
         }
         else
         {
            this.var_305.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
   }
}
