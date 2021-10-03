package com.sulake.habbo.communication.demo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.IHabboWebLogin;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Rectangle;
   import flash.net.SharedObject;
   
   public class HabboLoginDemoView extends EventDispatcher
   {
      
      public static const const_499:String = "InitConnection";
       
      
      private const const_1500:String = "fuselogin";
      
      public var name:String = "";
      
      private var _window:IWindowContainer;
      
      private var var_154:HabboCommunicationDemo;
      
      public var password:String = "";
      
      private var var_155:SSOTicket;
      
      public function HabboLoginDemoView(param1:HabboCommunicationDemo)
      {
         super();
         this.var_154 = param1;
         this.createWindow();
      }
      
      public function closeLoginWindow() : void
      {
         this.var_154.windowManager.removeWindow("habbo_login_window");
      }
      
      public function get useSSOTicket() : Boolean
      {
         var _loc1_:ISelectableWindow = this._window.findChildByName("useTicket") as ISelectableWindow;
         if(_loc1_ != null)
         {
            return _loc1_.isSelected;
         }
         return false;
      }
      
      private function onParsedTicketSuccess(param1:Event) : void
      {
         Logger.log("Got ticket: " + this.var_155.ticket);
         this.var_154.shockwaveClientUrl = this.var_155.shockwaveClientUrl;
         this.var_154.ssoTicket = this.var_155.ticket;
         this.var_155.removeEventListener(SSOTicket.const_322,this.onParsedTicketSuccess);
         this.var_155.removeEventListener(SSOTicket.const_269,this.onParsedTicketFailure);
         this.var_155 = null;
         dispatchEvent(new Event(const_499));
      }
      
      private function windowEventProcessor(param1:WindowEvent = null, param2:IWindow = null) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:IWindowContainer = param1.target.parent as IWindowContainer;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.findChildByName("input001") as ITextFieldWindow;
            _loc5_ = _loc3_.findChildByName("input002") as ITextFieldWindow;
            if(_loc4_ != null)
            {
               this.name = _loc4_.text;
            }
            if(_loc5_ != null)
            {
               this.password = _loc5_.text;
            }
            _loc6_ = SharedObject.getLocal(this.const_1500,"/");
            _loc6_.data.login = this.name;
            _loc6_.data.password = this.password;
            _loc6_.flush();
         }
         if(this.useSSOTicket)
         {
            this.initSSOTicket();
         }
         else
         {
            dispatchEvent(new Event(const_499));
         }
      }
      
      private function createWindow() : void
      {
         var _loc1_:XmlAsset = (this.var_154 as Component).assets.getAssetByName("login_window") as XmlAsset;
         if(_loc1_ == null)
         {
            Logger.log("Could  not find embedded Window XML for Login Window, login_window");
            return;
         }
         this._window = this.var_154.windowManager.createWindow("habbo_login_window","Login",HabboWindowType.const_135,HabboWindowStyle.const_36,0 | 0,new Rectangle(10,10,320,240),null) as IFrameWindow;
         var _loc2_:XML = _loc1_.content as XML;
         var _loc3_:IWindowContainer = this.var_154.windowManager.buildFromXML(_loc2_) as IWindowContainer;
         this._window.addChild(_loc3_);
         this._window.width = _loc3_.width + 20;
         this._window.height = _loc3_.height + 40;
         _loc3_.x = 10;
         _loc3_.y = 30;
         this._window.center();
         var _loc4_:IButtonWindow = _loc3_.findChildByName("button001") as IButtonWindow;
         var _loc5_:ITextFieldWindow = _loc3_.findChildByName("input001") as ITextFieldWindow;
         var _loc6_:ITextFieldWindow = _loc3_.findChildByName("input002") as ITextFieldWindow;
         if(_loc4_ != null)
         {
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.windowEventProcessor);
         }
         else
         {
            Logger.log("Could not find the button");
         }
         var _loc7_:SharedObject = SharedObject.getLocal(this.const_1500,"/");
         if(_loc5_ != null)
         {
            _loc5_.textBackground = true;
            _loc5_.textBackgroundColor = 16777215;
            if(_loc7_.data.login != null)
            {
               _loc5_.text = _loc7_.data.login;
            }
         }
         if(_loc6_ != null)
         {
            _loc6_.textBackground = true;
            _loc6_.textBackgroundColor = 16777215;
            if(_loc7_.data.password != null)
            {
               _loc6_.text = _loc7_.data.password;
            }
         }
         var _loc8_:ISelectableWindow = this._window.findChildByName("useTicket") as ISelectableWindow;
         if(this.var_154.habboConfiguration)
         {
            if(this.var_154.habboConfiguration.getKey("use.sso","false") == "true")
            {
               _loc8_.select();
            }
         }
      }
      
      public function displayResults(param1:String) : void
      {
         var _loc2_:ITextWindow = this._window.findChildByName("text002") as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.text = param1;
         }
      }
      
      private function listEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_154.sendTryLogin(this.name,this.password,param2.id);
      }
      
      private function initSSOTicket() : void
      {
         if(this.var_155 != null)
         {
            this.var_155.removeEventListener(SSOTicket.const_322,this.onParsedTicketSuccess);
            this.var_155.removeEventListener(SSOTicket.const_269,this.onParsedTicketFailure);
            this.var_155 = null;
         }
         var _loc1_:String = "";
         if(this.var_154.habboConfiguration != null)
         {
            _loc1_ = this.var_154.habboConfiguration.getKey("url.prefix",_loc1_);
            _loc1_ = _loc1_.replace("http://","");
            _loc1_ = _loc1_.replace("https://","");
         }
         var _loc2_:IHabboWebLogin = this.var_154.habboCommunication.habboWebLogin(this.name,this.password);
         this.var_155 = new SSOTicket(this.var_154.assets,_loc2_,_loc1_);
         this.var_155.addEventListener(SSOTicket.const_322,this.onParsedTicketSuccess);
         this.var_155.addEventListener(SSOTicket.const_269,this.onParsedTicketFailure);
      }
      
      private function onParsedTicketFailure(param1:Event) : void
      {
         Logger.log("Could not get a ticket! ");
         this.var_155.removeEventListener(SSOTicket.const_322,this.onParsedTicketSuccess);
         this.var_155.removeEventListener(SSOTicket.const_269,this.onParsedTicketFailure);
         this.var_155 = null;
         dispatchEvent(new Event(const_499));
      }
      
      public function populateUserList(param1:Map) : void
      {
         var _loc5_:* = null;
         var _loc2_:IItemListWindow = this._window.findChildByName("list") as IItemListWindow;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:XmlAsset = this.var_154.assets.getAssetByName("login_user_list_item") as XmlAsset;
         var _loc4_:IWindow = this.var_154.windowManager.buildFromXML(_loc3_.content as XML);
         _loc4_.procedure = this.listEventHandler;
         var _loc6_:int = 0;
         while(_loc6_ < param1.length)
         {
            _loc5_ = _loc4_.clone();
            _loc5_.id = param1.getKey(_loc6_);
            _loc5_.caption = param1.getWithIndex(_loc6_);
            _loc2_.addListItem(_loc5_);
            _loc6_++;
         }
         _loc4_.dispose();
      }
      
      public function dispose() : void
      {
      }
   }
}
