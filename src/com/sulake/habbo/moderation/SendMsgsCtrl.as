package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModMessageMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class SendMsgsCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_1216:String;
      
      private var _disposed:Boolean;
      
      private var var_1473:String;
      
      private var var_1215:int;
      
      private var var_46:ModerationManager;
      
      private var var_975:IDropMenuWindow;
      
      private var var_431:ITextFieldWindow;
      
      private var _frame:IFrameWindow;
      
      private var var_534:Boolean = true;
      
      public function SendMsgsCtrl(param1:ModerationManager, param2:int, param3:String, param4:String)
      {
         super();
         this.var_46 = param1;
         this.var_1215 = param2;
         this.var_1473 = param3;
         this.var_1216 = param4;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_295)
         {
            return;
         }
         if(!this.var_534)
         {
            return;
         }
         this.var_431.text = "";
         this.var_534 = false;
      }
      
      public function getFrame() : IFrameWindow
      {
         return this._frame;
      }
      
      public function getId() : String
      {
         return this.var_1473;
      }
      
      private function onSendMessageButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         if(this.var_534 || this.var_431.text == "")
         {
            this.var_46.windowManager.alert("Alert","You must input a message to the user",0,this.onAlertClose);
            return;
         }
         this.var_46.connection.send(new ModMessageMessageComposer(this.var_1215,this.var_431.text,this.var_1216));
         this.dispose();
      }
      
      public function show() : void
      {
         this._frame = IFrameWindow(this.var_46.getXmlWindow("send_msgs"));
         this._frame.caption = "Msg To: " + this.var_1473;
         this._frame.findChildByName("send_message_but").procedure = this.onSendMessageButton;
         this.var_431 = ITextFieldWindow(this._frame.findChildByName("message_input"));
         this.var_431.procedure = this.onInputClick;
         this.var_975 = IDropMenuWindow(this._frame.findChildByName("msgTemplatesSelect"));
         this.prepareMsgSelect(this.var_975);
         this.var_975.procedure = this.onSelectTemplate;
         var _loc1_:IWindow = this._frame.findChildByTag("close");
         _loc1_.procedure = this.onClose;
         this._frame.visible = true;
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + this.var_46.initMsg.messageTemplates.length);
         param1.populate(this.var_46.initMsg.messageTemplates);
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this._frame != null)
         {
            this._frame.destroy();
            this._frame = null;
         }
         this.var_975 = null;
         this.var_431 = null;
         this.var_46 = null;
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_61)
         {
            return;
         }
         var _loc3_:String = this.var_46.initMsg.messageTemplates[this.var_975.selection];
         if(_loc3_ != null)
         {
            this.var_534 = false;
            this.var_431.text = _loc3_;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.dispose();
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1345;
      }
   }
}
